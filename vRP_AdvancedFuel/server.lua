local Tunnel = module("vrp", "lib/Tunnel")
local Proxy = module("vrp", "lib/Proxy")

vRP = Proxy.getInterface("vRP")
vRPclient = Tunnel.getInterface("vRP","vRP_fuel")

local players = {}
local serverEssenceArray = {}
local StationsPrice = {}

RegisterServerEvent("essence:addPlayer")
AddEventHandler("essence:addPlayer", function()
	local _source = source
	TriggerClientEvent("essence:sendPrice", source, StationsPrice)
	table.insert(players,_source)
end)

AddEventHandler("playerDropped", function(reason)
	local _source = source
	local newPlayers = {}
	
	for _,k in pairs(players) do
		if(k~=_source) then
			table.insert(newPlayers, k)
		end
	end

	players = {}
	players = newPlayers
end)



RegisterServerEvent("essence:playerSpawned")
AddEventHandler("essence:playerSpawned", function()
	local _source = source
	SetTimeout(2000, function()
		TriggerClientEvent("essence:sendPrice", _source, StationsPrice)
		TriggerClientEvent("essence:sendEssence", _source, serverEssenceArray)
	end)
end)


RegisterServerEvent("essence:setToAllPlayerEscense")
AddEventHandler("essence:setToAllPlayerEscense", function(essence, vplate, vmodel)
	local _source = source
	local bool, ind = searchByModelAndPlate(vplate, vmodel)
	if(bool and ind ~= nil) then
		serverEssenceArray[ind].es = essence
	else
		if(vplate ~=nil and vmodel~=nil and essence ~=nil) then
			table.insert(serverEssenceArray,{plate=vplate,model=vmodel,es=essence})
		end
	end

	TriggerClientEvent('essence:syncWithAllPlayers', -1, essence, vplate, vmodel)
end)




RegisterServerEvent("essence:buy")
AddEventHandler("essence:buy", function(amount, index,e)
	local _source = source

	local price = StationsPrice[index]

	if(e) then
		price = index
	end

	local toPay = round(amount*price,2)
	local user_id = vRP.getUserId({_source})
	if(vRP.tryPayment({user_id,toPay})) then
		TriggerClientEvent("essence:hasBuying", _source, amount)
	else
		TriggerClientEvent("showErrorNotif", _source, "You don't have enought money.")
	end
	
end)


RegisterServerEvent("essence:requestPrice")
AddEventHandler("essence:requestPrice",function()
	TriggerClientEvent("essence:sendPrice", source, StationsPrice)
end)


RegisterServerEvent("vehicule:getFuel")
AddEventHandler("vehicule:getFuel", function(plate,model)
	local _source = source
	local bool, ind = searchByModelAndPlate(plate, model)

	if(bool) then
		TriggerClientEvent("vehicule:sendFuel", _source, 1, serverEssenceArray[ind].es)
	else
		TriggerClientEvent("vehicule:sendFuel", _source, 0, 0)
	end
end)



RegisterServerEvent("advancedFuel:setEssence_s")
AddEventHandler("advancedFuel:setEssence_s", function(percent, vplate, vmodel)
	local bool, ind = searchByModelAndPlate(vplate, vmodel)

	local percentToEs = (percent/100)*0.142

	if(bool) then
		serverEssenceArray[ind].es = percentToEs
	else
		table.insert(serverEssenceArray,{plate=vplate,model=vmodel,es=percentToEs})
	end
end)

RegisterServerEvent("essence:buyCan")
AddEventHandler("essence:buyCan", function()
	local _source = source

	local toPay = petrolCanPrice
	local user_id = vRP.getUserId({_source})
	if(vRP.tryPayment({user_id,toPay})) then
		TriggerClientEvent("essence:buyCan", _source)
	else
		TriggerClientEvent("showErrorNotif", _source, "You don't have enought money.")
	end
end)



function round(num, dec)
  local mult = 10^(dec or 0)
  return math.floor(num * mult + 0.5) / mult
end


function renderPrice()
    for i=0,34 do
        if(randomPrice) then
            StationsPrice[i] = round(math.random(),2) + math.random(2,3) + .009
        else
        	StationsPrice[i] = price
        end
    end

    print("launched")
end


renderPrice()

function searchByModelAndPlate(plate, model)

	for i,k in pairs(serverEssenceArray) do
		if(k.plate == plate and k.model == model) then
			return true, i
		end
	end

	return false, -1
end
