local Tunnel = module("vrp", "lib/Tunnel")
local Proxy = module("vrp", "lib/Proxy")

vRP = Proxy.getInterface("vRP")
vRPclient = Tunnel.getInterface("vRP","vRP_banking")
isTransfer = false


AddEventHandler("vRP:playerSpawn",function(user_id,source,last_login) 
    local bankbalance = vRP.getBankMoney({user_id})
    TriggerClientEvent('banking:updateBalance', source, bankbalance)
end)

RegisterServerEvent('playerSpawned')
AddEventHandler('playerSpawned', function()
  local user_id = vRP.getUserId({source})
  local bankbalance = vRP.getBankMoney({user_id})

  TriggerClientEvent('banking:updateBalance', source, bankbalance)
end)

-- HELPER FUNCTIONS
function bankBalance(player)
  return vRP.getBankMoney({vRP.getUserId({player})})
end

function deposit(player, amount)
  local bankbalance = bankBalance(player)
  local new_balance = bankbalance + math.abs(amount)

  local user_id = vRP.getUserId({player})
  TriggerClientEvent("banking:updateBalance", source, new_balance)
  vRP.tryDeposit({user_id,math.floor(math.abs(amount))})
end

function withdraw(player, amount)
  local bankbalance = bankBalance(player)
  local new_balance = bankbalance - math.abs(amount)

  local user_id = vRP.getUserId({player})
  TriggerClientEvent("banking:updateBalance", source, new_balance)
  vRP.tryWithdraw({user_id,math.floor(math.abs(amount))})
end

function transfer (fPlayer, tPlayer, amount)
  local bankbalance = bankBalance(fPlayer)
  local bankbalance2 = bankBalance(tPlayer)
  local new_balance = bankbalance - math.abs(amount)
  local new_balance2 = bankbalance2 + math.abs(amount)

  local user_id = vRP.getUserId({fPlayer})
  local user_id2 = vRP.getUserId({tPlayer})

  vRP.setBankMoney({user_id, new_balance})
  vRP.setBankMoney({user_id2, new_balance2})

  TriggerClientEvent("banking:updateBalance", fPlayer, new_balance)
  TriggerClientEvent("banking:updateBalance", tPlayer, new_balance2)
end

function round(num, numDecimalPlaces)
  local mult = 5^(numDecimalPlaces or 0)
  return math.floor(num * mult + 0.5) / mult
end

function splitString(str, sep)
  if sep == nil then sep = "%s" end

  local t={}
  local i=1

  for str in string.gmatch(str, "([^"..sep.."]+)") do
    t[i] = str
    i = i + 1
  end

  return t
end

AddEventHandler("chatMessage", function(s, n, m)
  local message = string.lower(m)
  local user_id = vRP.getUserId({s})
  local source = vRP.getUserSource({user_id})
  local bankbalance = vRP.getBankMoney({user_id})

  command = splitString(message)

  if command[1] == "/checkbalance" then
    TriggerClientEvent("chatMessage", s, "BANK", {0, 200, 0}, "Your current account balance: ^3$" .. bankbalance)
    TriggerClientEvent("banking:updateBalance", source, bankbalance)
    CancelEvent()
  end

  if command[1] == "/deposit" then
    local amount = tonumber(command[2])
    TriggerClientEvent('bank:deposit', s, amount)
    CancelEvent()
  end

  if command[1] == "/withdraw" then
    local amount = tonumber(command[2])
    TriggerClientEvent('bank:withdraw', s, amount)
    CancelEvent()
  end

  if command[1] == "/transfer" then
    if(command[2] ~= nil and tonumber(command[3]) > 0) then
      local fromPlayer = tonumber(s)
      local toPlayer = tonumber(command[2])
      local amount = tonumber(command[3])
      TriggerClientEvent('bank:transfer', s, fromPlayer, toPlayer, amount)
    else
      TriggerClientEvent('chatMessage', s, "BANK", {0, 200, 0}, "^1Use format /transfer [id] [amount]^0")
    end
    CancelEvent()
  end
end)

