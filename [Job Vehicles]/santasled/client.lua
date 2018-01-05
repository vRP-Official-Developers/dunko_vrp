Citizen.CreateThread(function() 
	DisableVehicleWeapon(true,"VEHICLE_WEAPON_PLANE_ROCKET",GetVehiclePedIsIn(GetPlayerPed(-1)),GetPlayerPed(-1))
	DisableVehicleWeapon(true,"VEHICLE_WEAPON_PLAYER_BULLET",GetVehiclePedIsIn(GetPlayerPed(-1)),GetPlayerPed(-1))
	end
end