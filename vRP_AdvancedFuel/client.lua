essence = 0.142
local stade = 0
local lastModel = 0

local vehiclesUsed = {}



Citizen.CreateThread(function()
	TriggerServerEvent("essence:addPlayer")
	while true do
		Citizen.Wait(0)
		CheckVeh()
		renderBoxes()
	end

end)


Citizen.CreateThread(function()

	local menu = false
	local bool = false
	local int = 0
	local position = 1
	local array = {"TEST", "TEST2", "TEST3", "TEST4"}

	while true do
		Citizen.Wait(0)
		
		local isNearFuelStation, stationNumber = isNearStation()
		local isNearFuelPStation, stationPlaneNumber = isNearPlaneStation()
		local isNearFuelHStation, stationHeliNumber = isNearHeliStation()
		local isNearFuelBStation, stationBoatNumber = isNearBoatStation()


		------------------------------- VEHICLE FUEL PART -------------------------------

		if(isNearFuelStation and IsPedInAnyVehicle(GetPlayerPed(-1), -1) and not IsPedInAnyHeli(GetPlayerPed(-1)) and not isBlackListedModel() and not isElectricModel()) then
			Info(settings[lang].openMenu)

			if(IsControlJustPressed(1, 38)) then
				menu = not menu
				int = 0
				--[[Menu.hidden = not Menu.hidden
				
				Menu.Title = "Station essence"
				ClearMenu()
				Menu.addButton("Eteindre le moteur", "stopMotor")]]--
			end

			if(menu) then
				TriggerEvent("GUI:Title", settings[lang].buyFuel)

				local maxEscense = 60-(essence/0.142)*60

				TriggerEvent("GUI:Int", settings[lang].liters.." : ", int, 0, maxEscense, function(cb)
					int = cb
				end)

				TriggerEvent("GUI:Option", settings[lang].confirm, function(cb)
					if(cb) then
						menu = not menu

						TriggerServerEvent("essence:buy", int, stationNumber,false)
					else
					
					end
				end)

				TriggerEvent("GUI:Update")
			end
		else
			if(isNearFuelStation and IsPedInAnyVehicle(GetPlayerPed(-1), -1) and not IsPedInAnyHeli(GetPlayerPed(-1)) and not isBlackListedModel()) then
				Info(settings[lang].electricError)
			end
		end


		------------------------------- ELECTRIC VEHICLE PART -------------------------------

		if(isNearElectricStation() and IsPedInAnyVehicle(GetPlayerPed(-1), -1) and not IsPedInAnyHeli(GetPlayerPed(-1)) and not isBlackListedModel() and isElectricModel()) then
			Info(settings[lang].openMenu)

			if(IsControlJustPressed(1, 38)) then
				menu = not menu
				int = 0
				--[[Menu.hidden = not Menu.hidden
				
				Menu.Title = "Station essence"
				ClearMenu()
				Menu.addButton("Eteindre le moteur", "stopMotor")]]--
			end

			if(menu) then
				TriggerEvent("GUI:Title", settings[lang].buyFuel)

				local maxEssence = 60-(essence/0.142)*60

				TriggerEvent("GUI:Int", settings[lang].percent.." : ", int, 0, maxEssence, function(cb)
					int = cb
				end)

				TriggerEvent("GUI:Option", settings[lang].confirm, function(cb)
					if(cb) then
						menu = not menu

						TriggerServerEvent("essence:buy", int, electricityPrice,true)
					else
					
					end
				end)

				TriggerEvent("GUI:Update")
			end
		else
			if(isNearElectricStation()  and IsPedInAnyVehicle(GetPlayerPed(-1), -1) and not IsPedInAnyHeli(GetPlayerPed(-1)) and not isBlackListedModel()) then
				Info(settings[lang].fuelError)
			end
		end

		------------------------------- BOAT PART -------------------------------

		if(isNearFuelBStation and IsPedInAnyVehicle(GetPlayerPed(-1), -1) and not IsPedInAnyHeli(GetPlayerPed(-1)) and not isBlackListedModel()) then
			Info(settings[lang].openMenu)

			if(IsControlJustPressed(1, 38)) then
				menu = not menu
				int = 0
				--[[Menu.hidden = not Menu.hidden
				
				Menu.Title = "Station essence"
				ClearMenu()
				Menu.addButton("Eteindre le moteur", "stopMotor")]]--
			end

			if(menu) then
				TriggerEvent("GUI:Title", settings[lang].buyFuel)

				local maxEssence = 60-(essence/0.142)*60
				TriggerEvent("GUI:Int", settings[lang].percent.." : ", int, 0, maxEssence, function(cb)
					int = cb
				end)

				TriggerEvent("GUI:Option", settings[lang].confirm, function(cb)
					if(cb) then
						menu = not menu

						TriggerServerEvent("essence:buy", int, stationBoatNumber,false)
					else
					
					end
				end)

				TriggerEvent("GUI:Update")
			end
		else
			if(isNearFuelBStation  and IsPedInAnyVehicle(GetPlayerPed(-1), -1) and not IsPedInAnyHeli(GetPlayerPed(-1)) and not isBlackListedModel()) then
				Info(settings[lang].fuelError)
			end
		end

		------------------------------- PLANE PART -------------------------------

		if(isNearFuelPStation and IsPedInAnyVehicle(GetPlayerPed(-1), -1) and not isBlackListedModel() and isPlaneModel()) then
			Info(settings[lang].openMenu)

			if(IsControlJustPressed(1, 38)) then
				menu = not menu
				int = 0
				--[[Menu.hidden = not Menu.hidden
				
				Menu.Title = "Station essence"
				ClearMenu()
				Menu.addButton("Eteindre le moteur", "stopMotor")]]--
			end

			if(menu) then
				TriggerEvent("GUI:Title", settings[lang].buyFuel)

				local maxEssence = 60-(essence/0.142)*60

				TriggerEvent("GUI:Int", settings[lang].percent.." : ", int, 0, maxEssence, function(cb)
					int = cb
				end)

				TriggerEvent("GUI:Option", settings[lang].confirm, function(cb)
					if(cb) then
						menu = not menu

						TriggerServerEvent("essence:buy", int, stationPlaneNumber,false)
					else
					
					end
				end)

				TriggerEvent("GUI:Update")
			end
		else
			if(isNearFuelPStation  and IsPedInAnyVehicle(GetPlayerPed(-1), -1) and not isBlackListedModel() and not isPlaneModel()) then
				Info(settings[lang].fuelError)
			end
		end

		------------------------------- HELI PART -------------------------------

		if(isNearFuelHStation and IsPedInAnyVehicle(GetPlayerPed(-1), -1) and not isBlackListedModel() and isHeliModel()) then
			Info(settings[lang].openMenu)

			if(IsControlJustPressed(1, 38)) then
				menu = not menu
				int = 0
				--[[Menu.hidden = not Menu.hidden
				
				Menu.Title = "Station essence"
				ClearMenu()
				Menu.addButton("Eteindre le moteur", "stopMotor")]]--
			end

			if(menu) then
				TriggerEvent("GUI:Title", settings[lang].buyFuel)

				local maxEssence = 60-(essence/0.142)*60

				TriggerEvent("GUI:Int", settings[lang].percent.." : ", int, 0, maxEssence, function(cb)
					int = cb
				end)

				TriggerEvent("GUI:Option", settings[lang].confirm, function(cb)
					if(cb) then
						menu = not menu

						TriggerServerEvent("essence:buy", int, stationHeliNumber,false)
					else
					
					end
				end)

				TriggerEvent("GUI:Update")
			end
		else
			if(isNearFuelHStation  and IsPedInAnyVehicle(GetPlayerPed(-1), -1) and not isBlackListedModel() and not isHeliModel()) then
				Info(settings[lang].fuelError)
			end
		end

	end
end)

