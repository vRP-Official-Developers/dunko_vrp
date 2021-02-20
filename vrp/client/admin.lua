local noclip = false
local noclip_speed = 5.0

function tvRP.toggleNoclip()
    noclip = not noclip
    local ped = GetPlayerPed(-1)
    if noclip then -- set
        SetEntityInvincible(ped, true)
        SetEntityVisible(ped, false, false)
    else -- unset
        SetEntityInvincible(ped, false)
        SetEntityVisible(ped, true, false)
    end
end

function tvRP.isNoclip()
    return noclip
end

-- noclip/invisibility
Citizen.CreateThread(function()
    while true do
        Citizen.Wait(0)
        if noclip then
            local ped = GetPlayerPed(-1)
            local x, y, z = tvRP.getPosition()
            local dx, dy, dz = tvRP.getCamDirection()
            local speed = noclip_speed

            -- reset velocity
            SetEntityVelocity(ped, 0.0001, 0.0001, 0.0001)

            -- forward
            if IsControlPressed(0, 32) then -- MOVE UP
                x = x + speed * dx
                y = y + speed * dy
                z = z + speed * dz
            end

            -- backward
            if IsControlPressed(0, 269) then -- MOVE DOWN
                x = x - speed * dx
                y = y - speed * dy
                z = z - speed * dz
            end

            SetEntityCoordsNoOffset(ped, x, y, z, true, true, true)
        end
    end
end)

local function teleportToWaypoint()
    local targetPed = GetPlayerPed(-1)
    local targetVeh = GetVehiclePedIsUsing(targetPed)
    if (IsPedInAnyVehicle(targetPed)) then
        targetPed = targetVeh
    end

    if (not IsWaypointActive()) then
        vRP.notify({"~r~ Map Marker not found."})
        return
    end

    local waypointBlip = GetFirstBlipInfoId(8) -- 8 = waypoint Id
    local x, y, z = table.unpack(Citizen.InvokeNative(0xFA7C7F0AADF25D09, waypointBlip, Citizen.ResultAsVector()))

    -- ensure entity teleports above the ground
    local ground
    local groundFound = false
    local groundCheckHeights = {100.0, 150.0, 50.0, 0.0, 200.0, 250.0, 300.0, 350.0, 400.0, 450.0, 500.0, 550.0, 600.0,
                                650.0, 700.0, 750.0, 800.0}

    for i, height in ipairs(groundCheckHeights) do
        SetEntityCoordsNoOffset(targetPed, x, y, height, 0, 0, 1)
        Wait(10)

        ground, z = GetGroundZFor_3dCoord(x, y, height)
        if (ground) then
            z = z + 3
            groundFound = true
            break
        end
    end

    if (not groundFound) then
        z = 1000
        GiveDelayedWeaponToPed(PlayerPedId(), 0xFBAB5776, 1, 0) -- parachute
    end

    SetEntityCoordsNoOffset(targetPed, x, y, z, 0, 0, 1)
    vRP.notify({"~g~ Teleported to waypoint."})
end
RegisterNetEvent("TpToWaypoint")
AddEventHandler("TpToWaypoint", teleportToWaypoint)
