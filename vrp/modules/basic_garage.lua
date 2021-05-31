-- -- a basic garage implementation
-- -- vehicle db
local lang = vRP.lang
local cfg = module("cfg/garages")
local cfg_inventory = module("cfg/inventory")
local vehicle_groups = cfg.garage_types
local limit = cfg.limit or 100000000
MySQL.createCommand("vRP/add_vehicle","INSERT IGNORE INTO vrp_user_vehicles(user_id,vehicle,vehicle_plate) VALUES(@user_id,@vehicle,@registration)")
MySQL.createCommand("vRP/remove_vehicle","DELETE FROM vrp_user_vehicles WHERE user_id = @user_id AND vehicle = @vehicle")
MySQL.createCommand("vRP/get_vehicles", "SELECT vehicle, rentedtime FROM vrp_user_vehicles WHERE user_id = @user_id AND rented = 0")
MySQL.createCommand("vRP/get_rented_vehicles_in", "SELECT vehicle, rentedtime, user_id FROM vrp_user_vehicles WHERE user_id = @user_id AND rented = 1")
MySQL.createCommand("vRP/get_rented_vehicles_out", "SELECT vehicle, rentedtime, user_id FROM vrp_user_vehicles WHERE rentedid = @user_id AND rented = 1")
MySQL.createCommand("vRP/get_vehicle","SELECT vehicle FROM vrp_user_vehicles WHERE user_id = @user_id AND vehicle = @vehicle")
MySQL.createCommand("vRP/check_rented","SELECT * FROM vrp_user_vehicles WHERE user_id = @user_id AND vehicle = @vehicle AND rented = 1")
MySQL.createCommand("vRP/sell_vehicle_player","UPDATE vrp_user_vehicles SET user_id = @user_id, vehicle_plate = @registration WHERE user_id = @oldUser AND vehicle = @vehicle")
MySQL.createCommand("vRP/rentedupdate", "UPDATE vrp_user_vehicles SET user_id = @id, rented = @rented, rentedid = @rentedid, rentedtime = @rentedunix WHERE user_id = @user_id AND vehicle = @veh")
MySQL.createCommand("vRP/fetch_rented_vehs", "SELECT * FROM vrp_user_vehicles WHERE rented = 1")
--RageUI Implementation by JamesUK#6793.

--PHONE GARAGES ARE NOT SUPPORTED DO NOT EVEN ASK.
--PHONE GARAGES ARE NOT SUPPORTED DO NOT EVEN ASK.
--PHONE GARAGES ARE NOT SUPPORTED DO NOT EVEN ASK.
--PHONE GARAGES ARE NOT SUPPORTED DO NOT EVEN ASK.
--PHONE GARAGES ARE NOT SUPPORTED DO NOT EVEN ASK.


Citizen.CreateThread(function()
    while true do
        Wait(300000)
        MySQL.query('vRP/fetch_rented_vehs', {}, function(pvehicles)
            for i,v in pairs(pvehicles) do 
               if os.time() > tonumber(v.rentedtime) then
                  MySQL.execute('vRP/rentedupdate', {id = v.rentedid, rented = 0, rentedid = "", rentedunix = "", user_id = v.user_id, veh = v.vehicle})
               end
            end
        end)
        print('Vehicle Rents checked.')
    end
end)

