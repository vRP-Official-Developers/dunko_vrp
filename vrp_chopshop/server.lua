local Tunnel = module("vrp", "lib/Tunnel")
local Proxy = module("vrp", "lib/Proxy")

vRP = Proxy.getInterface("vRP")
vRPclient = Tunnel.getInterface("vRP","vRP_chopshop")


local prices = {
{id = 0, price = 3600}, --compacts
{id = 1, price = 4000}, --sedans
{id = 2, price = 5200}, --SUV's
{id = 3, price = 6400}, --coupes
{id = 4, price = 5000}, --muscle
{id = 5, price = 6500}, --sport classic
{id = 6, price = 7200}, --sport
{id = 7, price = 11000}, --super
{id = 8, price = 2200}, --motorcycle
{id = 9, price = 3800}, --offroad
{id = 10, price = 4400}, --industrial
{id = 11, price = 3400}, --utility
{id = 12, price = 3400}, --vans
{id = 13, price = 400}, --bicycles
{id = 14, price = 2000}, --boats
{id = 15, price = 8200}, --helicopter
{id = 16, price = 9000}, --plane
{id = 17, price = 2900}, --service
{id = 18, price = 5000}, --emergency
{id = 19, price = 6200}, --military
{id = 20, price = 3400} --commercial
}

RegisterServerEvent("getVehPrice")
AddEventHandler("getVehPrice", function(class)
	for k, price in pairs(prices) do
		if class == price.id then
			vehPrice = price.price
			TriggerClientEvent("setVehPrice", -1, vehPrice)
		end
	end
end)


RegisterServerEvent("sellVehicle")
AddEventHandler("sellVehicle", function(vehPrice)
    local source = source
    local player = vRP.getUserSource({user_id})
    local user_id = vRP.getUserId({source})
        vRP.giveInventoryItem({user_id,"dirty_money",vehPrice})
        TriggerClientEvent('chatMessage', source, "", {0, 200, 60}, "You received: ^2$" .. vehPrice)
		TriggerClientEvent('chatMessage', source, "", {0, 200, 60}, "I'll take more cars off you in 2 minutes")
        CancelEvent()
end)
