--[[

	DO NOT TOUCH THIS. THIS CONTROLS THE DOG IF THIS BREAKS THE DOG BREAKS!!

--]]

local current_dog = nil
local following = false
local attacking = false
local animation_played = nil
local dog_name = "DefaultNameHere"

local closest_vehicle = nil
local closest_door_name = nil
local closest_door_pos = nil

local other_ped_attacked = nil

RegisterNetEvent("K9:ToggleDog")
AddEventHandler("K9:ToggleDog", function(data)
	if current_dog == nil then
		-- Spawn Dog
		local model = GetHashKey(data.dogmodel)
		RequestModel(model)
		while not HasModelLoaded(model) do
			RequestModel(model)
			Citizen.Wait(100)
		end

		local plypos = GetOffsetFromEntityInWorldCoords(GetPlayerPed(PlayerId()), 0.0, 2.0, 0.0)
		local plyhead = GetEntityHeading(GetPlayerPed(PlayerId()))
		local spawned_entity = CreatePed(GetPedType(model), model, plypos.x, plypos.y, plypos.z, plyhead, 1, 1)
		SetBlockingOfNonTemporaryEvents(spawned_entity, true)
		SetPedFleeAttributes(spawned_entity, 0, 0)
		current_dog = spawned_entity
		local blip = AddBlipForEntity(current_dog)
		SetBlipAsFriendly(blip, true)
		SetBlipSprite(blip, 442)
		BeginTextCommandSetBlipName("STRING");
		AddTextComponentString(tostring("K9"))
		EndTextCommandSetBlipName(blip)

		NetworkRegisterEntityAsNetworked(current_dog)
		while not NetworkGetEntityIsNetworked(current_dog) do
			NetworkRegisterEntityAsNetworked(current_dog)
			Citizen.Wait(1)
		end

		if data.godmode == true then
			SetEntityInvincible(spawned_entity, true)
			SetPedCanRagdoll(spawned_entity, false)
		end
		Notification("Your dog " .. dog_name .. " is in service.")
	else
		SetEntityAsMissionEntity(current_dog, true, true)
		DeleteEntity(current_dog)
		Notification("Your dog " .. dog_name .. " is out of service.")
		current_dog = nil
	end
end)

RegisterNetEvent("K9:Vehicle")
AddEventHandler("K9:Vehicle", function(data)
	if current_dog ~= nil then
		if IsPedInAnyVehicle(current_dog, false) then
			TaskLeaveVehicle(current_dog, GetVehiclePedIsIn(current_dog, false), 256)
		else
			local plyPos = GetEntityCoords(GetPlayerPed(-1), false)
			local vehicle = GetClosestVehicle(plyPos['x'], plyPos['y'], plyPos['z'], 3.0, 0, 23)

			if data.VehicleRestricted == true then
				if CheckVehicleRestriction(vehicle, data.VehicleList) == true then
					TaskEnterVehicle(current_dog, vehicle, -1, 2, 2.0, 1, 0)
					following = false
					attacking = false
				end
			else
				TaskEnterVehicle(current_dog, vehicle, -1, 2, 2.0, 1, 0)
				following = false
				attacking = false
			end
		end
	end
end)

RegisterNetEvent("K9:Follow")
AddEventHandler("K9:Follow", function()
	if current_dog ~= nil then
		if following == false then
			TaskFollowToOffsetOfEntity(current_dog, GetPlayerPed(PlayerId()), 0.5, 0.0, 0.0, 5.0, -1, 0.0, 1)
			following = true
			Notification(tostring(dog_name .. " Hier!")) -- Come
		else
			ClearPedTasks(current_dog)
			following = false
			Notification(tostring(dog_name .. " Bleib!")) -- Stay
		end
	end
end)

RegisterNetEvent("K9:Attack")
AddEventHandler("K9:Attack", function()
	local dog_ped = current_dog
	local bool, other_ped = GetEntityPlayerIsFreeAimingAt(PlayerId())
	other_ped_attacked = other_ped

	if attacking == false then
		if IsEntityAPed(other_ped) then
			if not IsEntityDead(other_ped) then
				SetCanAttackFriendly(dog_ped, true, true)
				TaskPutPedDirectlyIntoMelee(dog_ped, other_ped, 0.0, -1.0, 0.0, 0)
				other_ped_attacked = other_ped
				attacking = true
				following = false
				Notification(tostring(dog_name .. " Fass!")) -- Attack
			end
		end
	else
		attacking = false
		other_ped_attacked = nil
		ClearPedTasks(dog_ped)
		Notification(tostring(dog_name .. " Zei Brav!")) -- Stopping Dog (Good Dog)
	end
end)

