-- Created by TheStonedTurtle & Modified by Dunko


-- This sets the direction of the wind etc
function updateWind(toggle,heading)
	if(toggle) then
		SetWind(1.0)
		SetWindSpeed(11.99);
		SetWindDirection(heading)
	else
		SetWind(0.0)
		SetWindSpeed(0.0);
	end
end

-- This changes the weather type
function changeWeatherType(type)
	ClearWeatherTypePersist()
	SetWeatherTypeOverTime(type, 60.00)
end

-- This will sync the weather for those joining the server
AddEventHandler('onClientMapStart', function()	
	TriggerServerEvent('smartweather:syncWeather')
end)

-- This syncs the weather with the server itself
RegisterNetEvent('smartweather:updateWeather')
AddEventHandler('smartweather:updateWeather', function(data)
	changeWeatherType(data["weatherString"])
	updateWind(data["windEnabled"],data["windHeading"])
end)