RegisterNetEvent('vRP:FetchCars')
AddEventHandler('vRP:FetchCars', function(owned, type)
    local source = source
    local user_id = vRP.getUserId(source)
    local returned_table = {}
    if user_id then
        if not owned then
            for i, v in pairs(vehicle_groups) do
                local noperms = false;
                local config = vehicle_groups[i]._config
                if config.vtype == type then 
                    local perm = config.permissions or nil
                    if perm then
                        for i, v in pairs(perm) do
                            if not vRP.hasPermission(user_id, v) then
                                noperms = true;
                            end
                        end
                    end
                    if not noperms then 
                        returned_table[i] = {
                            ["config"] = config
                        }
                        returned_table[i].vehicles = {}
                        for a, z in pairs(v) do
                            if a ~= "_config" then
                                returned_table[i].vehicles[a] = {z[1], z[2]}
                            end
                        end
                    end
                end 
            end
            TriggerClientEvent('vRP:ReturnFetchedCars', source, returned_table)
        else
            MySQL.query("vRP/get_vehicles", {
                user_id = user_id
            }, function(pvehicles, affected)
                for _, veh in pairs(pvehicles) do
                    for i, v in pairs(vehicle_groups) do
                        local noperms = false;
                        local config = vehicle_groups[i]._config
                        if config.vtype == type then 
                            local perm = config.permissions or nil
                            if perm then
                                for i, v in pairs(perm) do
                                    if not vRP.hasPermission(user_id, v) then
                                        noperms = true;
                                    end
                                end
                            end
                            if not noperms then 
                                for a, z in pairs(v) do
                                    if a ~= "_config" and veh.vehicle == a then
                                        if not returned_table[i] then 
                                            returned_table[i] = {
                                                ["config"] = config
                                            }
                                        end
                                        if not returned_table[i].vehicles then 
                                            returned_table[i].vehicles = {}
                                        end
                                        returned_table[i].vehicles[a] = {z[1]}
                                    end
                                end
                            end
                        end
                    end
                end
                TriggerClientEvent('vRP:ReturnFetchedCars', source, returned_table)
            end)
        end
    end
end)

RegisterNetEvent('vRP:BuyVehicle')
AddEventHandler('vRP:BuyVehicle', function(vehicle)
    local source = source
    local user_id = vRP.getUserId(source)
    for i, v in pairs(vehicle_groups) do
        local config = vehicle_groups[i]._config
        local perm = config.permissions or nil
        if perm then
            for i, v in pairs(perm) do
                if not vRP.hasPermission(user_id, v) then
                    break
                end
            end
        end
        for a, z in pairs(v) do
            if a ~= "_config" and a == vehicle then
                if vRP.tryFullPayment(user_id,z[2]) then 
                    vRPclient.notify(source,{'~g~You have purchased: ' .. z[1] .. ' for: $' .. z[2]})
                    vRP.getUserIdentity(user_id, function(identity)					
                        MySQL.execute("vRP/add_vehicle", {user_id = user_id, vehicle = vehicle, registration = "P "..identity.registration})
                    end)
                    return 
                else 
                    vRPclient.notify(source,{'~r~You do not have enough money to purchase this vehicle! It costs: $' .. z[2]})
                    TriggerClientEvent('vRP:CloseGarage', source)
                    return 
                end
            end
        end
    end
    return vRPclient.notify(source,{'~r~An error has occured please try again later.'})
end)

RegisterNetEvent('vRP:ScrapVehicle')
AddEventHandler('vRP:ScrapVehicle', function(vehicle)
    local source = source
    local user_id = vRP.getUserId(source)
    if user_id then 
        MySQL.query("vRP/check_rented", {user_id = user_id, vehicle = vehicle}, function(pvehicles)
            MySQL.query("vRP/get_vehicle", {user_id = user_id, vehicle = vehicle}, function(pveh)
                if #pveh < 0 then 
                    vRPclient.notify(source,{"~r~You cannot destroy a vehicle you do not own"})
                    return
                end
                if #pvehicles > 0 then 
                    vRPclient.notify(source,{"~r~You cannot destroy a rented vehicle!"})
                    return
                end
                MySQL.execute('vRP/remove_vehicle', {user_id = user_id, vehicle = vehicle})
                TriggerClientEvent('vRP:CloseGarage', source)
            end)
        end)
    end
end)