RegisterNetEvent("K9:Animations")
AddEventHandler("K9:Animations", function(choice)
	if animation_played ~= nil then -- Clear Animation Before Doing another action
		if animation_played == "sit" then -- Sit End
			sit(current_dog)
		elseif animation_played == "laydown" then
			laydown(current_dog)
		end
	else -- Start animation 
		if choice == "sit" then -- Sit Start
			sit(current_dog)
		elseif choice == "laydown" then -- Laydown Start
			laydown(current_dog)
		end
	end
	attacking = false
	following = false
end)

--[[ ANIMATION FUNCTIONS ]]--
function sit(entity)
	local animdicstart = "creatures@rottweiler@amb@world_dog_sitting@base"
	local animnamestart = "base"
	local animdicend = "creatures@rottweiler@amb@world_dog_sitting@exit"
	local animnameend = "exit"

	if IsEntityPlayingAnim(entity, animdicstart, animnamestart, 3) then
			RequestAnimDict(animdicend)
			while not HasAnimDictLoaded(animdicend) do
				Citizen.Wait(100)
				RequestAnimDict(animdicend)
			end
		TaskPlayAnim(current_dog, animdicend, animnameend, 1.0, -1, -1, 2, 0, 0, 0, 0)
		if HasEntityAnimFinished(current_dog, animdicend, animnameend, 3) then
			ClearPedSecondaryTask(current_dog)
		end
		animation_played = nil
		Notification(tostring(dog_name .. " Stehen!"))
	else
		RequestAnimDict(animdicstart)
		while not HasAnimDictLoaded(animdicstart) do
			Citizen.Wait(100)
			RequestAnimDict(animdicstart)
		end
		TaskPlayAnim(current_dog, animdicstart, animnamestart, 1.0, -1, -1, 2, 0, 0, 0, 0)
		animation_played = "sit"
		Notification(tostring(dog_name .. " Sitz!"))
	end
end

function laydown(entity)
	local animdicstart = "creatures@rottweiler@amb@sleep_in_kennel@"
	local animnamestart = "sleep_in_kennel"
	local animdicend = "creatures@rottweiler@amb@sleep_in_kennel@"
	local animnameend = "exit_kennel"

	if IsEntityPlayingAnim(entity, animdicstart, animnamestart, 3) then
			RequestAnimDict(animdicend)
			while not HasAnimDictLoaded(animdicend) do
				Citizen.Wait(100)
				RequestAnimDict(animdicend)
			end
		TaskPlayAnim(current_dog, animdicend, animnameend, 1.0, -1, -1, 2, 0, 0, 0, 0)
		if HasEntityAnimFinished(current_dog, animdicend, animnameend, 3) then
			ClearPedSecondaryTask(current_dog)
		end
		animation_played = nil
		Notification(tostring(dog_name .. " Stehen!"))
	else
		RequestAnimDict(animdicstart)
		while not HasAnimDictLoaded(animdicstart) do
			Citizen.Wait(100)
			RequestAnimDict(animdicstart)
		end
		TaskPlayAnim(current_dog, animdicstart, animnamestart, 1.0, -1, -1, 2, 0, 0, 0, 0)
		animation_played = "laydown"
		Notification(tostring(dog_name .. " Platz!"))
	end

end
--]]

