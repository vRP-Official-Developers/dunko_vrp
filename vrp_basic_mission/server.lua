
local Tunnel = module("vrp", "lib/Tunnel")
local Proxy = module("vrp", "lib/Proxy")
local Lang = module("vrp", "lib/Lang")
local cfg = module("vrp_basic_mission", "cfg/missions")

-- load global and local languages
local glang = Lang.new(module("vrp", "cfg/lang/"..cfg.lang) or {})
local lang = Lang.new(module("vrp_basic_mission", "cfg/lang/"..cfg.lang) or {})

vRP = Proxy.getInterface("vRP")
vRPclient = Tunnel.getInterface("vRP","vRP_basic_mission")

function task_mission()
  -- REPAIR
  for k,v in pairs(cfg.repair) do -- each repair perm def
    -- add missions to users
    local users = vRP.getUsersByPermission({k})
    for l,w in pairs(users) do
      local user_id = w
      local player = vRP.getUserSource({user_id})
      if not vRP.hasMission({player}) then
        if math.random(1,v.chance+1) == 1 then -- chance check
          -- build mission
          local mdata = {}
          mdata.name = lang.repair({v.title})
          mdata.steps = {}

          -- build steps
          for i=1,v.steps do
            local step = {
              text = lang.repair({v.title}).."<br />"..lang.reward({v.reward}),
              onenter = function(player, area)
                if vRP.tryGetInventoryItem({user_id,"repairkit",1,true}) then
                  vRPclient.playAnim(player,{false,{task="WORLD_HUMAN_WELDING"},false})
                  SetTimeout(15000, function()
                    vRP.nextMissionStep({player})
                    vRPclient.stopAnim(player,{false})

                    -- last step
                    if i == v.steps then
                      vRP.giveMoney({user_id,v.reward})
                      vRPclient.notify(player,{glang.money.received({v.reward})})
                    end
                  end)
                end
              end,
              position = v.positions[math.random(1,#v.positions)]
            }

            table.insert(mdata.steps, step)
          end

          vRP.startMission({player,mdata})
        end
      end
    end
  end
   -- bankdriver
  for k,v in pairs(cfg.bankdriver) do -- each repair perm def
    -- add missions to users
    local users = vRP.getUsersByPermission({k})
    for l,w in pairs(users) do
      local user_id = w
      local player = vRP.getUserSource({user_id})
      if not vRP.hasMission({player}) then
        if math.random(1,v.chance+1) == 1 then -- chance check
          -- build mission
          local mdata = {}
          mdata.name = lang.bankdriver({v.title})
          mdata.steps = {}

          -- build steps
          for i=1,v.steps do
            local step = {
              text = lang.bankdriver({v.title}).."<br />"..lang.reward({v.reward}),
              onenter = function(player, area)
                if vRP.tryGetInventoryItem({user_id,"bank_money",500000,true}) then
                  vRPclient.playAnim(player,{false,{task="CODE_HUMAN_POLICE_INVESTIGATE"},false})
                  SetTimeout(15000, function()
                    vRP.nextMissionStep({player})
                    vRPclient.stopAnim(player,{false})

                    -- last step
                    if i == v.steps then
                      vRP.giveMoney({user_id,v.reward})
                      vRPclient.notify(player,{glang.money.received({v.reward})})
                    end
                  end)
                end
              end,
              position = v.positions[math.random(1,#v.positions)]
            }

            table.insert(mdata.steps, step)
          end

          vRP.startMission({player,mdata})
        end
      end
    end
  end
  
 -- Cargo Pilot
  for k,v in pairs(cfg.pilot) do -- each repair perm def
    -- add missions to users
    local users = vRP.getUsersByPermission({k})
    for l,w in pairs(users) do
      local user_id = w
      local player = vRP.getUserSource({user_id})
      if not vRP.hasMission({player}) then
        -- build mission
        local mdata = {}
        mdata.name = lang.pilot.title()

        -- generate items
        local todo = 0
        local cargo_pilot_items = {}
        for idname,data in pairs(v.items) do
          local amount = math.random(data[1],data[2]+1)
          if amount > 0 then
            cargo_pilot_items[idname] = amount
            todo = todo+1
          end
        end

        local step = {
          text = "",
          onenter = function(player, area)
            for idname,amount in pairs(cargo_pilot_items) do
              if amount > 0 then -- check if not done
                if vRP.tryGetInventoryItem({user_id,idname,amount,true}) then
                  local reward = v.items[idname][3]*amount
                  vRP.giveMoney({user_id,reward})
                  vRPclient.notify(player,{glang.money.received({reward})})
                  todo = todo-1
                  cargo_pilot_items[idname] = 0
                  if todo == 0 then -- all received, finish mission
                    vRP.nextMissionStep({player})
                  end
                end
              end
            end
          end,
          position = v.positions[math.random(1,#v.positions)]
        }

        -- mission display
        for idname,amount in pairs(cargo_pilot_items) do
          local name = vRP.getItemName({idname})
          step.text = step.text..lang.pilot.item({name,amount}).."<br />"
        end

        mdata.steps = {step}

        if todo > 0 then
          vRP.startMission({player,mdata})
        end
      end
    end
  end

  -- DELIVERY
  for k,v in pairs(cfg.delivery) do -- each repair perm def
    -- add missions to users
    local users = vRP.getUsersByPermission({k})
    for l,w in pairs(users) do
      local user_id = w
      local player = vRP.getUserSource({user_id})
      if not vRP.hasMission({player}) then
        -- build mission
        local mdata = {}
        mdata.name = lang.delivery.title()

        -- generate items
        local todo = 0
        local delivery_items = {}
        for idname,data in pairs(v.items) do
          local amount = math.random(data[1],data[2]+1)
          if amount > 0 then
            delivery_items[idname] = amount
            todo = todo+1
          end
        end

        local step = {
          text = "",
          onenter = function(player, area)
            for idname,amount in pairs(delivery_items) do
              if amount > 0 then -- check if not done
                if vRP.tryGetInventoryItem({user_id,idname,amount,true}) then
                  local reward = v.items[idname][3]*amount
                  vRP.giveMoney({user_id,reward})
                  vRPclient.notify(player,{glang.money.received({reward})})
                  todo = todo-1
                  delivery_items[idname] = 0
                  if todo == 0 then -- all received, finish mission
                    vRP.nextMissionStep({player})
                  end
                end
              end
            end
          end,
          position = v.positions[math.random(1,#v.positions)]
        }

        -- mission display
        for idname,amount in pairs(delivery_items) do
          local name = vRP.getItemName({idname})
          step.text = step.text..lang.delivery.item({name,amount}).."<br />"
        end

        mdata.steps = {step}

        if todo > 0 then
          vRP.startMission({player,mdata})
        end
      end
    end
  end
      -- Drug seller
  for k,v in pairs(cfg.drugseller) do -- each repair perm def
    -- add missions to users
    local users = vRP.getUsersByPermission({k})
    for l,w in pairs(users) do
      local user_id = w
      local player = vRP.getUserSource({user_id})
      if not vRP.hasMission({player}) then
        -- build mission
        local mdata = {}
        mdata.name = lang.drugseller.title()

        -- generate items
        local todo = 0
        local drugseller_items = {}
        for idname,data in pairs(v.items) do
          local amount = math.random(data[1],data[2]+1)
          if amount > 0 then
            drugseller_items[idname] = amount
            todo = todo+1
          end
        end

        local step = {
          text = "",
          onenter = function(player, area)
            for idname,amount in pairs(drugseller_items) do
              if amount > 0 then -- check if not done
                if vRP.tryGetInventoryItem({user_id,idname,amount,true}) then
                  local reward = v.items[idname][3]*amount
                  vRP.giveMoney({user_id,reward})
                  vRPclient.notify(player,{glang.money.received({reward})})
                  todo = todo-1
                  drugseller_items[idname] = 0
                  if todo == 0 then -- all received, finish mission
                    vRP.nextMissionStep({player})
                  end
                end
              end
            end
          end,
          position = v.positions[math.random(1,#v.positions)]
        }

        -- mission display
        for idname,amount in pairs(drugseller_items) do
          local name = vRP.getItemName({idname})
          step.text = step.text..lang.drugseller.item({name,amount}).."<br />"
        end

        mdata.steps = {step}

        if todo > 0 then
          vRP.startMission({player,mdata})
        end
      end
    end
  end

      -- Fisherman
  for k,v in pairs(cfg.fisherman) do -- each repair perm def
    -- add missions to users
    local users = vRP.getUsersByPermission({k})
    for l,w in pairs(users) do
      local user_id = w
      local player = vRP.getUserSource({user_id})
      if not vRP.hasMission({player}) then
        -- build mission
        local mdata = {}
        mdata.name = lang.fisherman.title()

        -- generate items
        local todo = 0
        local fisherman_items = {}
        for idname,data in pairs(v.items) do
          local amount = math.random(data[1],data[2]+1)
          if amount > 0 then
            fisherman_items[idname] = amount
            todo = todo+1
          end
        end

        local step = {
          text = "",
          onenter = function(player, area)
            for idname,amount in pairs(fisherman_items) do
              if amount > 0 then -- check if not done
                if vRP.tryGetInventoryItem({user_id,idname,amount,true}) then
                  local reward = v.items[idname][3]*amount
                  vRP.giveMoney({user_id,reward})
                  vRPclient.notify(player,{glang.money.received({reward})})
                  todo = todo-1
                  fisherman_items[idname] = 0
                  if todo == 0 then -- all received, finish mission
                    vRP.nextMissionStep({player})
                  end
                end
              end
            end
          end,
          position = v.positions[math.random(1,#v.positions)]
        }

        -- mission display
        for idname,amount in pairs(fisherman_items) do
          local name = vRP.getItemName({idname})
          step.text = step.text..lang.fisherman.item({name,amount}).."<br />"
        end

        mdata.steps = {step}

        if todo > 0 then
          vRP.startMission({player,mdata})
        end
      end
    end
  end

      -- Medical Delivery
  for k,v in pairs(cfg.medical_driver) do -- each repair perm def
    -- add missions to users
    local users = vRP.getUsersByPermission({k})
    for l,w in pairs(users) do
      local user_id = w
      local player = vRP.getUserSource({user_id})
      if not vRP.hasMission({player}) then
        -- build mission
        local mdata = {}
        mdata.name = lang.medical.title()

        -- generate items
        local todo = 0
        local medical_driver_items = {}
        for idname,data in pairs(v.items) do
          local amount = math.random(data[1],data[2]+1)
          if amount > 0 then
            medical_driver_items[idname] = amount
            todo = todo+1
          end
        end

        local step = {
          text = "",
          onenter = function(player, area)
            for idname,amount in pairs(medical_driver_items) do
              if amount > 0 then -- check if not done
                if vRP.tryGetInventoryItem({user_id,idname,amount,true}) then
                  local reward = v.items[idname][3]*amount
                  vRP.giveMoney({user_id,reward})
                  vRPclient.notify(player,{glang.money.received({reward})})
                  todo = todo-1
                  medical_driver_items[idname] = 0
                  if todo == 0 then -- all received, finish mission
                    vRP.nextMissionStep({player})
                  end
                end
              end
            end
          end,
          position = v.positions[math.random(1,#v.positions)]
        }

        -- mission display
        for idname,amount in pairs(medical_driver_items) do
          local name = vRP.getItemName({idname})
          step.text = step.text..lang.medical.item({name,amount}).."<br />"
        end

        mdata.steps = {step}

        if todo > 0 then
          vRP.startMission({player,mdata})
        end
      end
    end
  end
  
       -- Weapons Smuggler
  for k,v in pairs(cfg.weapons_smuggler) do -- each repair perm def
    -- add missions to users
    local users = vRP.getUsersByPermission({k})
    for l,w in pairs(users) do
      local user_id = w
      local player = vRP.getUserSource({user_id})
      if not vRP.hasMission({player}) then
        -- build mission
        local mdata = {}
        mdata.name = lang.weapons_smuggler.title()

        -- generate items
        local todo = 0
        local weapons_smuggler_items = {}
        for idname,data in pairs(v.items) do
          local amount = math.random(data[1],data[2]+1)
          if amount > 0 then
            weapons_smuggler_items[idname] = amount
            todo = todo+1
          end
        end

        local step = {
          text = "",
          onenter = function(player, area)
            for idname,amount in pairs(weapons_smuggler_items) do
              if amount > 0 then -- check if not done
                if vRP.tryGetInventoryItem({user_id,idname,amount,true}) then
                  local reward = v.items[idname][3]*amount
                  vRP.giveMoney({user_id,reward})
                  vRPclient.notify(player,{glang.money.received({reward})})
                  todo = todo-1
                  weapons_smuggler_items[idname] = 0
                  if todo == 0 then -- all received, finish mission
                    vRP.nextMissionStep({player})
                  end
                end
              end
            end
          end,
          position = v.positions[math.random(1,#v.positions)]
        }

        -- mission display
        for idname,amount in pairs(weapons_smuggler_items) do
          local name = vRP.getItemName({idname})
          step.text = step.text..lang.weapons_smuggler.item({name,amount}).."<br />"
        end

        mdata.steps = {step}

        if todo > 0 then
          vRP.startMission({player,mdata})
        end
      end
    end
  end
  
       -- Santa (Disabled)
  -- for k,v in pairs(cfg.santa) do -- each repair perm def
    -- add missions to users
    -- local users = vRP.getUsersByPermission({k})
    -- for l,w in pairs(users) do
      -- local user_id = w
      -- local player = vRP.getUserSource({user_id})
      -- if not vRP.hasMission({player}) then
        -- build mission
        -- local mdata = {}
        -- mdata.name = lang.santa.title()

        -- generate items
        -- local todo = 0
        -- local santa_items = {}
        -- for idname,data in pairs(v.items) do
          -- local amount = math.random(data[1],data[2]+1)
          -- if amount > 0 then
            -- santa_items[idname] = amount
            -- todo = todo+1
          -- end
        -- end

        -- local step = {
          -- text = "",
          -- onenter = function(player, area)
            -- for idname,amount in pairs(santa_items) do
              -- if amount > 0 then -- check if not done
                -- if vRP.tryGetInventoryItem({user_id,idname,amount,true}) then
                  -- local reward = v.items[idname][3]*amount
                  -- vRP.giveMoney({user_id,reward})
                  -- vRPclient.notify(player,{glang.money.received({reward})})
                  -- todo = todo-1
                  -- santa_items[idname] = 0
                  -- if todo == 0 then -- all received, finish mission
                    -- vRP.nextMissionStep({player})
                  -- end
                -- end
              -- end
            -- end
          -- end,
          -- position = v.positions[math.random(1,#v.positions)]
        -- }

        -- mission display
        -- for idname,amount in pairs(santa_items) do
          -- local name = vRP.getItemName({idname})
          -- step.text = step.text..lang.santa.item({name,amount}).."<br />"
        -- end

        -- mdata.steps = {step}

        -- if todo > 0 then
          -- vRP.startMission({player,mdata})
        -- end
      -- end
    -- end
  -- end
  
      -- hacker
  for k,v in pairs(cfg.hacker) do -- each repair perm def
    -- add missions to users
    local users = vRP.getUsersByPermission({k})
    for l,w in pairs(users) do
      local user_id = w
      local player = vRP.getUserSource({user_id})
      if not vRP.hasMission({player}) then
        -- build mission
        local mdata = {}
        mdata.name = lang.hacker.title()

        -- generate items
        local todo = 0
        local hacker_items = {}
        for idname,data in pairs(v.items) do
          local amount = math.random(data[1],data[2]+1)
          if amount > 0 then
            hacker_items[idname] = amount
            todo = todo+1
          end
        end

        local step = {
          text = "",
          onenter = function(player, area)
            for idname,amount in pairs(hacker_items) do
              if amount > 0 then -- check if not done
                if vRP.tryGetInventoryItem({user_id,idname,amount,true}) then
                  local reward = v.items[idname][3]*amount
                  vRP.giveMoney({user_id,reward})
                  vRPclient.notify(player,{glang.money.received({reward})})
                  todo = todo-1
                  hacker_items[idname] = 0
                  if todo == 0 then -- all received, finish mission
                    vRP.nextMissionStep({player})
                  end
                end
              end
            end
          end,
          position = v.positions[math.random(1,#v.positions)]
        }

        -- mission display
        for idname,amount in pairs(hacker_items) do
          local name = vRP.getItemName({idname})
          step.text = step.text..lang.hacker.item({name,amount}).."<br />"
        end

        mdata.steps = {step}

        if todo > 0 then
          vRP.startMission({player,mdata})
        end
      end
    end
  end
  
      -- Trash Collector
  for k,v in pairs(cfg.trash) do -- each repair perm def
    -- add missions to users
    local users = vRP.getUsersByPermission({k})
    for l,w in pairs(users) do
      local user_id = w
      local player = vRP.getUserSource({user_id})
      if not vRP.hasMission({player}) then
        -- build mission
        local mdata = {}
        mdata.name = lang.trash.title()

        -- generate items
        local todo = 0
        local trash_items = {}
        for idname,data in pairs(v.items) do
          local amount = math.random(data[1],data[2]+1)
          if amount > 0 then
            trash_items[idname] = amount
            todo = todo+1
          end
        end

        local step = {
          text = "",
          onenter = function(player, area)
            for idname,amount in pairs(trash_items) do
              if amount > 0 then -- check if not done
                if vRP.tryGetInventoryItem({user_id,idname,amount,true}) then
                  local reward = v.items[idname][3]*amount
                  vRP.giveMoney({user_id,reward})
                  vRPclient.notify(player,{glang.money.received({reward})})
                  todo = todo-1
                  trash_items[idname] = 0
                  if todo == 0 then -- all received, finish mission
                    vRP.nextMissionStep({player})
                  end
                end
              end
            end
          end,
          position = v.positions[math.random(1,#v.positions)]
        }

        -- mission display
        for idname,amount in pairs(trash_items) do
          local name = vRP.getItemName({idname})
          step.text = step.text..lang.trash.item({name,amount}).."<br />"
        end

        mdata.steps = {step}

        if todo > 0 then
          vRP.startMission({player,mdata})
        end
      end
    end
  end

      -- Forger
  for k,v in pairs(cfg.forger) do -- each repair perm def
    -- add missions to users
    local users = vRP.getUsersByPermission({k})
    for l,w in pairs(users) do
      local user_id = w
      local player = vRP.getUserSource({user_id})
      if not vRP.hasMission({player}) then
        -- build mission
        local mdata = {}
        mdata.name = lang.forger.title()

        -- generate items
        local todo = 0
        local forger_items = {}
        for idname,data in pairs(v.items) do
          local amount = math.random(data[1],data[2]+1)
          if amount > 0 then
            forger_items[idname] = amount
            todo = todo+1
          end
        end

        local step = {
          text = "",
          onenter = function(player, area)
            for idname,amount in pairs(forger_items) do
              if amount > 0 then -- check if not done
                if vRP.tryGetInventoryItem({user_id,idname,amount,true}) then
                  local reward = v.items[idname][3]*amount
                  vRP.giveMoney({user_id,reward})
                  vRPclient.notify(player,{glang.money.received({reward})})
                  todo = todo-1
                  forger_items[idname] = 0
                  if todo == 0 then -- all received, finish mission
                    vRP.nextMissionStep({player})
                  end
                end
              end
            end
          end,
          position = v.positions[math.random(1,#v.positions)]
        }

        -- mission display
        for idname,amount in pairs(forger_items) do
          local name = vRP.getItemName({idname})
          step.text = step.text..lang.forger.item({name,amount}).."<br />"
        end

        mdata.steps = {step}

        if todo > 0 then
          vRP.startMission({player,mdata})
        end
      end
    end
  end

      -- Police
  for k,v in pairs(cfg.police) do -- each repair perm def
    -- add missions to users
    local users = vRP.getUsersByPermission({k})
    for l,w in pairs(users) do
      local user_id = w
      local player = vRP.getUserSource({user_id})
      if not vRP.hasMission({player}) then
        -- build mission
        local mdata = {}
        mdata.name = lang.police.title()

        -- generate items
        local todo = 0
        local police_items = {}
        for idname,data in pairs(v.items) do
          local amount = math.random(data[1],data[2]+1)
          if amount > 0 then
            police_items[idname] = amount
            todo = todo+1
          end
        end

        local step = {
          text = "",
          onenter = function(player, area)
            for idname,amount in pairs(police_items) do
              if amount > 0 then -- check if not done
                if vRP.tryGetInventoryItem({user_id,idname,amount,true}) then
                  local reward = v.items[idname][3]*amount
                  vRP.giveMoney({user_id,reward})
                  vRPclient.notify(player,{glang.money.received({reward})})
                  todo = todo-1
                  police_items[idname] = 0
                  if todo == 0 then -- all received, finish mission
                    vRP.nextMissionStep({player})
                  end
                end
              end
            end
          end,
          position = v.positions[math.random(1,#v.positions)]
        }

        -- mission display
        for idname,amount in pairs(police_items) do
          local name = vRP.getItemName({idname})
          step.text = step.text..lang.police.item({name,amount}).."<br />"
        end

        mdata.steps = {step}

        if todo > 0 then
          vRP.startMission({player,mdata})
        end
      end
    end
  end  

      -- EMS
  for k,v in pairs(cfg.ems) do -- each repair perm def
    -- add missions to users
    local users = vRP.getUsersByPermission({k})
    for l,w in pairs(users) do
      local user_id = w
      local player = vRP.getUserSource({user_id})
      if not vRP.hasMission({player}) then
        -- build mission
        local mdata = {}
        mdata.name = lang.ems.title()

        -- generate items
        local todo = 0
        local ems_items = {}
        for idname,data in pairs(v.items) do
          local amount = math.random(data[1],data[2]+1)
          if amount > 0 then
            ems_items[idname] = amount
            todo = todo+1
          end
        end

        local step = {
          text = "",
          onenter = function(player, area)
            for idname,amount in pairs(ems_items) do
              if amount > 0 then -- check if not done
                if vRP.tryGetInventoryItem({user_id,idname,amount,true}) then
                  local reward = v.items[idname][3]*amount
                  vRP.giveMoney({user_id,reward})
                  vRPclient.notify(player,{glang.money.received({reward})})
                  todo = todo-1
                  ems_items[idname] = 0
                  if todo == 0 then -- all received, finish mission
                    vRP.nextMissionStep({player})
                  end
                end
              end
            end
          end,
          position = v.positions[math.random(1,#v.positions)]
        }

        -- mission display
        for idname,amount in pairs(ems_items) do
          local name = vRP.getItemName({idname})
          step.text = step.text..lang.ems.item({name,amount}).."<br />"
        end

        mdata.steps = {step}

        if todo > 0 then
          vRP.startMission({player,mdata})
        end
      end
    end
  end
  
  SetTimeout(60000,task_mission)
end
task_mission()