RegisterNetEvent('vRP:SellVehicle')
AddEventHandler('vRP:SellVehicle', function(veh)
    local name = veh
    local player = source 
    local playerID = vRP.getUserId(source)
    if playerID ~= nil then
		vRPclient.getNearestPlayers(player,{15},function(nplayers)
			usrList = ""
			for k,v in pairs(nplayers) do
				usrList = usrList .. "[" .. vRP.getUserId(k) .. "]" .. GetPlayerName(k) .. " | "
			end
			if usrList ~= "" then
				vRP.prompt(player,"Players Nearby: " .. usrList .. "","",function(player,user_id) 
					user_id = user_id
					if user_id ~= nil and user_id ~= "" then 
						local target = vRP.getUserSource(tonumber(user_id))
						if target ~= nil then
							vRP.prompt(player,"Price $: ","",function(player,amount)
								if tonumber(amount) and tonumber(amount) > 0 and tonumber(amount) < limit then
									MySQL.query("vRP/get_vehicle", {user_id = user_id, vehicle = name}, function(pvehicle, affected)
										if #pvehicle > 0 then
											vRPclient.notify(player,{"~r~The player already has this vehicle type."})
										else
											local tmpdata = vRP.getUserTmpTable(playerID)
											MySQL.query("vRP/check_rented", {user_id = playerID, vehicle = veh}, function(pvehicles)
                                                if #pvehicles > 0 then 
                                                    vRPclient.notify(player,{"~r~You cannot sell a rented vehicle!"})
                                                    return
                                                else
                                                    vRP.request(target,GetPlayerName(player).." wants to sell: " ..name.. " Price: $"..amount, 10, function(target,ok)
                                                        if ok then
                                                            local pID = vRP.getUserId(target)
                                                            amount = tonumber(amount)
                                                            if vRP.tryFullPayment(pID,amount) then
                                                                vRPclient.despawnGarageVehicle(player,{'car',15}) 
                                                                vRP.getUserIdentity(pID, function(identity)
                                                                    MySQL.execute("vRP/sell_vehicle_player", {user_id = user_id, registration = "P "..identity.registration, oldUser = playerID, vehicle = name}) 
                                                                end)
                                                                vRP.giveBankMoney(playerID, amount)
                                                                vRPclient.notify(player,{"~g~You have successfully sold the vehicle to ".. GetPlayerName(target).." for $"..amount.."!"})
                                                                vRPclient.notify(target,{"~g~"..GetPlayerName(player).." has successfully sold you the car for $"..amount.."!"})
                                                                TriggerClientEvent('vRP:CloseGarage', player)
                                                            else
                                                                vRPclient.notify(player,{"~r~".. GetPlayerName(target).." doesn't have enough money!"})
                                                                vRPclient.notify(target,{"~r~You don't have enough money!"})
                                                            end
                                                        else
                                                            vRPclient.notify(player,{"~r~"..GetPlayerName(target).." has refused to buy the car."})
                                                            vRPclient.notify(target,{"~r~You have refused to buy "..GetPlayerName(player).."'s car."})
                                                        end
                                                    end)
                                                end
                                            end)
										end
									end) 
								else
									vRPclient.notify(player,{"~r~The price of the car has to be a number."})
								end
							end)
						else
							vRPclient.notify(player,{"~r~That ID seems invalid."})
						end
					else
						vRPclient.notify(player,{"~r~No player ID selected."})
					end
				end)
			else
				vRPclient.notify(player,{"~r~No players nearby."})
			end
		end)
    end
end)


