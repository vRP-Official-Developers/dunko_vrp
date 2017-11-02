frozen = false

-- Freeze (stops players from moving)
function tvRP.toggleFreeze()
   frozen = not frozen
    if frozen then
      FreezeEntityPosition(GetPlayerPed(-1), true)
    else
      FreezeEntityPosition(GetPlayerPed(-1), false)
    end
end