local Tunnel = module("vrp", "lib/Tunnel")
local Proxy = module("vrp", "lib/Proxy")

vRP = Proxy.getInterface("vRP")
vRPclient = Tunnel.getInterface("vRP","vRP_ubermission")


local price = 500

RegisterServerEvent("dropOff")
AddEventHandler("dropOff", function(vehPrice)
    local source = source
    local player = vRP.getUserSource({user_id})
    local user_id = vRP.getUserId({source})
        vRP.giveMoney({user_id,price})
        TriggerClientEvent('chatMessage', source, "", {0, 200, 60}, "You received: ^2$" .. price)
        CancelEvent()
end)