RegisterNetEvent('vRP:RentVehicle')
AddEventHandler('vRP:RentVehicle', function(veh)
    local name = veh
    local player = source 
    local playerID = vRP.getUserId(source)
    if playerID ~= nil then
		vRPclient.getNearestPlayers(player,{15},function(nplayers)
			usrList = ""
			for k,v in pairs(nplayers) do
				usrList = usrList .. "[" .. vRP.getUserId(k) .. "]" .. GetPlayerName(k) .. " | "
			end
			if usrList ~= "" then
				vRP.prompt(player,"Players Nearby: " .. usrList .. "","",function(player,user_id) 
					user_id = user_id
					if user_id ~= nil and user_id ~= "" then 
						local target = vRP.getUserSource(tonumber(user_id))
						if target ~= nil then
							vRP.prompt(player,"Price $: ","",function(player,amount)
                                vRP.prompt(player,"Rent time (in hours): ","",function(player,rent)
                                    if tonumber(rent) and tonumber(rent) >  0 then 
                                        if tonumber(amount) and tonumber(amount) > 0 and tonumber(amount) < limit then
                                            MySQL.query("vRP/get_vehicle", {user_id = user_id, vehicle = name}, function(pvehicle, affected)
                                                if #pvehicle > 0 then
                                                    vRPclient.notify(player,{"~r~The player already has this vehicle type."})
                                                else
                                                    local tmpdata = vRP.getUserTmpTable(playerID)
                                                    MySQL.query("vRP/check_rented", {user_id = playerID, vehicle = veh}, function(pvehicles)
                                                        if #pvehicles > 0 then 
                                                            vRPclient.notify(player,{"~r~You cannot rent a rented vehicle!"})
                                                            return
                                                        else
                                                            vRP.request(target,GetPlayerName(player).." wants to rent: " ..name.. " Price: $"..amount .. ' | for: ' .. rent .. 'hours', 10, function(target,ok)
                                                                if ok then
                                                                    local pID = vRP.getUserId(target)
                                                                    amount = tonumber(amount)
                                                                    if vRP.tryFullPayment(pID,amount) then
                                                                        vRPclient.despawnGarageVehicle(player,{'car',15}) 
                                                                        vRP.getUserIdentity(pID, function(identity)
                                                                            local rentedTime = os.time()
                                                                            rentedTime = rentedTime  + (60 * 60 * tonumber(rent)) 
                                                                            MySQL.execute("vRP/rentedupdate", {user_id = playerID, veh = name, id = pID, rented = 1, rentedid = playerID, rentedunix =  rentedTime }) 
                                                                        end)
                                                                        vRP.giveBankMoney(playerID, amount)
                                                                        vRPclient.notify(player,{"~g~You have successfully rented the vehicle to ".. GetPlayerName(target).." for $"..amount.."!" .. ' | for: ' .. rent .. 'hours'})
                                                                        vRPclient.notify(target,{"~g~"..GetPlayerName(player).." has successfully rented you the car for $"..amount.."!" .. ' | for: ' .. rent .. 'hours'})
                                                                        TriggerClientEvent('vRP:CloseGarage', player)
                                                                    else
                                                                        vRPclient.notify(player,{"~r~".. GetPlayerName(target).." doesn't have enough money!"})
                                                                        vRPclient.notify(target,{"~r~You don't have enough money!"})
                                                                    end
                                                                else
                                                                    vRPclient.notify(player,{"~r~"..GetPlayerName(target).." has refused to rent the car."})
                                                                    vRPclient.notify(target,{"~r~You have refused to rent "..GetPlayerName(player).."'s car."})
                                                                end
                                                            end)
                                                        end
                                                    end)
                                                end
                                            end) 
                                        else
                                            vRPclient.notify(player,{"~r~The price of the car has to be a number."})
                                        end
                                    else 
                                        vRPclient.notify(player,{"~r~The rent time of the car has to be in hours and a number."})
                                    end
                                end)
							end)
						else
							vRPclient.notify(player,{"~r~That ID seems invalid."})
						end
					else
						vRPclient.notify(player,{"~r~No player ID selected."})
					end
				end)
			else
				vRPclient.notify(player,{"~r~No players nearby."})
			end
		end)
    end
end)



RegisterNetEvent('vRP:FetchVehiclesIn')
AddEventHandler('vRP:FetchVehiclesIn', function()
    local returned_table = {}
    local source = source
    local user_id = vRP.getUserId(source)
    MySQL.query("vRP/get_rented_vehicles_in", {
        user_id = user_id
    }, function(pvehicles, affected)
        for _, veh in pairs(pvehicles) do
            for i, v in pairs(vehicle_groups) do
                local config = vehicle_groups[i]._config
                local perm = config.permissions or nil
                if perm then
                    for i, v in pairs(perm) do
                        if not vRP.hasPermission(user_id, v) then
                            break
                        end
                    end
                end
                for a, z in pairs(v) do
                    if a ~= "_config" and veh.vehicle == a then
                        if not returned_table[i] then 
                            returned_table[i] = {
                                ["config"] = config
                            }
                        end
                        if not returned_table[i].vehicles then 
                            returned_table[i].vehicles = {}
                        end
                        local time = tonumber(veh.rentedtime) - os.time()
                        local datetime = ""
                        local date = os.date("!*t", time)
                        if date.hour >= 1 and date.min >= 1 then 
                            datetime = date.hour .. " hours and " .. date.min .. " minutes left"
                        elseif date.hour <= 1 and date.min >= 1 then 
                            datetime = date.min .. " minutes left"
                        elseif date.hour >= 1 and date.min <= 1 then 
                            datetime = date.hour .. " hours left"
                        end
                        returned_table[i].vehicles[a] = {z[1], datetime}
                    end
                end
            end
        end
        TriggerClientEvent('vRP:ReturnFetchedCars', source, returned_table)
    end)
end)

