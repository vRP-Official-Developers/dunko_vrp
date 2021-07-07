-- Hot Key TP to WP
function vRP.TpToWaypoint()
	local user_id = vRP.getUserId({source})
	local player = vRP.getUserSource({user_id})
	local tptowaypoint = vRP.getUsersByPermission({"player.tptowaypoint"})
	Citizen.Trace("Send Nudes")
		if vRP.hasPermission({user_id,"player.tptowaypoint"}) then
		Citizen.Trace("Send Nudes2")
		TriggerClientEvent("TpToWaypoint", player)
		Citizen.Trace("Send Nudes3")
	end
end

function tvRP.TpToWaypoint()
  vRP.TpToWaypoint(source)
end