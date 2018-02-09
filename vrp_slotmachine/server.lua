--Settings--
local Tunnel = module("vrp", "lib/Tunnel")
local Proxy = module("vrp", "lib/Proxy")

vRP = Proxy.getInterface("vRP")
vRPclient = Tunnel.getInterface("vRP","vRP_slots")


RegisterServerEvent('vrp_slotmachine:server:1')
AddEventHandler('vrp_slotmachine:server:1', function(amount,a,b,c)
	local source = source
	local user_id = vRP.getUserId({source})
	amount = tonumber(amount)
		if (vRP.getMoney({user_id}) >= tonumber(amount)) then
		vRP.tryPayment({user_id,amount}) -- this gives the user the money
		-- if (vRP.getInventoryItemAmount({user_id,"dirty_money"}) >= tonumber(amount)) then
        	-- vRP.tryGetInventoryItem({user_id,"dirty_money",amount})
		TriggerClientEvent("vrp_slotmachine:1",source,tonumber(amount),tostring(a),tostring(b),tostring(c))
	else
		TriggerClientEvent('chatMessage', source, "", {0, 0, 200}, "^1You don't have enough money") -- this is the message u get when u got no money
	end
end)

RegisterServerEvent('vrp_slotmachine:server:2')
AddEventHandler('vrp_slotmachine:server:2', function(amount)
	local source = source
	local user_id = vRP.getUserId({source})
	    vRP.giveMoney({user_id,amount})
	    TriggerClientEvent('chatMessage', source, "", {0, 200, 60}, "You won:  $" .. amount .. ".") -- this is what u get if u win, u already get another one but this shows amount
	end)
