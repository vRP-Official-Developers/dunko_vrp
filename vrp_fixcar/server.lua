local Tunnel = module("vrp", "lib/Tunnel")
local Proxy = module("vrp", "lib/Proxy")

vRP = Proxy.getInterface("vRP")
vRPclient = Tunnel.getInterface("vRP","vRP_fixcar")

AddEventHandler('chatMessage', function(source, name, msg)
	if msg == "/fix" then
	  local user_id = vRP.getUserId({source})
	  local player = vRP.getUserSource({user_id})
	  if vRP.hasGroup({user_id,"cop"}) then
		CancelEvent();
		TriggerClientEvent('murtaza:fix', source);
	  elseif vRP.hasGroup({user_id,"Chief of Police"}) then
		CancelEvent();
		TriggerClientEvent('murtaza:fix', source);	  
	  elseif vRP.hasGroup({user_id,"ems"}) then
		CancelEvent();
		TriggerClientEvent('murtaza:fix', source);	  
	  end
	end
end)