--[[
vRP Los Santos Customs V1.2
Credits - MythicalBro and マーモット#2533 for the vRP version and some bug fixes
]]



local tbl = {
	[1] = {locked = false, player = nil},
	[2] = {locked = false, player = nil},
	[3] = {locked = false, player = nil},
	[4] = {locked = false, player = nil},
	[5] = {locked = false, player = nil},
	[6] = {locked = false, player = nil},
}

local lsc_wheel_lists = {"frontwheel", "backwheel", "sportwheels", "suvwheels", "offroadwheels", "tunerwheels", "highendwheels", "lowriderwheels", "musclewheels"}
local lsc_color_categories = {"chrome", "classic", "matte", "metallic", "metal", "chrome2", "classic2", "matte2", "metallic2", "metal2", "wheelcolor", "trim"}

local function nearGarage(source, index)
	local garage = type(LSC_Config) == "table" and type(LSC_Config.garages) == "table" and LSC_Config.garages[index] or nil
	local pos = garage and garage.inside
	if pos == nil then
		return false
	end
	local coords = vRP.getPlayerCoords(source)
	if coords == nil then
		return true
	end
	local dx, dy, dz = coords.x - pos.x, coords.y - pos.y, coords.z - pos.z
	return math.sqrt(dx*dx + dy*dy + dz*dz) <= 50.0
end

local function inGarage(source)
	for i, g in pairs(tbl) do
		if g.locked and g.player == source then
			return nearGarage(source, i)
		end
	end
	return false
end

local function sameColour(a, b)
	return type(a) == "table" and type(b) == "table" and a[1] == b[1] and a[2] == b[2] and a[3] == b[3]
end

local function lowestPrice(current, value)
	value = tonumber(value) or 0
	if current == nil or value < current then
		return value
	end
	return current
end

local function minimumPrice(button)
	local prices = type(LSC_Config) == "table" and LSC_Config.prices or nil
	if type(prices) ~= "table" then
		return nil
	end
	local best = nil
	if button.name == "Repair vehicle" then
		return 250
	end
	if button.modtype ~= nil then
		local modtype, mod = tonumber(button.modtype), tonumber(button.mod)
		if mod == nil then
			return nil
		end
		if (modtype == 23 or modtype == 24) and button.wtype ~= nil then
			for _, list in ipairs(lsc_wheel_lists) do
				for _, entry in ipairs(prices[list] or {}) do
					if entry.wtype == button.wtype and entry.mod == mod then
						best = lowestPrice(best, entry.price)
					end
				end
			end
			return best
		end
		if mod < 0 then
			return 0
		end
		local modcfg = type(prices.mods) == "table" and prices.mods[modtype] or nil
		if type(modcfg) ~= "table" then
			return nil
		end
		if modcfg.startprice then
			return tonumber(modcfg.startprice)
		end
		for _, entry in ipairs(modcfg) do
			if entry.mod == mod then
				best = lowestPrice(best, entry.price)
			end
		end
		return best
	end
	if button.colorindex ~= nil then
		local known = false
		for _, key in ipairs(lsc_color_categories) do
			local category = prices[key]
			if type(category) == "table" and type(category.colors) == "table" then
				best = lowestPrice(best, category.price)
				for _, colour in ipairs(category.colors) do
					if colour.colorindex == button.colorindex then
						known = true
						break
					end
				end
			end
		end
		return known and best or nil
	end
	if button.tint ~= nil then
		if button.tint == false then
			return 0
		end
		for _, entry in ipairs(prices.windowtint or {}) do
			if entry.tint == button.tint then
				best = lowestPrice(best, entry.price)
			end
		end
		return best
	end
	if button.plateindex ~= nil then
		for _, entry in ipairs(prices.plates or {}) do
			if entry.plateindex == button.plateindex then
				best = lowestPrice(best, entry.price)
			end
		end
		return best
	end
	if button.xenon ~= nil then
		if button.xenon == -1 then
			return 0
		end
		for _, entry in ipairs(prices.xenoncolor or {}) do
			if entry.xenon == button.xenon then
				best = lowestPrice(best, entry.price)
			end
		end
		return best
	end
	if button.neon ~= nil then
		for _, entry in ipairs(prices.neoncolor or {}) do
			if sameColour(entry.neon, button.neon) then
				best = lowestPrice(best, entry.price)
			end
		end
		return best
	end
	if button.smokecolor ~= nil then
		for _, entry in ipairs(prices.wheelaccessories or {}) do
			if sameColour(entry.smokecolor, button.smokecolor) then
				best = lowestPrice(best, entry.price)
			end
		end
		return best
	end
	if button.name == "None" then
		return 0
	end
	for _, key in ipairs({"wheelaccessories", "neonlayout"}) do
		for _, entry in ipairs(prices[key] or {}) do
			if entry.smokecolor == nil and entry.name == button.name then
				best = lowestPrice(best, entry.price)
			end
		end
	end
	return best
