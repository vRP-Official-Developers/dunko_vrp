local Tunnel = module("vrp", "lib/Tunnel")
local Proxy = module("vrp", "lib/Proxy")
 
vRP = Proxy.getInterface("vRP")
vRPclient = Tunnel.getInterface("vRP","vRP_truckerJob")

RegisterServerEvent('truckerJob:success') -- calls the event from client file
AddEventHandler('truckerJob:success', function(amount) -- handles the event
    local user_id = vRP.getUserId({source})
	local player = vRP.getUserSource({user_id})
    vRP.giveMoney({user_id,amount})
    vRPclient.notify(player,{"You've been paid ~g~"..amount.."."})
end)