--[[ SEARCH FUNCTIONS ]]--
RegisterNetEvent('K9:Search')
AddEventHandler('K9:Search', function(data)
	if not IsPedInAnyVehicle(GetPlayerPed(PlayerId(), false)) then
		if closest_door_name ~= "Can't Search" then
			if data.config == "random" then
				Notification("Dog is searching")
				local vHeading = GetEntityHeading(closest_vehicle)
				Citizen.Wait(1500)
				
				if closest_door_name == "Front Left Door" then
					TaskGoToCoordAnyMeans(current_dog, closest_door_pos['x'], closest_door_pos['y'], closest_door_pos['z'], 5.0, 0, 0, 786603, 0xbf800000)
					Citizen.Wait(3000)
					TaskAchieveHeading(current_dog, vHeading - 90, -1)
					SetVehicleDoorOpen(closest_vehicle, 0, false, false)
				elseif closest_door_name == "Front Right Door" then
					TaskGoToCoordAnyMeans(current_dog, closest_door_pos['x'], closest_door_pos['y'], closest_door_pos['z'], 5.0, 0, 0, 786603, 0xbf800000)
					Citizen.Wait(3000)
					TaskAchieveHeading(current_dog, vHeading - 270, -1)
					SetVehicleDoorOpen(closest_vehicle, 1, false, false)
				elseif closest_door_name == "Back Left Door" then
					TaskGoToCoordAnyMeans(current_dog, closest_door_pos['x'], closest_door_pos['y'], closest_door_pos['z'], 5.0, 0, 0, 786603, 0xbf800000)
					Citizen.Wait(3000)
					TaskAchieveHeading(current_dog, vHeading - 90, -1)
					SetVehicleDoorOpen(closest_vehicle, 2, false, false)
				elseif closest_door_name == "Back Right Door" then
					TaskGoToCoordAnyMeans(current_dog, closest_door_pos['x'], closest_door_pos['y'], closest_door_pos['z'], 5.0, 0, 0, 786603, 0xbf800000)
					Citizen.Wait(3000)
					TaskAchieveHeading(current_dog, vHeading - 270, -1)
					SetVehicleDoorOpen(closest_vehicle, 3, false, false)
				end
				
				Citizen.Wait(4000)
				TriggerEvent("chatMessage", tostring("^1K9 Found: ^0" .. RandomSearch(data.items) .. " in the " .. closest_door_name))
				SetVehicleDoorsShut(closest_vehicle, false)
			end
		end
	end
end)

function RandomSearch(items)
	local timesToRun = math.random(1, 4)

	for i = 1, timesToRun do
		local category = math.random(1, 100)

		if category > 31 and category <=80 then -- Clean Vehicle
			itemFound = "Nothing Found"
			return itemFound
		else
			if category >= 1 and category <= 10 then -- Illegal Choice
				local list = items['illegal']
				local chooseItem = math.random(1, #items['illegal'])
				itemFound = items['illegal'][chooseItem]
				return itemFound
			elseif category > 10 and category <=30 then -- Legal Choice
				local list = items['legal']
				local chooseItem = math.random(1, #items['legal'])
				itemFound = items['legal'][chooseItem]
				return itemFound
			elseif category > 80 and category <= 100 then -- Suspicious Items
				local list = items['suspicious']
				local chooseItem = math.random(1, #items['suspicious'])
				itemFound = items['suspicious'][chooseItem]
				return itemFound
			end
		end
	end
end
--]]

-- Handling Key Bindings and Attacking auto stop --
Citizen.CreateThread(function()
	while true do
		Citizen.Wait(0)

		-- Toggle Menu
		if IsControlPressed(1, 19) and IsControlJustPressed(1,20) then -- LEFTALT + Z
			TriggerServerEvent('K9:SendMenuToggle')
		end

		-- Follow Key --
		if IsControlJustPressed(1, 47) and not IsPlayerFreeAiming(PlayerId())  and current_dog ~= nil then
			TriggerEvent("K9:Follow")
		end

		-- Attacking Key --
		if IsPlayerFreeAiming(PlayerId()) and IsControlJustPressed(1, 47) and current_dog ~= nil then
			TriggerEvent("K9:Attack")
		end

		-- If other ped attacking dies it stops attacking --
		if attacking == true then
			if IsPedDeadOrDying(other_ped_attacked, 1) then
				Notification("Pust!") -- Release Bite
				TriggerEvent("K9:Attack")
			end
		end
	end
end)

--[[ MENU FUNCTIONS ]]--

RegisterNetEvent("K9:OpenMenu")
AddEventHandler("K9:OpenMenu", function(data)
	if not data.isRestricted then
		EnableK9Menu()
	else
		if CheckPedRestriction(GetPlayerPed(PlayerId()), data.PedList) == true then
			EnableK9Menu()
		else
			Notification("You are not allowed to use the K9 menu.")
		end
	end
end)

function EnableK9Menu()
	SendNUIMessage({
		type = "enable_k9_menu"
	})
	SetNuiFocus(true, true)
end

function DisableK9Menu()
	SetNuiFocus(false, false)
end

RegisterNUICallback("triggerk9animation", function(data)
	TriggerEvent("K9:Animations", data.anim)
end)

RegisterNUICallback("triggertogglek9", function(data)
	TriggerServerEvent('K9:SendSpawnSettings')
end)

RegisterNUICallback("triggervehicletoggle", function(data)
	TriggerServerEvent("K9:SendVehicleSettings")
end)

RegisterNUICallback("triggerk9search", function(data)
	GetClosestVehicleDoor()
	TriggerServerEvent("K9:SendSearchSettings")
end)

RegisterNUICallback("recievek9name", function(data)
	dog_name = data.name
end)

RegisterNUICallback("disablek9menu", function(data)
	DisableK9Menu()
end)

--]]

