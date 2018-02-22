local Proxy = module("vrp", "lib/Proxy")

function calctaxes(pay)--simple tax calculation using function calctaxes with argument of pay
local tax = 25--percentage taxes
local payPast = pay/100*tax--the calculation for how much is taxes
return math.floor(payPast)--return the ammount taxes will take, floored to avoid decimals.
end

RegisterServerEvent('paycheck:salary')
AddEventHandler('paycheck:salary', function()
  	local user_id = vRP.getUserId(source)
	if vRP.hasPermission(user_id,"police.paycheck") then
		local pay = 3000--payment for the job
		local payTax = calctaxes(pay)--calculates the tax.
		vRP.giveMoney(user_id,pay-payTax)--gives the player their pay-taxes
		vRPclient.notify(source,{"Payday: $"..pay})--tells the player how much they earn.
		vRPclient.notify(source,{"Taxes: $"..payTax})--tells player how much was taken by taxes.
	end		
	-- EMS Paychecks	
	if vRP.hasPermission(user_id,"emsChief.paycheck") then
		local pay = 3500
		local payTax = calctaxes(pay)
		vRP.giveMoney(user_id,pay-payTax)
		vRPclient.notify(source,{"Payday: $"..pay})
		vRPclient.notify(source,{"Taxes: $"..payTax})
	end
	if vRP.hasPermission(user_id,"emsLieutenant.paycheck") then
		local pay = 3000
		local payTax = calctaxes(pay)
		vRP.giveMoney(user_id,pay-payTax)
		vRPclient.notify(source,{"Payday: $"..pay})
		vRPclient.notify(source,{"Taxes: $"..payTax})
	end
	if vRP.hasPermission(user_id,"emsMedic.paycheck") then
		local pay = 3000
		local payTax = calctaxes(pay)
		vRP.giveMoney(user_id,pay-payTax)
		vRPclient.notify(source,{"Payday: $"..pay})
		vRPclient.notify(source,{"Taxes: $"..payTax})
	end
	if vRP.hasPermission(user_id,"emsSearchRescue.paycheck") then
		local pay = 3500
		local payTax = calctaxes(pay)
		vRP.giveMoney(user_id,pay-payTax)
		vRPclient.notify(source,{"Payday: $"..pay})
		vRPclient.notify(source,{"Taxes: $"..payTax})
	end
	-- end EMS Paychecks
	if vRP.hasPermission(user_id,"repair.paycheck") then
		local pay = 1000
		local payTax = calctaxes(pay)
		vRP.giveMoney(user_id,pay-payTax)
		vRPclient.notify(source,{"Payday: $"..pay})
		vRPclient.notify(source,{"Taxes: $"..payTax})
	end
	if vRP.hasPermission(user_id,"Chief.paycheck") then
		local pay = 5000
		local payTax = calctaxes(pay)
		vRP.giveMoney(user_id,pay-payTax)
		vRPclient.notify(source,{"Payday: $"..pay})
		vRPclient.notify(source,{"Taxes: $"..payTax})
	end
	if vRP.hasPermission(user_id,"Commander.paycheck") then
		local pay = 4000
		local payTax = calctaxes(pay)
		vRP.giveMoney(user_id,pay-payTax)
		vRPclient.notify(source,{"Payday: $"..pay})
		vRPclient.notify(source,{"Taxes: $"..payTax})
	end
	if vRP.hasPermission(user_id,"Captain.paycheck") then
		local pay = 4500
		local payTax = calctaxes(pay)
		vRP.giveMoney(user_id,pay-payTax)
		vRPclient.notify(source,{"Payday: $"..pay})
		vRPclient.notify(source,{"Taxes: $"..payTax})
	end
	if vRP.hasPermission(user_id,"Lieutenant.paycheck") then
		local pay = 2500
		local payTax = calctaxes(pay)
		vRP.giveMoney(user_id,pay-payTax)
		vRPclient.notify(source,{"Payday: $"..pay})
		vRPclient.notify(source,{"Taxes: $"..payTax})
	end
	if vRP.hasPermission(user_id,"Detective.paycheck") then
		local pay = 2250
		local payTax = calctaxes(pay)
		vRP.giveMoney(user_id,pay-payTax)
		vRPclient.notify(source,{"Payday: $"..pay})
		vRPclient.notify(source,{"Taxes: $"..payTax})
	end
	if vRP.hasPermission(user_id,"Sergeant.paycheck") then
		local pay = 2000
		local payTax = calctaxes(pay)
		vRP.giveMoney(user_id,pay-payTax)
		vRPclient.notify(source,{"Payday: $"..pay})
		vRPclient.notify(source,{"Taxes: $"..payTax})
	end
	if vRP.hasPermission(user_id,"uber.paycheck") then
		local pay = 2000
		local payTax = calctaxes(pay)
		vRP.giveMoney(user_id,pay-payTax)
		vRPclient.notify(source,{"Payday: $"..pay})
		vRPclient.notify(source,{"Taxes: $"..payTax})
	end
	if vRP.hasPermission(user_id,"Lawyer.paycheck") then
		local pay = 4000
		local payTax = calctaxes(pay)
		vRP.giveMoney(user_id,pay-payTax)
		vRPclient.notify(source,{"Payday: $"..pay})
		vRPclient.notify(source,{"Taxes: $"..payTax})
	end
	if vRP.hasPermission(user_id,"delivery.paycheck") then
		local pay = 1000
		local payTax = calctaxes(pay)
		vRP.giveMoney(user_id,pay-payTax)
		vRPclient.notify(source,{"Payday: $"..pay})
		vRPclient.notify(source,{"Taxes: $"..payTax})
	end
	if vRP.hasPermission(user_id,"citizen.paycheck") then
		local pay = 2000
		local payTax = calctaxes(pay)
		vRP.giveMoney(user_id,pay-payTax)
		vRPclient.notify(source,{"Payday: $"..pay})
		vRPclient.notify(source,{"Taxes: $"..payTax})
	end
	if vRP.hasPermission(user_id,"SWAT.paycheck") then
		local pay = 2500
		local payTax = calctaxes(pay)
		vRP.giveMoney(user_id,pay-payTax)
		vRPclient.notify(source,{"Payday: $"..pay})
		vRPclient.notify(source,{"Taxes: $"..payTax})
	end
	if vRP.hasPermission(user_id,"sheriff.paycheck") then
		local pay = 2500
		local payTax = calctaxes(pay)
		vRP.giveMoney(user_id,pay-payTax)
		vRPclient.notify(source,{"Payday: $"..pay})
		vRPclient.notify(source,{"Taxes: $"..payTax})
	end
	if vRP.hasPermission(user_id,"Cadet.paycheck") then
		local pay = 2500
		local payTax = calctaxes(pay)
		vRP.giveMoney(user_id,pay-payTax)
		vRPclient.notify(source,{"Payday: $"..pay})
		vRPclient.notify(source,{"Taxes: $"..payTax})
	end
	if vRP.hasPermission(user_id,"trafficguard.paycheck") then
		local pay = 1500
		local payTax = calctaxes(pay)
		vRP.giveMoney(user_id,pay-payTax)
		vRPclient.notify(source,{"Payday: $"..pay})
		vRPclient.notify(source,{"Taxes: $"..payTax})
	end
	if vRP.hasPermission(user_id,"santa.paycheck") then
		local pay = 2000
		local payTax = calctaxes(pay)
		vRP.giveMoney(user_id,pay-payTax)
		vRPclient.notify(source,{"Payday: $"..pay})
		vRPclient.notify(source,{"Taxes: $"..payTax})
	end
	if vRP.hasPermission(user_id,"bankdriver.paycheck") then
		local pay = 2000
		local payTax = calctaxes(pay)
		vRP.giveMoney(user_id,pay-payTax)
		vRPclient.notify(source,{"Payday: $"..pay})
		vRPclient.notify(source,{"Taxes: $"..payTax})
	end
	if vRP.hasPermission(user_id,"pilot.paycheck") then
		local pay = 2000
		local payTax = calctaxes(pay)
		vRP.giveMoney(user_id,pay-payTax)
		vRPclient.notify(source,{"Payday: $"..pay})
		vRPclient.notify(source,{"Taxes: $"..payTax})
	end
	if vRP.hasPermission(user_id,"air.paycheck") then
		local pay = 2000
		local payTax = calctaxes(pay)
		vRP.giveMoney(user_id,pay-payTax)
		vRPclient.notify(source,{"Payday: $"..pay})
		vRPclient.notify(source,{"Taxes: $"..payTax})
	end
end)

RegisterServerEvent('paycheck:bonus')
AddEventHandler('paycheck:bonus', function()
  	local user_id = vRP.getUserId(source)
	if vRP.hasPermission(user_id,"user.paycheck") then
		local pay = 250
		vRP.giveMoney(user_id,pay)
		vRPclient.notify(source,{"Gift for play: $"..pay})
	end
	--if vRP.hasPermission(user_id,"user.paycheck") then
		--vRP.getMoney(user_id,150)
		--vRPclient.notify(source,{"Tax: R$-150"})
	--end
end)
