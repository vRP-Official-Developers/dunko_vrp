local NearLootBag = false; 
local LootBagID = nil;
local LootBagIDNew = nil;
local model = GetHashKey('prop_cs_heist_bag_01')

Citizen.CreateThread(function()
    while true do 
        Wait(250)
        local coords = GetEntityCoords(PlayerPedId())
        if DoesObjectOfTypeExistAtCoords(coords, 1.5, model, true) then
           NearLootBag = true;
           LootBagID = GetClosestObjectOfType(coords, 1.5, model, false, false, false)
           LootBagIDNew = ObjToNet(LootBagID)
        else 
            NearLootBag = false; 
            LootBagID = nil;
        end
    end
end)

Citizen.CreateThread(function()
    while true do 
        Wait(0)
        if NearLootBag then 
            Draw3DText(GetEntityCoords(LootBagID), "~g~~w~[~r~E~w~] to loot")
            if IsControlJustPressed(0, 38) then
                TriggerServerEvent('vRP:LootBag', LootBagIDNew)
            end
        end
    end
end)


function Draw3DText(coords, text)
    local x,y,z = table.unpack(coords)
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