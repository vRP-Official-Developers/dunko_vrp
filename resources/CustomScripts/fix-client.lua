RegisterNetEvent("murtaza:fix")
AddEventHandler("murtaza:fix", function()
	local playerPed = GetPlayerPed(-1)
	if IsPedInAnyVehicle(playerPed) then
		local vehicle = GetVehiclePedIsIn(playerPed)
		SetVehicleEngineHealth(vehicle, 9999)
		SetVehiclePetrolTankHealth(vehicle, 9999)
		SetVehicleFixed(vehicle)
		notification("~g~Your vehicle has been fixed.")
	else
		notification("~g~You are not in a vehicle.")
	end
end)

function notification(msg)
	SetNotificationTextEntry("STRING")
	AddTextComponentString(msg)
	DrawNotification(false, false)
end