local wasInAVeh = false
Citizen.CreateThread(function()

	while true do
		Citizen.Wait(0)
		if(vehiclesUsed ~= nil and IsPedInAnyVehicle(GetPlayerPed(-1)) and GetPedVehicleSeat(GetPlayerPed(-1)) == -1 and not isBlackListedModel()) then
			wasInAVeh = true
			local index = getVehIndex()
			TriggerServerEvent("essence:setToAllPlayerEscense", essence, GetVehicleNumberPlateText(GetVehiclePedIsUsing(GetPlayerPed(-1))), GetDisplayNameFromVehicleModel(GetEntityModel(GetVehiclePedIsUsing(GetPlayerPed(-1)))))
			Citizen.Wait(1000)
		else
			if(wasInAVeh) then
				TriggerServerEvent("essence:setToAllPlayerEscense", essence, GetVehicleNumberPlateText(GetVehiclePedIsUsing(GetPlayerPed(-1))), GetDisplayNameFromVehicleModel(GetEntityModel(GetVehiclePedIsUsing(GetPlayerPed(-1)))))
				wasInAVeh = false
			end
		end
	end

end)


Citizen.CreateThread(function()

	while true do
		Citizen.Wait(1000)

		if(IsPedInAnyVehicle(GetPlayerPed(-1), -1) and GetPedVehicleSeat(GetPlayerPed(-1)) == -1 and not isBlackListedModel()) then
			local kmh = GetEntitySpeed(GetVehiclePedIsIn(GetPlayerPed(-1), false)) * 3.6
			local vitesse = math.ceil(kmh)

			if(vitesse > 0 and vitesse <20) then
				stade = 0.00001
			elseif(vitesse >= 20 and vitesse <50) then
				stade = 0.00002
			elseif(vitesse >= 50 and vitesse < 70) then
				stade = 0.00003
			elseif(vitesse >= 70 and vitesse <90) then
				stade = 0.00004
			elseif(vitesse >=90 and vitesse <130) then
				stade = 0.00005
			elseif(vitesse >= 130) then
				stade = 0.00006
			else
				stade = 0
			end

			local _essence = essence
			if(essence - stade > 0) then
				essence = essence - stade
			else
				essence = 0
				SetVehicleUndriveable(GetVehiclePedIsUsing(GetPlayerPed(-1)), true)
			end
		end
	end

end)