RegisterServerEvent('bank:update')
AddEventHandler('bank:update', function()
  local user_id = vRP.getUserId({source})
  local source = vRP.getUserSource({user_id})
  local bankbalance = vRP.getBankMoney({user_id})
  TriggerClientEvent("banking:updateBalance", source, bankbalance)
end)

-- Bank Deposit
RegisterServerEvent('bank:deposit')
AddEventHandler('bank:deposit', function(amount)
  if not amount then return end
    local user_id = vRP.getUserId({source})
    local source = vRP.getUserSource({user_id})
    local wallet = vRP.getMoney({user_id})
    local rounded = math.ceil(tonumber(amount))

    if(string.len(rounded) >= 9) then
      vRPclient.notify(user_id,{"~r~Input too high."})
    else
      local bankbalance = vRP.getBankMoney({user_id})
      if(rounded <= wallet) then
        TriggerClientEvent("banking:updateBalance", source, (bankbalance + rounded))
        TriggerClientEvent("banking:addBalance", source, rounded)

        deposit(source, rounded)
      else
        vRPclient.notify(user_id,{"~r~Not enough cash!"})
      end
    end
end)


RegisterServerEvent('bank:withdraw')
AddEventHandler('bank:withdraw', function(amount)
  if not amount then return end
    local user_id = vRP.getUserId({source})
    local source = vRP.getUserSource({user_id})
    local rounded = round(tonumber(amount), 0)
    if(string.len(rounded) >= 9) then
      vRPclient.notify(user_id,{"~r~Input too high."})
    else
      local bankbalance = vRP.getBankMoney({user_id})
      if(tonumber(rounded) <= tonumber(bankbalance)) then
        TriggerClientEvent("banking:updateBalance", source, (vRP.getBankMoney({user_id}) - rounded))
        TriggerClientEvent("banking:removeBalance", source, rounded)

        withdraw(source, rounded)
      else
        vRPclient.notify(user_id, {"~r~Not enough money in account!"})
      end
    end
end)

RegisterServerEvent('bank:transfer')
AddEventHandler('bank:transfer', function(fromPlayer, toPlayer, amount)
  local user_id = vRP.getUserId({source})
  local fPlayer = vRP.getUserSource({user_id})

  if tonumber(fPlayer) == tonumber(toPlayer) then
    TriggerClientEvent('chatMessage', fPlayer, "", {0, 255, 0}, "^1Cannot transfer to self")
    CancelEvent()
  else
    local rounded = round(tonumber(amount), 0)
    if(string.len(rounded) >= 9) then
      TriggerClientEvent('chatMessage', fPlayer, "", {0, 255, 0}, "^1Input too high!")
      CancelEvent()
    else
      local bankbalance = vRP.getBankMoney({user_id})
      if(tonumber(rounded) <= tonumber(bankbalance)) then
        TriggerClientEvent("banking:updateBalance", fPlayer, (bankbalance - rounded))
        TriggerClientEvent("banking:removeBalance", fPlayer, rounded)
        local user_id2 = vRP.getUserId({toPlayer})
        local bankbalance2 = vRP.getBankMoney({user_id2})
        
        transfer(fPlayer, toPlayer, rounded)
        
        TriggerClientEvent('chatMessage', fPlayer, "", {0, 255, 0}, "^0Transferred: ^1$"..math.floor(rounded))
        TriggerClientEvent('chatMessage', fPlayer, "", {0, 255, 0}, "^0New Balance: ^4$" .. math.floor((bankbalance - rounded)))
        
        TriggerClientEvent("banking:updateBalance", toPlayer, (bankbalance2 + rounded))
        TriggerClientEvent("banking:addBalance", toPlayer, rounded)
        
        TriggerClientEvent('chatMessage', toPlayer, "", {0, 255, 0}, "^0Received: ^2$"..math.floor(rounded))
        TriggerClientEvent('chatMessage', toPlayer, "", {0, 255, 0}, "^0New Balance: ^4$" .. math.floor((bankbalance2 + rounded)))
        CancelEvent()
      else
        TriggerClientEvent('chatMessage', fPlayer, "", {0, 255, 0}, "^1Not enough money in account!")
      end
    end    
  end
end)