RegisterNetEvent('vRP:FetchVehiclesOut')
AddEventHandler('vRP:FetchVehiclesOut', function()
    local returned_table = {}
    local source = source
    local user_id = vRP.getUserId(source)
    MySQL.query("vRP/get_rented_vehicles_out", {
        user_id = user_id
    }, function(pvehicles, affected)
        for _, veh in pairs(pvehicles) do
            for i, v in pairs(vehicle_groups) do
                local config = vehicle_groups[i]._config
                local perm = config.permissions or nil
                if perm then
                    for i, v in pairs(perm) do
                        if not vRP.hasPermission(user_id, v) then
                            break
                        end
                    end
                end
                for a, z in pairs(v) do
                    if a ~= "_config" and veh.vehicle == a then
                        if not returned_table[i] then 
                            returned_table[i] = {
                                ["config"] = config
                            }
                        end
                        if not returned_table[i].vehicles then 
                            returned_table[i].vehicles = {}
                        end
                        local time = tonumber(veh.rentedtime) - os.time()
                        local datetime = ""
                        local date = os.date("!*t", time)
                        if date.hour >= 1 and date.min >= 1 then 
                            datetime = date.hour .. " hours and " .. date.min .. " minutes left."
                        elseif date.hour <= 1 and date.min >= 1 then 
                            datetime = date.min .. " minutes left"
                        elseif date.hour >= 1 and date.min <= 1 then 
                            datetime = date.hour .. " hours left"
                        end
                        returned_table[i].vehicles[a .. ':' .. veh.user_id] = {z[1], datetime, veh.user_id, a}
                    end
                end
            end
        end
        TriggerClientEvent('vRP:ReturnFetchedCars', source, returned_table)
    end)
end)


local veh_actions = {}

-- open trunk
veh_actions[lang.vehicle.trunk.title()] = {function(user_id,player,vtype,name)
  local chestname = "u"..user_id.."veh_"..string.lower(name)
  local max_weight = cfg_inventory.vehicle_chest_weights[string.lower(name)] or cfg_inventory.default_vehicle_chest_weight

  -- open chest
  vRPclient.vc_openDoor(player, {vtype,5})
  vRP.openChest(player, chestname, max_weight, function()
    vRPclient.vc_closeDoor(player, {vtype,5})
  end)
end, lang.vehicle.trunk.description()}

-- detach trailer
veh_actions[lang.vehicle.detach_trailer.title()] = {function(user_id,player,vtype,name)
  vRPclient.vc_detachTrailer(player, {vtype})
end, lang.vehicle.detach_trailer.description()}

-- detach towtruck
veh_actions[lang.vehicle.detach_towtruck.title()] = {function(user_id,player,vtype,name)
  vRPclient.vc_detachTowTruck(player, {vtype})
end, lang.vehicle.detach_towtruck.description()}

-- detach cargobob
veh_actions[lang.vehicle.detach_cargobob.title()] = {function(user_id,player,vtype,name)
  vRPclient.vc_detachCargobob(player, {vtype})
end, lang.vehicle.detach_cargobob.description()}

-- lock/unlock
veh_actions[lang.vehicle.lock.title()] = {function(user_id,player,vtype,name)
  vRPclient.vc_toggleLock(player, {vtype})
end, lang.vehicle.lock.description()}

-- engine on/off
veh_actions[lang.vehicle.engine.title()] = {function(user_id,player,vtype,name)
  vRPclient.vc_toggleEngine(player, {vtype})
end, lang.vehicle.engine.description()}
--sell2
MySQL.createCommand("vRP/sell_vehicle_player","UPDATE vrp_user_vehicles SET user_id = @user_id, vehicle_plate = @registration WHERE user_id = @oldUser AND vehicle = @vehicle")