end

RegisterServerEvent('lockGarage')
AddEventHandler('lockGarage', function(b,garage)
	local source = source
	local g = tbl[tonumber(garage)]
	if not g then
		return
	end
	if b then
		if (g.locked and g.player ~= source) or not nearGarage(source, tonumber(garage)) then
			vRPclient.notify(source, {"~r~This garage is already in use, please try again."})
			return
		end
		for i,other in pairs(tbl) do
			if other ~= g and other.player == source then
				other.locked = false
				other.player = nil
			end
		end
		g.locked = true
		g.player = source
	else
		if g.player ~= source then
			return
		end
		g.locked = false
		g.player = nil
	end
	TriggerClientEvent('lockGarage',-1,tbl)
end)

RegisterServerEvent('getGarageInfo')
AddEventHandler('getGarageInfo', function()
	TriggerClientEvent('lockGarage',-1,tbl)
end)

AddEventHandler('playerDropped', function()
	for i,g in pairs(tbl) do
		if g.player then
			if source == g.player then
				g.locked = false
				g.player = nil
				TriggerClientEvent('lockGarage',-1,tbl)
			end
		end
	end
end)

RegisterServerEvent("LSC:buttonSelected")
AddEventHandler("LSC:buttonSelected", function(name, button)
	local source = source
	local user_id = vRP.getUserId(source)
	if user_id and type(button) == "table" and inGarage(source) then
		local price = tonumber(button.price or 0)
		local minimum = minimumPrice(button)
		if price == nil or price ~= price or minimum == nil or price < minimum then
			return
		end
		TriggerClientEvent("LSC:buttonSelected", source, name, button, vRP.tryFullPayment(user_id, price))
	end
end)

RegisterServerEvent("LSC:finished")
AddEventHandler("LSC:finished", function(veh)
	local source = source
	local user_id = vRP.getUserId(source)
	if user_id and type(veh) == "table" and type(veh.model) == "string" and inGarage(source) then
		MySQL.execute("vRPls/update_vehicle_modifications", {user_id = user_id, vehicle = veh.model, modifications = json.encode({color = veh.color, extraColor = veh.extracolor, neon = veh.neon, neonColor = veh.neoncolor, xenonColor = veh.xenoncolor, smokeColor = veh.smokecolor, wheelType = veh.wheeltype, bulletProofTyres = veh.bulletProofTyres, windowTint = veh.windowtint, plateIndex = veh.plateindex, mods = veh.mods})})
	end
end)

RegisterServerEvent("LSC:applyModifications")
AddEventHandler("LSC:applyModifications", function (model, vehicle)
	local source = source
	local user_id = vRP.getUserId(source)
	if model and vehicle and user_id then
		local rows = MySQL.query("vRPls/get_vehicle_modifications", {user_id = user_id, vehicle = model}, function(rows, affected) 
			if rows ~= nil then 
				if #rows > 0 then
					local modifications = json.decode(rows[1].modifications)
					if modifications then
						TriggerClientEvent("LSC:applyModifications", source, vehicle, modifications)
					end
				else
					print("#rows is 0")
				end
			else
				print("rows is nil. line 91")
			end
		end)
	end
end)