-- 0.0001 pour 0 à 20, 0.142 = 100%
-- Donc 0.0001 km en moins toutes les 10 secondes

local lastPlate = 0
function CheckVeh()
	if(IsPedInAnyVehicle(GetPlayerPed(-1), -1) and not isBlackListedModel()) then

		--if((lastPlate == GetVehicleNumberPlateText(GetVehiclePedIsUsing(GetPlayerPed(-1))) and lastModel ~= GetDisplayNameFromVehicleModel(GetEntityModel(GetVehiclePedIsUsing(GetPlayerPed(-1))))) or (lastPlate ~= GetVehicleNumberPlateText(GetVehiclePedIsUsing(GetPlayerPed(-1))) and lastModel == GetDisplayNameFromVehicleModel(GetEntityModel(GetVehiclePedIsUsing(GetPlayerPed(-1))))) or (lastPlate ~= GetVehicleNumberPlateText(GetVehiclePedIsUsing(GetPlayerPed(-1))) and lastModel ~= GetDisplayNameFromVehicleModel(GetEntityModel(GetVehiclePedIsUsing(GetPlayerPed(-1))))) then
		if(not wasInAVeh) then
			TriggerServerEvent("vehicule:getFuel", GetVehicleNumberPlateText(GetVehiclePedIsUsing(GetPlayerPed(-1))), GetDisplayNameFromVehicleModel(GetEntityModel(GetVehiclePedIsUsing(GetPlayerPed(-1)))))
			lastModel = GetDisplayNameFromVehicleModel(GetEntityModel(GetVehiclePedIsUsing(GetPlayerPed(-1))))
			lastPlate = GetVehicleNumberPlateText(GetVehiclePedIsUsing(GetPlayerPed(-1)))
		end
	end


	if(essence == 0 and GetVehiclePedIsUsing(GetPlayerPed(-1)) ~= nil) then
		SetVehicleEngineOn(GetVehiclePedIsUsing(GetPlayerPed(-1)), false, false, false)
	end
end



function renderBoxes()
	if(IsPedInAnyVehicle(GetPlayerPed(-1), -1) and GetPedVehicleSeat(GetPlayerPed(-1)) == -1 and not isBlackListedModel()) then

		if(hud_form == 1) then
			DrawRect(hud_x, hud_y, 0.0149999999999998, 0.15, 255, 255, 255, 200)
			DrawRect(hud_x, hud_y, 0.0119999999999998, 0.142, 80, 80, 80, 255)
			DrawRect(hud_x, hud_y, 0.0119999999999998, essence, 225, 146, 45, 255)
			local percent = (essence/0.142)*100

			DrawAdvancedText(text_x, text_y, 0.005, 0.0028, 0.4,round(percent,1).."%", 255, 255, 255, 255, 0, 1)
		else
			DrawRect(hud_x, hud_y, 0.15, 0.0149999999999998, 255, 255, 255, 200)
			DrawRect(hud_x, hud_y, 0.142, 0.0119999999999998, 80, 80, 80, 255)
			DrawRect(hud_x, hud_y, essence, 0.0119999999999998, 225, 146, 45, 255)
			local percent = (essence/0.142)*100

			DrawAdvancedText(text_x, text_y, 0.005, 0.0028, 0.4,round(percent,1).."%", 255, 255, 255, 255, 0, 1)
		end
	end
end








function isNearStation()
	local ped = GetPlayerPed(-1)
	local plyCoords = GetEntityCoords(GetPlayerPed(-1), 0)

	for _,items in pairs(station) do
		if(GetDistanceBetweenCoords(items.x, items.y, items.z, plyCoords["x"], plyCoords["y"], plyCoords["z"], true) < 2) then
			return true, items.s
		end
	end

	return false
end


function isNearPlaneStation()
	local ped = GetPlayerPed(-1)
	local plyCoords = GetEntityCoords(GetPlayerPed(-1), 0)

	for _,items in pairs(avion_stations) do
		if(GetDistanceBetweenCoords(items.x, items.y, items.z, plyCoords["x"], plyCoords["y"], plyCoords["z"], true) < 10) then
			return true, items.s
		end
	end

	return false
end


function isNearHeliStation()
	local ped = GetPlayerPed(-1)
	local plyCoords = GetEntityCoords(GetPlayerPed(-1), 0)

	for _,items in pairs(heli_stations) do
		if(GetDistanceBetweenCoords(items.x, items.y, items.z, plyCoords["x"], plyCoords["y"], plyCoords["z"], true) < 10) then
			return true, items.s
		end
	end

	return false
end


function isNearBoatStation()
	local ped = GetPlayerPed(-1)
	local plyCoords = GetEntityCoords(GetPlayerPed(-1), 0)

	for _,items in pairs(boat_stations) do
		if(GetDistanceBetweenCoords(items.x, items.y, items.z, plyCoords["x"], plyCoords["y"], plyCoords["z"], true) < 10) then
			return true, items.s
		end
	end

	return false
end


function isNearElectricStation()
	local ped = GetPlayerPed(-1)
	local plyCoords = GetEntityCoords(GetPlayerPed(-1), 0)

	for _,items in pairs(electric_stations) do
		if(GetDistanceBetweenCoords(items.x, items.y, items.z, plyCoords["x"], plyCoords["y"], plyCoords["z"], true) < 2) then
			return true
		end
	end

	return false
end

--100% = 100L = 100$
-- 1% = 1L = 1


function Info(text, loop)
	SetTextComponentFormat("STRING")
	AddTextComponentString(text)
	DisplayHelpTextFromStringLabel(0, loop, 1, 0)
end



function round(num, dec)
  local mult = 10^(dec or 0)
  return math.floor(num * mult + 0.5) / mult
end


function isBlackListedModel()
	local model = GetDisplayNameFromVehicleModel(GetEntityModel(GetVehiclePedIsIn(GetPlayerPed(-1))))
	local isBL = false
	for _,k in pairs(blacklistedModels) do
		if(k==model) then
			isBL = true
			break;
		end
	end

	return isBL
end

function isElectricModel()
	local model = GetDisplayNameFromVehicleModel(GetEntityModel(GetVehiclePedIsIn(GetPlayerPed(-1))))
	local isEL = false
	for _,k in pairs(electric_model) do
		if(k==model) then
			isEL = true
			break;
		end
	end

	return isEL
end


function isHeliModel()
	local model = GetDisplayNameFromVehicleModel(GetEntityModel(GetVehiclePedIsIn(GetPlayerPed(-1))))
	local isHe = false
	for _,k in pairs(heli_model) do
		if(k==model) then
			isHe = true
			break;
		end
	end

	return isHe
end


function isPlaneModel()
	local model = GetDisplayNameFromVehicleModel(GetEntityModel(GetVehiclePedIsIn(GetPlayerPed(-1))))
	local isPl = false
	for _,k in pairs(plane_model) do
		if(k==model) then
			isPl = true
			break;
		end
	end

	return isPl
end


function DrawAdvancedText(x,y ,w,h,sc, text, r,g,b,a,font,jus)
    SetTextFont(font)
    SetTextProportional(0)
    SetTextScale(sc, sc)
	N_0x4e096588b13ffeca(jus)
    SetTextColour(r, g, b, a)
    SetTextDropShadow(0, 0, 0, 0,255)
    SetTextEdge(1, 0, 0, 0, 255)
    SetTextDropShadow()
    SetTextOutline()
    SetTextEntry("STRING")
    AddTextComponentString(text)
	DrawText(x - 0.1+w, y - 0.02+h)
end


function drawTxt(x,y ,width,height,scale, text, r,g,b,a)
    SetTextFont(4)
    SetTextProportional(0)
    SetTextScale(scale, scale)
    SetTextColour(r, g, b, a)
    SetTextDropShadow(0, 0, 0, 0,255)
    SetTextEdge(2, 0, 0, 0, 255)
    SetTextDropShadow()
    SetTextOutline()
    SetTextEntry("STRING")
    AddTextComponentString(text)
    DrawText(x - width/2, y - height/2 + 0.005)
end

function drawRct(x,y,width,height,r,g,b,a)
	DrawRect(x + width/2, y + height/2, width, height, r, g, b, a)
end



RegisterNetEvent("essence:setEssence")
AddEventHandler("essence:setEssence", function(ess,vplate,vmodel)
	if(ess ~= nil and vplate ~= nil and vmodel ~=nil) then
		local bool,index = searchByModelAndPlate(vplate,vmodel)

		if(bool and index ~=nil) then
			vehiclesUsed[index].es = ess
		else
			table.insert(vehiclesUsed, {plate = vplate, model = vmodel, es = ess})
		end
	end
end)




RegisterNetEvent("essence:hasBuying")
AddEventHandler("essence:hasBuying", function(amount)
	local amountToEssence = (amount/60)*0.142

	local done = false
	while done == false do
		Wait(0)
		local _essence = essence
		if(amountToEssence-0.0005 > 0) then
			amountToEssence = amountToEssence-0.0005
			essence = _essence + 0.0005
			_essence = essence
			if(_essence > 0.142) then
				essence = 0.142
				done = true
			end
			SetVehicleUndriveable(GetVehiclePedIsUsing(GetPlayerPed(-1)), true)
			SetVehicleEngineOn(GetVehiclePedIsUsing(GetPlayerPed(-1)), false, false, false)
			Wait(100)
		else
			essence = essence + amountToEssence
			done = true
		end
	end

	--local index = getVehIndex()
	--vehiclesUsed[index].es = essence

	SetVehicleUndriveable(GetVehiclePedIsUsing(GetPlayerPed(-1)), false)
	SetVehicleEngineOn(GetVehiclePedIsUsing(GetPlayerPed(-1)), true, false, false)
end)


RegisterNetEvent("vehicule:sendFuel")
AddEventHandler("vehicule:sendFuel", function(bool, ess)

	if(bool == 1) then
		essence = ess
	else
		essence = (math.random(1,100)/100)*0.142
		--table.insert(vehiclesUsed, {plate = GetVehicleNumberPlateText(GetVehiclePedIsUsing(GetPlayerPed(-1))), model = GetDisplayNameFromVehicleModel(GetEntityModel(GetVehiclePedIsUsing(GetPlayerPed(-1)))), es = essence})
		vehicle = GetVehiclePedIsUsing(GetPlayerPed(-1))
	end

end)

function GetPedVehicleSeat(ped)
    local vehicle = GetVehiclePedIsIn(ped, false)
    for i=-2,GetVehicleMaxNumberOfPassengers(vehicle) do
        if(GetPedInVehicleSeat(vehicle, i) == ped) then return i end
    end
    return -2
end


AddEventHandler("playerSpawned", function()
	TriggerServerEvent("essence:playerSpawned")
	TriggerServerEvent("essence:addPlayer")
end)


RegisterNetEvent("showNotif")
AddEventHandler("showNotif", function(text)
	SetNotificationTextEntry("STRING")
	AddTextComponentString(text)
	DrawNotification(false, false)
end)







RegisterNetEvent("advancedFuel:setEssence")
AddEventHandler("advancedFuel:setEssence", function(percent, plate, model)
	local toEssence = (percent/100)*0.142

	if(GetVehicleNumberPlateText(GetVehiclePedIsUsing(GetPlayerPed(-1))) == plate) then
		essence = toEssence
	end

	local bool, index = searchByModelAndPlate(plate, model)()

	if(bool) then
		vehiclesUsed[index].es = toEssence
	end
end)


RegisterNetEvent('essence:sendEssence')
AddEventHandler('essence:sendEssence', function(array)
	for i,k in pairs(array) do
		vehiclesUsed[i] = {plate=k.plate,model=k.model,es=k.es}
	end
end)





function IsVehInArray()
	for i,k in pairs(vehiclesUsed) do
		if(k.plate == GetVehicleNumberPlateText(GetVehiclePedIsUsing(GetPlayerPed(-1))) and k.model == GetDisplayNameFromVehicleModel(GetEntityModel(GetVehiclePedIsUsing(GetPlayerPed(-1))))) then
			return true
		end
	end

	return false
end


function searchByModelAndPlate(plate, model)
	for i,k in pairs(vehiclesUsed) do
		if(k.plate == plate and k.model == model) then
			return true, i
		end
	end

	return false, nil
end


function getVehIndex()
	local index = -1

	for i,k in pairs(vehiclesUsed) do
		if(k.plate == GetVehicleNumberPlateText(GetVehiclePedIsUsing(GetPlayerPed(-1))) and k.model == GetDisplayNameFromVehicleModel(GetEntityModel(GetVehiclePedIsUsing(GetPlayerPed(-1))))) then
			index = i
		end
	end

	return index
end
