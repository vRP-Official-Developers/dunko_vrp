local doors = {}

RegisterNetEvent('vrp_doors:load')
AddEventHandler('vrp_doors:load', function(list)
    doors = list
end)
RegisterNetEvent('vrp_doors:statusSend')
AddEventHandler('vrp_doors:statusSend', function(id,status)
    doors[id].locked = status
end)

function DrawText3Ds(x,y,z, text)
    local onScreen,_x,_y=World3dToScreen2d(x,y,z)
    local px,py,pz=table.unpack(GetGameplayCamCoords())

    SetTextScale(0.32, 0.32)
    SetTextFont(4)
    SetTextProportional(1)
    SetTextColour(255, 255, 255, 255)
    SetTextEntry("STRING")
    SetTextCentre(1)
    AddTextComponentString(text)
    DrawText(_x,_y)
    local factor = (string.len(text)) / 370
    DrawRect(_x,_y+0.0125, 0.015+ factor, 0.03, 0, 0, 0, 80)
end


Citizen.CreateThread(function()
    while true do
        Citizen.Wait(1)
        local coords = GetEntityCoords(PlayerPedId(),true)
        for k,v in pairs(doors) do
            if v.range ~= nil and v.range == 10 then 
				newrange = 10.0
			elseif v.range ~= nil and v.range == 5 then
				newrange = 5.0
			else
				newrange = 2.0
			end
            if GetDistanceBetweenCoords(coords.x, coords.y, coords.z, v.coords[1], v.coords[2], v.coords[3], true) <= newrange then
                local closeDoor = GetClosestObjectOfType(v.coords[1], v.coords[2], v.coords[3], newrange, v.hash, false, false, false)
				
                if closeDoor ~= 0 then
                    if v.locked then
                        DrawText3Ds(v.coords[1], v.coords[2], v.coords[3], "~r~Locked ~w~[~g~E~w~] to unlock")
                        local locked, heading = GetStateOfClosestDoorOfType(v.hash, v.coords[1], v.coords[2], v.coords[3], v.locked, 0)
                        if heading > -0.01 and heading < 0.01 then
                            FreezeEntityPosition(closeDoor, v.locked)
                        end
                    else
                        DrawText3Ds(v.coords[1], v.coords[2], v.coords[3], "~g~Unlocked ~w~[~r~E~w~] to lock")
                        FreezeEntityPosition(closeDoor, v.locked)
                    end
                    if IsControlJustReleased(0, 38) then
                        toggleClosestDoor()
                    end
                end
            end
        end
    end
end)

function toggleClosestDoor()
    local x,y,z = table.unpack(GetEntityCoords(PlayerPedId(), true))
    for k,v in pairs(doors) do
        if v.close ~= nil then
            local door1 = GetDistanceBetweenCoords(GetEntityCoords(GetPlayerPed(-1)), v.coords[1], v.coords[2], v.coords[3], true )
            if v.range ~= nil and v.range == 10 then 
				newrange = 10.0
			else
				newrange = 2.0
			end
            if door1 < newrange then
                if door1 < GetDistanceBetweenCoords(x,y,z,doors[v.close].coords[1], doors[v.close].coords[2], doors[v.close].coords[3],true) then
                    TriggerServerEvent("vrp_doors:status", k, not v.locked)
                else
                    TriggerServerEvent("vrp_doors:status", v.close, not doors[v.close].locked)
                end
                break
            end
        else
			if v.range ~= nil and v.range == 10 then 
				newrange = 10.0
			else
				newrange = 2.0
			end
            if GetDistanceBetweenCoords(x,y,z,v.coords[1], v.coords[2], v.coords[3],true) <= newrange then
                TriggerServerEvent("vrp_doors:status", k, not v.locked)
            end
        end
    end
end