local function ch_vehicle(player,choice)
  local user_id = vRP.getUserId(player)
  if user_id ~= nil then
    -- check vehicle
    vRPclient.getNearestOwnedVehicle(player,{7},function(ok,vtype,name)
      if ok then
        -- build vehicle menu
        vRP.buildMenu("vehicle", {user_id = user_id, player = player, vtype = vtype, vname = name}, function(menu)
          menu.name=lang.vehicle.title()
          menu.css={top="75px",header_color="rgba(255,125,0,0.75)"}

          for k,v in pairs(veh_actions) do
            menu[k] = {function(player,choice) v[1](user_id,player,vtype,name) end, v[2]}
          end

          vRP.openMenu(player,menu)
        end)
      else
        vRPclient.notify(player,{lang.vehicle.no_owned_near()})
      end
    end)
  end
end

-- ask trunk (open other user car chest)
local function ch_asktrunk(player,choice)
  vRPclient.getNearestPlayer(player,{10},function(nplayer)
    local nuser_id = vRP.getUserId(nplayer)
    if nuser_id ~= nil then
      vRPclient.notify(player,{lang.vehicle.asktrunk.asked()})
      vRP.request(nplayer,lang.vehicle.asktrunk.request(),15,function(nplayer,ok)
        if ok then -- request accepted, open trunk
          vRPclient.getNearestOwnedVehicle(nplayer,{7},function(ok,vtype,name)
            if ok then
              local chestname = "u"..nuser_id.."veh_"..string.lower(name)
              local max_weight = cfg_inventory.vehicle_chest_weights[string.lower(name)] or cfg_inventory.default_vehicle_chest_weight

              -- open chest
              local cb_out = function(idname,amount)
                vRPclient.notify(nplayer,{lang.inventory.give.given({vRP.getItemName(idname),amount})})
              end

              local cb_in = function(idname,amount)
                vRPclient.notify(nplayer,{lang.inventory.give.received({vRP.getItemName(idname),amount})})
              end

              vRPclient.vc_openDoor(nplayer, {vtype,5})
              vRP.openChest(player, chestname, max_weight, function()
                vRPclient.vc_closeDoor(nplayer, {vtype,5})
              end,cb_in,cb_out)
            else
              vRPclient.notify(player,{lang.vehicle.no_owned_near()})
              vRPclient.notify(nplayer,{lang.vehicle.no_owned_near()})
            end
          end)
        else
          vRPclient.notify(player,{lang.common.request_refused()})
        end
      end)
    else
      vRPclient.notify(player,{lang.common.no_player_near()})
    end
  end)
end

-- repair nearest vehicle
local function ch_repair(player,choice)
  local user_id = vRP.getUserId(player)
  if user_id ~= nil then
    -- anim and repair
    if vRP.tryGetInventoryItem(user_id,"repairkit",1,true) then
      vRPclient.playAnim(player,{false,{task="WORLD_HUMAN_WELDING"},false})
      SetTimeout(15000, function()
        vRPclient.fixeNearestVehicle(player,{7})
        vRPclient.stopAnim(player,{false})
      end)
    end
  end
end

-- replace nearest vehicle
local function ch_replace(player,choice)
  vRPclient.replaceNearestVehicle(player,{7})
end

vRP.registerMenuBuilder("main", function(add, data)
  local user_id = vRP.getUserId(data.player)
  if user_id ~= nil then
    -- add vehicle entry
    local choices = {}
    choices[lang.vehicle.title()] = {ch_vehicle}

    -- add ask trunk
    choices[lang.vehicle.asktrunk.title()] = {ch_asktrunk}

    -- add repair functions
    if vRP.hasPermission(user_id, "vehicle.repair") then
      choices[lang.vehicle.repair.title()] = {ch_repair, lang.vehicle.repair.description()}
    end

    if vRP.hasPermission(user_id, "vehicle.replace") then
      choices[lang.vehicle.replace.title()] = {ch_replace, lang.vehicle.replace.description()}
    end

    add(choices)
  end
end)
