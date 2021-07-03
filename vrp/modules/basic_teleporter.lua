local cfg = module("cfg/teleporters")
local teleporter_menus = {}
local StatusUsa = {}

for k,v in pairs(cfg.teleporters_types) do
  local teleporter_menu = {name="Teleporter",css={top="75px",header_color="rgba(255,0,0,0.75)"}}
  teleporter_menus[k] = teleporter_menu

  local teleporter_choice = function(player,choice)
    local user_id = vRP.getUserId(player)
    local data = vRP.getUserDataTable(user_id)
    if user_id ~= nil then
      vRP.closeMenu(player)
      if StatusUsa[user_id] == nil then
        StatusUsa[user_id] = true
        for k,v in pairs(cfg.teleporters) do
          local gtype, x,y,z,h, x2,y2,z2,h2 = table.unpack(v)
          vRPclient.teleport(player, {x2,y2,z2,h2})
          vRP.closeMenu(player)
          break
          vRP.openMenu(player,teleporter_menu)
        end
      else
        StatusUsa[user_id] = nil
        for k,v in pairs(cfg.teleporters) do
          local gtype, x,y,z,h, x2,y2,z2,h2 = table.unpack(v)
          vRPclient.teleport(player, {x,y,z,h})
          vRP.closeMenu(player)
          break
          vRP.openMenu(player,teleporter_menu)
        end
      end
    end
  end
  
  teleporter_menu[k] = {teleporter_choice,k.." Door"} -- add description
end

local function build_client_teleporters(source)
  local user_id = vRP.getUserId(source)
  if user_id ~= nil then
    for k,v in pairs(cfg.teleporters) do
      local gtype, x,y,z,h, x2,y2,z2,h2 = table.unpack(v)
      local group = cfg.teleporters_types[gtype]
      local menu = teleporter_menus[gtype]
      if group and menu then
        local gcfg = group._config or {}

        local function teleporter_ENTER()
			    local user_id = vRP.getUserId(source)
			    if user_id ~= nil and vRP.hasGroup(user_id,gcfg.group or "user") then
			    	vRP.openMenu(source,menu)
			    end
        end

        local function teleporter_EXIT()
			    local user_id = vRP.getUserId(source)
			    if user_id ~= nil and vRP.hasGroup(user_id,gcfg.group or "user") then
			    	vRP.openMenu(source,menu)
			    end
        end

        local function teleporter_leave()
          vRP.closeMenu(source)
        end

        vRPclient.addBlip(source,{x,y,z,gcfg.blipid,gcfg.blipcolor,gtype})
        vRPclient.addMarker(source,{x,y,z,})
        vRPclient.addMarkerNames(source,{x,y,z, "~b~~n~~w~Enterance: "..tostring(gtype), 1, 1.0})
        vRP.setArea(source,"vRP:Teleporter"..k,x,y,z,1,1.5,teleporter_ENTER,teleporter_leave)

        vRPclient.addBlip(source,{x2,y2,z2,gcfg.blipid,gcfg.blipcolor,gtype})
        vRPclient.addMarker(source,{})
        vRPclient.addMarkerNames(source,{x2,y2,z2, "~b~~n~~w~Exit: "..tostring(gtype), 1, 1.0})
        vRP.setArea(source,"vRP:Teleporter2"..k,x2,y2,z2,1,1.5,teleporter_EXIT,teleporter_leave)
      end
    end
  end
end

AddEventHandler("vRP:playerSpawn",function(user_id, source, first_spawn)
  if first_spawn then
    build_client_teleporters(source)
  end
end)

AddEventHandler("vRP:playerLeave", function(user_id, source)
	if(StatusUsa[user_id] ~= nil)then
		StatusUsa[user_id] = nil
	end
end)