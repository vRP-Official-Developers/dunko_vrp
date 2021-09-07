
function DrawText3D(x,y,z, text) -- 3D TEXT
    local onScreen,_x,_y=World3dToScreen2d(x,y,z)
    local px,py,pz=table.unpack(GetGameplayCamCoords())
    local dist = GetDistanceBetweenCoords(px,py,pz, x,y,z, 1)

    local scale = (1/dist)*2
    local fov = (1/GetGameplayCamFov())*100
    local scale = scale*fov
    
    if onScreen then
        SetTextScale(0.0*scale, 0.55*scale)
        SetTextFont(0)
        SetTextProportional(1)
        SetTextColour(255, 153, 51, 255)
        SetTextDropshadow(0, 0, 0, 0, 255)
        SetTextEdge(2, 0, 0, 0, 150)
        SetTextDropShadow()
        SetTextOutline()
        SetTextEntry("STRING")
        SetTextCentre(1)
        AddTextComponentString(text)
		World3dToScreen2d(x,y,z, 0) --Added Here
        DrawText(_x,_y)
    end
end

Citizen.CreateThread(function()
        local pedhash = GetHashKey("ig_ramp_gang")
        while not HasModelLoaded(pedhash) do
            Citizen.Wait(0)
            RequestModel(pedhash) 
        end
        pedcoordsvec = vector3(116.9849395752, -1950.8447265625, 20.749992370605 - 1)
    Citizen.Wait(3000)
    local created_ped = CreatePed(1, pedhash, pedcoordsvec.x, pedcoordsvec.y, pedcoordsvec.z, 51.722648620605, true, true)
    SetEntityAsMissionEntity(created_ped, true, true)
    Citizen.Wait(1000)
    FreezeEntityPosition(created_ped, true)
    SetEntityInvincible(created_ped, true)
    SetBlockingOfNonTemporaryEvents(created_ped, true)
end)

AddEventHandler('onClientResourceStart', function() -- ON RESOURCE START
     local pedhash = GetHashKey("ig_ramp_gang")

        Citizen.CreateThread(function()
        while true do
            Citizen.Wait(0)
            -- WEED HARVEST
            local coords = vector3(2223.3071289062 ,5576.1845703125, 53.654960632324) 
            DrawMarker(25, coords.x, coords.y, coords.z - 0.8, 0.0, 0.0, 0.0, 0.0, 180.0, 0.0, 2.0, 2.0, 2.0, 255, 128, 0, 50, false, true, 2, nil, nil, true)
            DrawText3D(coords.x,coords.y,coords.z, "Press E to harvest weed.")
            -- WEED PROCESSOR
            local coords = vector3(1591.0010986328, 3592.1979980469, 38.766506195068)
            DrawMarker(25, coords.x, coords.y, coords.z - 0.8, 0.0, 0.0, 0.0, 0.0, 180.0, 0.0, 2.0, 2.0, 2.0, 255, 128, 0, 50, false, true, 2, nil, nil, true)
            DrawText3D(coords.x,coords.y,coords.z, "Press E to bag your weed.")
            -- WEED SELLER
            local coords = vector3(115.89520263672, -1949.8754882812, 20.711057662964)
            DrawMarker(25, coords.x, coords.y, coords.z - 0.95, 0.0, 0.0, 0.0, 0.0, 180.0, 0.0, 2.0, 2.0, 2.0, 255, 128, 0, 50, false, true, 2, nil, nil, true)
            DrawText3D(coords.x,coords.y,coords.z, "Press E to sell your weed.")
            end
        end)
       -- WEED HARVEST BLIP
       local coords = vector3(2223.3071289062 ,5576.1845703125, 53.654960632324)
       createBlip("weedHarvest", "Harvest Weed", coords, 469, 3, 1.1, 2, 1) 
       -- WEED PROCESSOR BLIP
       local coords = vector3(1591.0010986328, 3592.1979980469, 38.766506195068) 
       createBlip("weedBag", "Weed Processor", coords, 469, 3, 1.1, 2, 1)    
       -- WEED SELLER BLIP
       local coords = vector3(115.89520263672, -1949.8754882812, 20.711057662964) 
       createBlip("weedSell", "Weed Seller", coords, 469, 3, 1.1, 2, 1) 
end)

function createBlip(blipName, mapName, vector3, sprite, display, scale, colour, category) -- CREATE BLIPS
    local blipName = AddBlipForCoord(vector3.x, vector3.y, vector3.z)
    SetBlipSprite(blipName, sprite)
    SetBlipDisplay(blipName, display)
    SetBlipScale(blipName, scale)
    SetBlipColour(blipName, colour)
    SetBlipCategory(blipName, category)
    BeginTextCommandSetBlipName("STRING")
    AddTextComponentString(mapName)
    EndTextCommandSetBlipName(blipName)
end