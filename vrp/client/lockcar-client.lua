RegisterCommand('lockcar', function()
    local veh, name, nveh = tvRP.getNearestOwnedVehicle(5)
    if veh then 
        tvRP.vc_toggleLock(name)
        tvRP.playSound("HUD_MINI_GAME_SOUNDSET", "5_SEC_WARNING")
    end
end)

RegisterKeyMapping('lockcar', 'Locks and unlocks your vehicle', 'KEYBOARD', 'F3')