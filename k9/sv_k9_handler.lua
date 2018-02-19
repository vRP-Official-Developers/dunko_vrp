--[[

    DO NOT TOUCH THESE. THIS CHECKS FOR THE SERVER CONFIG VALUES AND PASSES THE CONFIG DATA TO THE FUNCTIONS!!

--]]


-- Toggling K9 Menu
RegisterServerEvent('K9:SendMenuToggle')
AddEventHandler('K9:SendMenuToggle', function()
    local id = source
    TriggerClientEvent("K9:OpenMenu", id, {
        isRestricted = K9_Config.PedRestricted, 
        PedList = K9_Config.PedList,
    })
end)

-- Toggling Dog Spawn and Delete
RegisterServerEvent('K9:SendSpawnSettings')
AddEventHandler('K9:SendSpawnSettings', function()
    local id = source
    TriggerClientEvent("K9:ToggleDog", id, {
        dogmodel = K9_Config.DogModel, 
        godmode = K9_Config.GodmodeDog
    })
end)

    -- Toggling Dog In / Out of a vehicle.
RegisterServerEvent("K9:SendVehicleSettings")
AddEventHandler("K9:SendVehicleSettings", function()
    print("K9:SendVehicleSettings Triggered")
    local id = source
    TriggerClientEvent("K9:Vehicle", id, {
        isRestricted = K9_Config.VehicleRestricted,
        VehicleList = K9_Config.VehicleList
    })
end)

    -- Sending Data For K9 Search Function
RegisterServerEvent("K9:SendSearchSettings")
AddEventHandler("K9:SendSearchSettings", function()
    local id = source
    TriggerClientEvent("K9:Search", id, {
        config = K9_Config.SearchSetting,
        items = K9_Config.Items
    })
end)