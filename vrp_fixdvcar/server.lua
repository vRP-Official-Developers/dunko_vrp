local Tunnel = module("vrp", "lib/Tunnel")
local Proxy = module("vrp", "lib/Proxy")

vRP = Proxy.getInterface("vRP")
vRPclient = Tunnel.getInterface("vRP","vRP_fixcar")

groups = {"cop", "ems", "admin", "superadmin"}

function vRP.checkGroup(source)
	local user_id = vRP.getUserId({source})

	for k,v in ipairs(groups) do
		if vRP.hasGroup({user_id,v}) then
			return true
		end
	end
	return false
end

AddEventHandler('chatMessage', function(source, name, msg)
	if msg == "/fix" or msg == "FIX" then
		local hasPerm = vRP.checkGroup(source)
		if hasPerm then
			CancelEvent()
			TriggerClientEvent("murtaza:fix", source)
		else 
			CancelEvent()
			vRPclient.notify(source,{"This command is restricted!"})
		end
	elseif msg == "/dv" or msg == "/DV" then
		local hasPerm = vRP.checkGroup(source)
		if hasPerm then
			CancelEvent()
			TriggerClientEvent("wk:deleteVehicle", source)
		else 
			CancelEvent()
			vRPclient.notify(source,{"This command is restricted!"})
		end
	end
end)