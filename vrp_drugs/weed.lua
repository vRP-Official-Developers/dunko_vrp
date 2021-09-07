function loadAnimDict(animDict) -- LOAD ANIMATIONS
    RequestAnimDict(animDict)
    while not HasAnimDictLoaded(animDict) do
        Citizen.Wait(100)
    end
end 

Citizen.CreateThread(function() -- WEED GATHER
    local timer = 0
    while true do   
        Citizen.Wait(0)
        if IsControlJustPressed(1, 51) then
            local coords = GetEntityCoords(PlayerPedId())
            local playerVec = vector3(coords.x, coords.y, coords.z)
            local weedField = vector3(2223.3071289062,5576.1845703125,53.654960632324) -- WEED FIELD
            local dist = #(playerVec - weedField) 
            if dist <= 3.0 and timer == 0 then
                loadAnimDict("anim@amb@business@weed@weed_inspecting_lo_med_hi@")
                TriggerServerEvent("vrp:weedgather")
                timer = 1
                Citizen.Wait(5000)
                timer = 0
            end
        end
    end
end)
Citizen.CreateThread(function() -- BAG WEED

    local tablehash = GetHashKey("prop_table_04")
    RequestModel(tablehash)
    local table = CreateObject(tablehash, 1591.2370605469 - 0.65, 3592.9895019531, 38.766490936279 - 1, true, true, false)
    SetEntityRotation(table, 0.0, 0.0, 30.0, true)
    local timer = 0
     while true do
         Citizen.Wait(0)
         if IsControlJustPressed(1, 51) then
             local coords = GetEntityCoords(PlayerPedId())
             local playerVec = vector3(coords.x, coords.y, coords.z)
             local weedBagging = vector3(1591.0010986328, 3592.1979980469, 38.766506195068)
             local dist  = #(playerVec - weedBagging)
             local timer = 0
             if dist <= 3.0 and timer == 0 then
                 while not HasModelLoaded(tablehash) do
                     Citizen.Wait(1000)
                 end
                     local rotation = vector3(-2.935199e-06, -1.221333e-12, 32.76419)
                     local pos = vector3(1591.0010986328,3592.1979980469,38.766506195068)
                     
                     loadAnimDict("anim@amb@business@weed@weed_sorting_seated@")
                     TriggerServerEvent("vrp:weedbag", rotation, pos)
                     
                     timer = 1
                     Citizen.Wait(5100)
                     timer = 0

                 end
             end
         end 
 end)

Citizen.CreateThread(function() -- SELL WEED
    while true do
    Citizen.Wait(0)
        if IsControlJustPressed(1, 51) then
            local pedcoordsvec = vector3(115.89520263672, -1949.8754882812, 20.711057662964)
            local playercoords = GetEntityCoords(PlayerPedId())
            local playerVector = vector3(playercoords.x, playercoords.y, playercoords.z)
            local dist = #(playerVector - pedcoordsvec)
            if dist <= 3.0 then
                TriggerServerEvent("vrp:sellweed")
            end
        end
    end
end)