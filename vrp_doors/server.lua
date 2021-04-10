local Proxy = module("vrp", "lib/Proxy")
vRP = Proxy.getInterface("vRP")
local cfg = module("vrp_doors", "config")

local doors = cfg.doors
local owned = {}

AddEventHandler("vRP:playerSpawn",function(user_id,source,first_spawn)
    if first_spawn then
        TriggerClientEvent('vrp_doors:load', source, doors)
    end
end)

RegisterServerEvent('vrp_doors:status')
AddEventHandler('vrp_doors:status', function(id, status)
    local user_id = vRP.getUserId({source})
    if (doors[id].key ~= nil and vRP.hasPermission({user_id, "#"..doors[id].key..".>0"})) or (doors[id].permission ~= nil and vRP.hasPermission({user_id,doors[id].permission})) or (doors[id].name ~= nil and doors[id].number ~= nil and owned[doors[id].name] ~= nil and owned[doors[id].name][doors[id].number] ~= nil and owned[doors[id].name][doors[id].number] == user_id) then
        if doors[id].pairs ~= nil then
            doors[doors[id].pairs].locked=status
            TriggerClientEvent('vrp_doors:statusSend', -1, doors[id].pairs, status)
        end
        doors[id].locked=status
        TriggerClientEvent('vrp_doors:statusSend', -1, id, status)
    end
end)

RegisterServerEvent('kaz_doors:outbreak')
AddEventHandler('kaz_doors:outbreak', function()
		if doors[41].pairs ~= nil then
            doors[doors[41].pairs].locked=false
            TriggerClientEvent('vrp_doors:statusSend', -1, doors[41].pairs, false)
        end
        doors[41].locked=false
        TriggerClientEvent('vrp_doors:statusSend', -1, 41, false)	
		if doors[42].pairs ~= nil then
            doors[doors[42].pairs].locked=false
            TriggerClientEvent('vrp_doors:statusSend', -1, doors[42].pairs, false)
        end
        doors[42].locked=false
        TriggerClientEvent('vrp_doors:statusSend', -1, 42, false)
end)		

RegisterServerEvent('kaz_doors:outbreak2')
AddEventHandler('kaz_doors:outbreak2', function()
		if doors[41].pairs ~= nil then
            doors[doors[41].pairs].locked=true
            TriggerClientEvent('vrp_doors:statusSend', -1, doors[41].pairs, true)
        end
        doors[41].locked=true
        TriggerClientEvent('vrp_doors:statusSend', -1, 75, true)	
		if doors[42].pairs ~= nil then
            doors[doors[42].pairs].locked=true
            TriggerClientEvent('vrp_doors:statusSend', -1, doors[42].pairs, true)
        end
        doors[42].locked=true
        TriggerClientEvent('vrp_doors:statusSend', -1, 42, true)
end)		

RegisterServerEvent('vrp_doors:owneddoor')
AddEventHandler('vrp_doors:owneddoor', function(user_id,home,number)
    owned[home][tonumber(number)] = user_id
end)
