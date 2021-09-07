local Tunnel = module("vrp", "lib/Tunnel")
local Proxy = module("vrp", "lib/Proxy")
vRP = Proxy.getInterface("vRP")
vRPclient = Tunnel.getInterface("vRP","vRP")

RegisterNetEvent("vrp:weedgather")
AddEventHandler("vrp:weedgather", function()
    local weedweight = vRP.getItemWeight({"unprocessed_weed"})
    local source = source
    local userid = vRP.getUserId({source})
    local ped = GetPlayerPed(source)
    local maxweight = vRP.getInventoryMaxWeight({userid}) + weedweight
    local location = GetEntityCoords(GetPlayerPed(source))
    local coords = vector3(2223.3071289062,5576.1845703125,53.654960632324)
    if #(coords - location) <= 3.0 then
        if vRP.hasGroup({userid, "Drug Dealer"}) then
            if vRP.getInventoryWeight({userid}) < maxweight then
                FreezeEntityPosition(ped, true)
                TaskPlayAnim(ped, "anim@amb@business@weed@weed_inspecting_lo_med_hi@", "weed_stand_checkingleaves_idle_05_inspector", 8.0, 8.0, -1, 48, 1, true, true, true)
                Citizen.Wait(5000)
                FreezeEntityPosition(ped, false)
                ClearPedTasks(ped)
                vRPclient.notify(source,{"You have harvested weed."})
                vRP.giveInventoryItem({userid, "unprocessed_weed", 1, false})
            else
                vRPclient.notify(source,{"Your inventory is full!"})
            end
        else
            vRPclient.notify(source,{"You do not have the required group."})
        end
    else
        vRP.banConsole({userid, perm, "Triggering Server Events with Cheats"})
    end
end)

RegisterNetEvent("vrp:weedbag")
AddEventHandler("vrp:weedbag", function(rotation, pos)
    local source = source
    local userid = vRP.getUserId({source})
    local ped = GetPlayerPed(source)
    local location = GetEntityCoords(GetPlayerPed(source))
    local coords = vector3(1591.0010986328,3592.1979980469,38.766506195068) 
    if #(coords - location) <= 3.0 then
        if vRP.hasGroup({userid, "Drug Dealer"}) then
                local weedamount = vRP.getInventoryItemAmount({userid, "unprocessed_weed"})
                local bagamount = vRP.getInventoryItemAmount({userid, "bag"})
                if weedamount >= 3 and bagamount >= 1 then
                    if vRP.tryGetInventoryItem({userid, "unprocessed_weed", 3, true}) and vRP.tryGetInventoryItem({userid, "bag", 1, true}) then
                        FreezeEntityPosition(ped, true)
                        TaskPlayAnimAdvanced(ped, "anim@amb@business@weed@weed_sorting_seated@", "sorter_right_sort_v3_sorter02", pos.x, pos.y, pos.z, rotation.x, rotation.y, rotation.z, 1.0, 1.0, 5000, 48, 0.2, true, true)
                        Citizen.Wait(5000)
                        FreezeEntityPosition(ped, false)
                        vRP.giveInventoryItem({userid, "bagged_weed", 1, false})
                        vRPclient.notify(source,{"You have bagged your weed"})
                    else
                        vRPclient.notify(source,{"You need 3 unprocessed weed and 1 bag to make bagged weed"})
                    end
                else
                    vRPclient.notify(source,{"You need 3 unprocessed weed and 1 bag to make bagged weed"})
                end
            else
                vRPclient.notify(source,{"You do not have the required group."})
                ClearPedTasks(ped)
        end
    else
        vRP.banConsole({userid, perm, "Triggering Server Events with Cheats"})
    end
end)

RegisterNetEvent("vrp:sellweed")
AddEventHandler("vrp:sellweed", function()
    local source = source
    local userid = vRP.getUserId({source})
    local location = GetEntityCoords(GetPlayerPed(source))
    local coords = vector3(115.89520263672,-1949.8754882812,20.711057662964)    
    if #(coords - location) <= 3.0 then
        if vRP.tryGetInventoryItem({userid, "bagged_weed", 1, false}) then
            vRP.giveMoney({userid, 1000})
            vRPclient.notify(source,{"You have sold your weed"})    
        else
            vRPclient.notify(source,{"You need bagged weed to sell"})       
        end
    else
        vRP.banConsole({userid, perm, "Triggering Server Events with Cheats"})
    end

end)
  











