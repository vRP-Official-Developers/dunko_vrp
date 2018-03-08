local vehPrice = nil
local modPrice = vehPrice

Citizen.CreateThread(function()
	local blipX = 2505.325
	local blipY = 4217.261
	local blipZ = 39.926
	local loadedBlip = false

	while true do
		Citizen.Wait(0)
		local x,y,z = table.unpack(GetEntityCoords(GetPlayerPed(-1), true))
		local distance = GetDistanceBetweenCoords(2505.325, 4214.261, 38.5, x, y, z, true)
	
		--load blip
		if not loadedBlip then 
			local blipSellCar = AddBlipForCoord(blipX, blipY, blipZ)
			SetBlipSprite(blipSellCar, 227)
			SetBlipDisplay(blipSellCar, 2)
			SetBlipScale(blipSellCar, 1.0)
			SetBlipColour(blipSellCar, 1)
			SetBlipAlpha(blipSellCar, 255)
			SetBlipAsShortRange(blipSellCar, true)
			BeginTextCommandSetBlipName("String")
			AddTextComponentString("Chop Shop")
			EndTextCommandSetBlipName(blipSellCar)
			loadedBlip = true
		end
		
		--load marker if player is in vehicle
		if IsPedSittingInAnyVehicle(GetPlayerPed(-1)) then		
			local vehicle = GetVehiclePedIsIn(GetPlayerPed(-1), false)
			local class = GetVehicleClass(vehicle)
			
			TriggerServerEvent("getVehPrice", class)
			DrawMarker(1, 2505.325, 4214.261, 38.5, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 4.0, 4.0, 2.0, 255, 0, 0, 100, false, true, 1, false, false, false, false)
		end
		
		--vehicle health modifier
		if IsPedSittingInAnyVehicle(GetPlayerPed(-1)) and vehPrice ~= nil then
			local health = GetEntityHealth(GetVehiclePedIsIn(GetPlayerPed(-1)))
			local modifier = health/1000
			modPrice = round((modifier * vehPrice), 0)
		end
		
		--ability to sell car if in range of chop shop
		if IsPedSittingInAnyVehicle(GetPlayerPed(-1)) and distance <= 4.0 then
			ShowHelp()
			if IsControlPressed(1, 38) then
				sellVehicle()
			end
		end
	end
end)

RegisterNetEvent("setVehPrice")
AddEventHandler("setVehPrice", function(price)
	vehPrice = price
end)

function ShowHelp()
    SetTextEntry("STRING")
    AddTextComponentString("Press ~INPUT_PICKUP~ to sell your vehicle for ~b~$" .. modPrice .. "~s~!")
end

function sellVehicle()
	if vehPrice == nil then
		TriggerEvent("chatMessage", "^2You cannot sell this car!")
	else
		TriggerServerEvent("sellVehicle", modPrice)
		local vehicle = SetEntityAsMissionEntity(GetVehiclePedIsIn(GetPlayerPed(-1)), true, true)
		DeleteVehicle(vehicle)
		vehPrice = nil
	end
	Citizen.Wait(120000)
end

function round(num, numDecimalPlaces)
	local mult = 10^(numDecimalPlaces or 0)
	return math.floor(num * mult + 0.5) / mult
end