vRP = Proxy.getInterface("vRP")

Citizen.CreateThread(function ()
	while true do
	local user_id = vRP.getUserId(source)
		Citizen.Wait(900000) -- Every X ms you'll get paid (300000 = 5 min)
		TriggerServerEvent('paycheck:salary')
	end
end)

Citizen.CreateThread(function ()
	while true do
	local user_id = vRP.getUserId(source)
		Citizen.Wait(900000) -- Every X ms you'll get paid (300000 = 5 min)
		TriggerServerEvent('paycheck:bonus')
	end
end)

