RegisterNetEvent("equipBackpack")
AddEventHandler("equipBackpack", function()
    SetPedComponentVariation(PlayerPedId(), 5, 45, 0, 0)
end)

RegisterNetEvent("removeBackpack")
AddEventHandler("removeBackpack", function()
    SetPedComponentVariation(PlayerPedId(), 5, 0, 0,0 )
end)