--[[ EXTRA FUNCTIONS ]]--
-- Converted to check tables from argument
function CheckVehicleRestriction(vehicle, VehicleList)
	for i = 1, #VehicleList do
		if GetHashKey(VehicleList[i]) == GetEntityModel(vehicle) then
			return true
		end
	end
	return false
end

-- Converted to check tables from argument
function CheckPedRestriction(ped, PedList)
	for i = 1, #PedList do
		print(tostring(GetHashKey(PedList[i])))
		if GetHashKey(PedList[i]) == GetEntityModel(ped) then
			return true
		end
	end
	return false
end

function GetClosestVehicleDoor()
	local plyCoords = GetEntityCoords(GetPlayerPed(PlayerId(), false))
	local vehicle = GetClosestVehicle(plyCoords.x, plyCoords.y, plyCoords.z, 5.0, 0, 70)

	local frontleft = GetWorldPositionOfEntityBone(vehicle, GetEntityBoneIndexByName(vehicle, "door_dside_f"))
	local frontright = GetWorldPositionOfEntityBone(vehicle, GetEntityBoneIndexByName(vehicle, "door_pside_f"))
	local backleft = GetWorldPositionOfEntityBone(vehicle, GetEntityBoneIndexByName(vehicle, "door_dside_r"))
	local backright = GetWorldPositionOfEntityBone(vehicle, GetEntityBoneIndexByName(vehicle, "door_pside_r"))

	local fldistance = GetDistanceBetweenCoords(frontleft['x'], frontleft['y'], frontleft['z'], plyCoords.x, plyCoords.y, plyCoords.z, 1)
	local frdistance = GetDistanceBetweenCoords(frontright['x'], frontright['y'], frontright['z'], plyCoords.x, plyCoords.y, plyCoords.z, 1)
	local bldistance = GetDistanceBetweenCoords(backleft['x'], backleft['y'], backleft['z'], plyCoords.x, plyCoords.y, plyCoords.z, 1)
	local brdistance = GetDistanceBetweenCoords(backright['x'], backright['y'], backright['z'], plyCoords.x, plyCoords.y, plyCoords.z, 1)

	if vehicle ~= 0 then
		closest_vehicle = vehicle
		if (fldistance < frdistance and fldistance < bldistance and fldistance < brdistance) then
			-- Front Left
			closest_door_pos = frontleft
			closest_door_name = "Front Left Door"
		elseif (frdistance < fldistance and frdistance < bldistance and frdistance < brdistance) then
			-- Front Right
			closest_door_pos = frontright
			closest_door_name = "Front Right Door"
		elseif (bldistance < fldistance and bldistance < frdistance and bldistance < brdistance) then
			-- Back Left
			closest_door_pos = backleft
			closest_door_name = "Back Left Door"
		elseif(brdistance < fldistance and brdistance < frdistance and brdistance < bldistance) then
			-- Back Right
			closest_door_pos = backright
			closest_door_name = "Back Right Door"
		end
	else
		closest_door_name = "Can't Search"
	end
end

function Notification(message)
	SetNotificationTextEntry("STRING")
	AddTextComponentString(message)
	DrawNotification(0, 1)
end
--]]