
local Tunnel = module("lib/Tunnel")
local client_areas = {}
local area_contexts = setmetatable({}, {__mode = "k"})
local area_enter_tolerance = 3.0
local area_leave_tolerance = 6.0

-- free client areas when leaving
AddEventHandler("vRP:playerLeave",function(user_id,source)
  client_areas[source] = nil 
end)

function vRP.getPlayerCoords(source)
  local ped = GetPlayerPed(source)
  if ped == nil or ped == 0 or not DoesEntityExist(ped) then
    return nil
  end
  return GetEntityCoords(ped)
end

local function isNearArea(source, area, tolerance)
  local coords = vRP.getPlayerCoords(source)
  if coords == nil then
    return true
  end
  local dx, dy, dz = coords.x - area.x, coords.y - area.y, coords.z - area.z
  return math.sqrt(dx*dx + dy*dy + dz*dz) <= area.radius + tolerance and math.abs(dz) <= area.height + tolerance
end

local function runInContext(ctx, cb, ...)
  local co = coroutine.running()
  local previous = area_contexts[co]
  area_contexts[co] = ctx
  local ok, err = pcall(cb, ...)
  area_contexts[co] = previous
  if not ok then
    error(err, 0)
  end
end

local function bindContext(cb)
  local ctx = area_contexts[coroutine.running()]
  if ctx == nil or type(cb) ~= "function" then
    return cb
  end
  return function(...)
    return runInContext(ctx, cb, ...)
  end
end

Tunnel.bindCallback = bindContext

local rawQuery = MySQL.query
MySQL.query = function(queryname, variables, cb)
  return rawQuery(queryname, variables, bindContext(cb))
end

function vRP.getAreaContext(source)
  local ctx = area_contexts[coroutine.running()]
  if ctx ~= nil and ctx.source == source then
    return ctx.name
  end
end

function vRP.callInAreaContext(source, name, cb, ...)
  if name == nil then
    return cb(...)
  end
  runInContext({source = source, name = name}, cb, ...)
end

function vRP.isInArea(source, name)
  local areas = client_areas[source]
  local area = areas and areas[name]
  return area ~= nil and area.inside == true and isNearArea(source, area, area_leave_tolerance)
end

-- create/update a player area
function vRP.setArea(source,name,x,y,z,radius,height,cb_enter,cb_leave)
  local areas = client_areas[source] or {}
  client_areas[source] = areas

  areas[name] = {enter=cb_enter,leave=cb_leave,x=tonumber(x) or 0,y=tonumber(y) or 0,z=tonumber(z) or 0,radius=tonumber(radius) or 1,height=tonumber(height) or 6,inside=false,pending=false}
  vRPclient.setArea(source,{name,x,y,z,radius,height})
end

-- delete a player area
function vRP.removeArea(source,name)
  -- delete remote area
  vRPclient.removeArea(source,{name})

  -- delete local area
  local areas = client_areas[source]
  if areas then
    areas[name] = nil
  end
end

local function enterArea(source, name, area)
  area.pending = false
  area.inside = true
  area.outside_ticks = 0
  if area.enter then
    vRP.callInAreaContext(source, name, area.enter, source, name)
  end
end

-- TUNNER SERVER API

function tvRP.enterArea(name)
  local source = source
  local areas = client_areas[source]
  if areas then
    local area = areas[name] 
    if area and not area.inside then
      if isNearArea(source, area, area_enter_tolerance) then
        enterArea(source, name, area)
      else
        area.pending = true
      end
    end
  end
end

function tvRP.leaveArea(name)
  local source = source
  local areas = client_areas[source]

  if areas then
    local area = areas[name] 
    if area then
      area.pending = false
      if area.inside then
        area.inside = false
        if area.leave then
          area.leave(source,name)
        end
      end
    end
  end
end

Citizen.CreateThread(function()
  while true do
    Citizen.Wait(1000)
    local left = {}
    local entered = {}
    for source, areas in pairs(client_areas) do
      for name, area in pairs(areas) do
        if area.inside then
          if isNearArea(source, area, area_leave_tolerance) then
            area.outside_ticks = 0
          else
            area.outside_ticks = (area.outside_ticks or 0) + 1
            if area.outside_ticks >= 2 then
              area.inside = false
              area.outside_ticks = 0
              table.insert(left, {source, name, area})
            end
          end
        elseif area.pending and isNearArea(source, area, area_enter_tolerance) then
          table.insert(entered, {source, name, area})
        end
      end
    end
    for _, v in ipairs(left) do
      if v[3].leave then
        local ok, err = pcall(v[3].leave, v[1], v[2])
        if not ok then
          print("[vRP] area leave error: "..tostring(err))
        end
      end
    end
    for _, v in ipairs(entered) do
      local areas = client_areas[v[1]]
      if areas and areas[v[2]] == v[3] and v[3].pending and not v[3].inside then
        local ok, err = pcall(enterArea, v[1], v[2], v[3])
        if not ok then
          print("[vRP] area enter error: "..tostring(err))
        end
      end
    end
  end
end)

local cfg = module("cfg/blips_markers")

-- add additional static blips/markers
AddEventHandler("vRP:playerSpawn",function(user_id, source, first_spawn)
  if first_spawn then
    for k,v in pairs(cfg.blips) do
      vRPclient.addBlip(source,{v[1],v[2],v[3],v[4],v[5],v[6]})
    end

    for k,v in pairs(cfg.markers) do
      vRPclient.addMarker(source,{v[1],v[2],v[3],v[4],v[5],v[6],v[7],v[8],v[9],v[10],v[11]})
    end
  end
end)
