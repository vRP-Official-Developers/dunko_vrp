	Citizen.InvokeNative(GetHashKey("ADD_TEXT_ENTRY"), key, value)
end

Citizen.CreateThread(function()
	-- Police Bike
	AddTextEntry('0xFDEFAEC3', 'policeb')
