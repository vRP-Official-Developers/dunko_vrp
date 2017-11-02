-- Created by TheStonedTurtle & modified by Dunko

secondsToWait = 60000-- Seconds to wait between changing weather. 60 seconds to fully switch types
currentWeatherString = "CLEAR"   -- Starting Weather Type.
local SmartWeatherEnabled = true -- Should this script be enabled?
local adminOnlyPlugin = true     -- Should chat commands be limited to the `admins` list?


-- Removed Neutral from possible weather options, had issue with it sometimes turning the sky green.
-- Removed XMAS from possible weather option as it blankets entire map with snow.
weatherTree = {
	["EXTRASUNNY"] = {"CLEAR","SMOG"},
	["SMOG"] = {"FOGGY","CLEAR","CLEARING","OVERCAST","CLOUDS","EXTRASUNNY"},
	["CLEAR"] = {"CLOUDS","EXTRASUNNY","CLEARING","SMOG","FOGGY","OVERCAST"},
	["CLOUDS"] = {"CLEAR","SMOG","FOGGY","CLEARING","OVERCAST","SNOW","SNOWLIGHT"},
	["FOGGY"] = {"CLEAR","CLOUDS","SMOG","OVERCAST"},
	["OVERCAST"] = {"CLEAR","CLOUDS","SMOG","FOGGY","RAIN","CLEARING"},
	["RAIN"] = {"THUNDER","CLEARING","SNOW","SNOWLIGHT","OVERCAST"},
	["THUNDER"] = {"RAIN","CLEARING","BLIZZARD"},
	["CLEARING"] = {"CLEAR","CLOUDS","OVERCAST","FOGGY","SMOG","RAIN","SNOWLIGHT"},
	["SNOW"] = {"BLIZZARD","RAIN","SNOWLIGHT"},
	["BLIZZARD"] = {"SNOW","SNOWLIGHT","THUNDER"},
	["SNOWLIGHT"] = {"SNOW","RAIN","CLEARING"},
}

windWeathers = {
	["OVERCAST"] = false,
	["RAIN"] = false,
	["THUNDER"] = false,
	["BLIZZARD"] = false,
	["XMAS"] = false,
	["SNOW"] = false,
	["CLOUDS"] = false
}
local resetFlag = false

function getTableLength(T)
	local count = 0
	for _ in pairs(T) do 
		count = count + 1
	end
	return count
end

function getTableKeys(T)
	local keys = {}
	for k,v in pairs(T) do
		table.insert(keys,k)
	end
	return keys
end

function stringsplit(inputstr, sep)
    if sep == nil then
            sep = "%s"
    end
    local t={}
    for str in string.gmatch(inputstr, "([^"..sep.."]+)") do
            table.insert(t,str)
    end
    return t
end

function isAdmin(identifier)
	local adminList = {}
	for _,v in pairs(admins) do
		adminList[v] = true
	end
	identifier = string.lower(identifier)
	identifier2 = string.upper(identifier)

	if(adminList[identifier] or adminList[identifier2])then
		return true
	else
		return false
	end
end

function getIdentifier( source, identifier )
    local ids = GetPlayerIdentifiers( source )

    for k, v in pairs( ids ) do 
        if(string.find(v, identifier..":"))then
            return v
        end
    end 

    return nil
end

currentWeatherData = {
	["weatherString"] = currentWeatherString,
	["windEnabled"] = false,
	["windHeading"] = 0
}

function updateWeatherString()
	local newWeatherString
	local windEnabled = false
	local windHeading = 0
	-- Lua random requires an updated randomseed to ensure randomnees between same range values.
	math.randomseed(GetGameTimer())

	local count = getTableLength(weatherTree)
	local tableKeys = getTableKeys(weatherTree)

	if(currentWeatherData["weatherString"] == nil)then
		newWeatherString = tableKeys[math.random(1,count)]
	else
		local currentOptions = weatherTree[currentWeatherData["weatherString"]]
		newWeatherString = currentOptions[math.random(1,getTableLength(currentOptions))]
	end

	-- 50/50 Chance to enabled wind at a random heading for the specified weathers.
	if(windWeathers[newWeatherString] and (math.random(0,1) == 1))then
		windEnabled = true
		windHeading = math.random(0,360)
	end

	currentWeatherData = {
		["weatherString"] = newWeatherString,
		["windEnabled"] = windEnabled,
		["windHeading"] = windHeading
	}

	print("Updating Weather to "..newWeatherString.." for all players.")
	TriggerClientEvent("smartweather:updateWeather", -1, currentWeatherData)
end

-- Sync Weather once player joins.
RegisterServerEvent("smartweather:syncWeather")
AddEventHandler("smartweather:syncWeather",function()
	print("Syncing weather for: "..GetPlayerName(source))
	TriggerClientEvent("smartweather:updateWeather", source, currentWeatherData)
end)

-- Toggle if weather should auto change.
RegisterServerEvent("smartweather:toggleWeather")
AddEventHandler("smartweather:toggleWeather",function(from)
	local by = GetPlayerName(from) or ""
	local text = "^1disabled^7"

	SmartWeatherEnabled = not SmartWeatherEnabled
	if(SmartWeatherEnabled)then
		text = "^2enabled^7"
	end

	local message = "SmartWeather has been "..text.." by ^5"..by
	TriggerClientEvent("chatMessage", -1, "SmartWeather",{0,0,0},message)
end)

function handleAdminCheck(from)
	if( adminOnlyPlugin and not(isAdmin(getIdentifier(from, "steam"))) )then
		TriggerClientEvent('chatMessage', from, "SmartWeather", {200,0,0} , "You must be an admin to use this command.")
		return false
	end
	return true
end

-- Example of how to toggle weather. Added basic chat command.
AddEventHandler('chatMessage', function(from,name,message)
	if(string.sub(message,1,1) == "/") then

		local args = stringsplit(message)
		local cmd = args[1]

		if(cmd == "/toggleweather")then
			CancelEvent()
			if( not handleAdminCheck(from) )then
				return
			end

			TriggerEvent("smartweather:toggleWeather", from)
		end

		if(cmd == "/setweather")then
			CancelEvent()
			if( not handleAdminCheck(from) )then
				return
			end

			local wtype = string.upper(tostring(args[2]))
			if(wtype == nil)then
				TriggerClientEvent('chatMessage', from, "SmartWeather", {200,0,0} , "Usage: /setweather CLEAR")
				return
			end

			if(weatherTree[wtype] == nil)then
				TriggerClientEvent('chatMessage', from, "SmartWeather", {200,0,0} , "Invalid weather type, valid weather types below")
				TriggerClientEvent('chatMessage', from, "", {255,255,255} , table.concat(getTableKeys(weatherTree)," "))
				return
			end
			currentWeatherData["weatherString"] = wtype
			resetFlag = true
			TriggerClientEvent("smartweather:updateWeather", -1, currentWeatherData) -- Sync weather for all players
			TriggerClientEvent("chatMessage", -1, "SmartWeather", {200,0,0}, name.." has updated the weather to: "..wtype) -- Ingame
		end
	end

end)

function weatherCheck()
	for i=0,secondsToWait,1 do
		if(resetFlag)then
			resetFlag = false
			weatherCheck() -- Start the wait cycle again
			return
		else
			Wait(1000)
		end
	end

	if(SmartWeatherEnabled)then
		updateWeatherString()
	else
		print("SmartWeather is currently disabled")
	end
	
	weatherCheck() -- Start wait cycle again
end

CreateThread(function()
	weatherCheck()
end)