local cfg = module("cfg/player_state")
local cfg_client = module("cfg/client")
local log_config = module("servercfg/cfg_webhooks")
local lang = vRP.lang

local function isFiniteNumber(n)
    return type(n) == "number" and n == n and n > -math.huge and n < math.huge
end

function vRP.sanitizeWeapons(weapons)
    local sanitized = {}
    if type(weapons) == "table" then
        local count = 0
        for k, v in pairs(weapons) do
            if count >= 100 then
                break
            end
            if type(k) == "string" and #k <= 64 and string.match(k, "^WEAPON_[%w_]+$") and type(v) == "table" then
                local ammo = tonumber(v.ammo) or 0
                if not isFiniteNumber(ammo) then
                    ammo = 0
                end
                sanitized[k] = {ammo = math.max(0, math.min(math.floor(ammo), 9999))}
                count = count + 1
            end
        end
    end
    return sanitized
end

local recent_weapon_gives = {}
local weapon_give_grace = 10000

local storing_weapons = {}
local last_weapon_store = {}

AddEventHandler("vRP:playerLeave", function(user_id, source)
    recent_weapon_gives[user_id] = nil
    storing_weapons[user_id] = nil
    last_weapon_store[user_id] = nil
end)

function vRP.isStoringWeapons(user_id)
    return storing_weapons[user_id] ~= nil
end

local function mergeWeapons(user_id, weapons, clear_before)
    local data = vRP.getUserDataTable(user_id)
    if data == nil then
        return
    end
    if clear_before or type(data.weapons) ~= "table" then
        data.weapons = {}
        recent_weapon_gives[user_id] = {}
    end
    local recent = recent_weapon_gives[user_id] or {}
    recent_weapon_gives[user_id] = recent
    for k, v in pairs(vRP.sanitizeWeapons(weapons)) do
        local current = data.weapons[k]
        local ammo = v.ammo + (current and tonumber(current.ammo) or 0)
        data.weapons[k] = {ammo = math.min(ammo, 9999)}
        recent[k] = GetGameTimer()
    end
end

local rawGiveWeapons = vRPclient.giveWeapons
vRPclient.giveWeapons = function(dest, args, cb)
    local user_id = vRP.getUserId(dest)
    if user_id ~= nil and type(args) == "table" then
        mergeWeapons(user_id, args[1], args[2])
    end
    return rawGiveWeapons(dest, args, cb)
end

function vRP.giveWeapons(source, weapons, clear_before)
    vRPclient.giveWeapons(source, {weapons, clear_before})
end

function vRP.hasWeapon(user_id, weapon)
    if not vRPConfig.ServerSideWeapons then
        return true
    end
    local data = vRP.getUserDataTable(user_id)
    return data ~= nil and type(data.weapons) == "table" and data.weapons[weapon] ~= nil
end

function vRP.reconcileWeapons(user_id, reported, strict)
    reported = vRP.sanitizeWeapons(reported)
    local data = vRP.getUserDataTable(user_id)
    if data == nil then
        return {}
    end
    if not vRPConfig.ServerSideWeapons then
        data.weapons = reported
        return reported
    end
    local ledger = type(data.weapons) == "table" and data.weapons or {}
    local recent = recent_weapon_gives[user_id] or {}
    local now = GetGameTimer()
    local result = {}
    local budget = 0
    for k, v in pairs(ledger) do
        if not strict and recent[k] and now - recent[k] < weapon_give_grace then
            result[k] = {ammo = tonumber(v.ammo) or 0}
        else
            recent[k] = nil
            budget = budget + (tonumber(v.ammo) or 0)
        end
    end
    for k, v in pairs(reported) do
        if ledger[k] ~= nil and result[k] == nil then
            local ammo = math.min(v.ammo, budget)
            budget = budget - ammo
            result[k] = {ammo = ammo}
        end
    end
    data.weapons = result
    return result
end

local function sanitizeCustomization(customization)
    if type(customization) ~= "table" then
        return nil
    end
    local sanitized = {}
    local count = 0
    for k, v in pairs(customization) do
        if count >= 64 then
            break
        end
        local validKey = (type(k) == "string" and #k <= 32) or (isFiniteNumber(k) and k == math.floor(k))
        if validKey then
            if isFiniteNumber(v) then
                sanitized[k] = v
                count = count + 1
            elseif type(v) == "string" and #v <= 64 then
                sanitized[k] = v
                count = count + 1
            elseif type(v) == "table" then
                local entry = {}
                for i = 1, 3 do
                    if not isFiniteNumber(v[i]) then
                        break
                    end
                    entry[i] = v[i]
                end
                sanitized[k] = entry
                count = count + 1
            end
        end
    end
    return sanitized
end

function vRP.isPlayerDowned(source)
    local ped = GetPlayerPed(source)
    if ped == nil or ped == 0 or not DoesEntityExist(ped) then
        return true
    end
    return GetEntityHealth(ped) <= cfg_client.coma_threshold
end

-- client -> server events
AddEventHandler("vRP:playerSpawn", function(user_id, source, first_spawn)
    Debug.pbegin("playerSpawned_player_state")
    local player = source
    local data = vRP.getUserDataTable(user_id)
    local tmpdata = vRP.getUserTmpTable(user_id)
    local playername = GetPlayerName(player)
    webhook = log_config.spawnlog
    if webhook ~= nil then
        if webhook ~= 'none' then
            PerformHttpRequest(webhook, function(err, text, headers) end, "POST", json.encode({username = "Dunko vRP Logs", embeds = {{["color"] = "15158332", ["title"] = playername .. ' Has Spawned In The Server', ["description"] = 'His Perm-ID: **' .. user_id .. '\n** His Source Id: **' .. player .. '**', ["footer"] = {["text"] = "Time - "..os.date("%x %X %p"),}}}}), { ["Content-Type"] = "application/json" })
        end
    end


    if first_spawn then -- first spawn
        -- cascade load customization then weapons
        if data.customization == nil then
            data.customization = cfg.default_customization
        end

        if data.position == nil and cfg.spawn_enabled then
            local x = cfg.spawn_position[1] + math.random() * cfg.spawn_radius * 2 - cfg.spawn_radius
            local y = cfg.spawn_position[2] + math.random() * cfg.spawn_radius * 2 - cfg.spawn_radius
            local z = cfg.spawn_position[3] + math.random() * cfg.spawn_radius * 2 - cfg.spawn_radius
            data.position = {
                x = x,
                y = y,
                z = z
            }
        end

        if data.position ~= nil then -- teleport to saved pos
            vRPclient.teleport(source, {data.position.x, data.position.y, data.position.z})
        end

        if data.customization ~= nil then
            vRPclient.setCustomization(source, {data.customization},
                function() -- delayed weapons/health, because model respawn
                    if data.weapons ~= nil then -- load saved weapons
                        vRPclient.giveWeapons(source, {data.weapons, true})

                        if data.health ~= nil then -- set health
                            vRPclient.setHealth(source, {data.health})
                            SetTimeout(5000, function() -- check coma, kill if in coma
                                vRPclient.isInComa(player, {}, function(in_coma)
                                    vRPclient.killComa(player, {})
                                end)
                            end)
                        end
                        
                        if data.armour ~= nil then
                            vRPclient.setArmour(source, {data.armour})
                        end
                    end
                end)
        else
            if data.weapons ~= nil then -- load saved weapons
                vRPclient.giveWeapons(source, {data.weapons, true})
            end

            if data.health ~= nil then
                vRPclient.setHealth(source, {data.health})
            end
        end

        -- notify last login
        SetTimeout(15000, function()
            vRPclient.notify(player, {lang.common.welcome({tmpdata.last_login})})
        end)
    else -- not first spawn (player died), don't load weapons, empty wallet, empty inventory
        vRP.setHunger(user_id, 0)
        vRP.setThirst(user_id, 0)

        if cfg.clear_phone_directory_on_death then
            data.phone_directory = {} -- clear phone directory after death
        end

        if cfg.lose_aptitudes_on_death then
            data.gaptitudes = {} -- clear aptitudes after death
        end

        if vRPConfig.LoseItemsOnDeath then 
            vRP.clearInventory(user_id) 
        end
        
        vRP.setMoney(user_id, 0)

        -- disable handcuff
        vRPclient.setHandcuffed(player, {false})

        if cfg.spawn_enabled then -- respawn (CREATED SPAWN_DEATH)
            local x = cfg.spawn_death[1] + math.random() * cfg.spawn_radius * 2 - cfg.spawn_radius
            local y = cfg.spawn_death[2] + math.random() * cfg.spawn_radius * 2 - cfg.spawn_radius
            local z = cfg.spawn_death[3] + math.random() * cfg.spawn_radius * 2 - cfg.spawn_radius
            data.position = {
                x = x,
                y = y,
                z = z
            }
            vRPclient.teleport(source, {x, y, z})
        end

        -- load character customization
        if data.customization ~= nil then
            vRPclient.setCustomization(source, {data.customization})
        end
    end
    Debug.pend()
end)

-- updates

function tvRP.updatePos(x, y, z)
    local user_id = vRP.getUserId(source)
    if user_id ~= nil then
        local data = vRP.getUserDataTable(user_id)
        local tmp = vRP.getUserTmpTable(user_id)
        x, y, z = tonumber(x), tonumber(y), tonumber(z)
        if not (isFiniteNumber(x) and isFiniteNumber(y) and isFiniteNumber(z)) then
            return
        end
        if data ~= nil and (tmp == nil or tmp.home_stype == nil) then -- don't save position if inside home slot
            data.position = {
                x = tonumber(x),
                y = tonumber(y),
                z = tonumber(z)
            }
        end
    end
end

function tvRP.updateWeapons(weapons)
    local user_id = vRP.getUserId(source)
    if user_id ~= nil then
        vRP.reconcileWeapons(user_id, weapons)
    end
end

function tvRP.updateCustomization(customization)
    local user_id = vRP.getUserId(source)
    if user_id ~= nil then
        local data = vRP.getUserDataTable(user_id)
        customization = sanitizeCustomization(customization)
        if data ~= nil and customization ~= nil then
            data.customization = customization
        end
    end
end

function tvRP.updateHealth(health)
    local user_id = vRP.getUserId(source)
    if user_id ~= nil then
        local data = vRP.getUserDataTable(user_id)
        health = tonumber(health)
        if data ~= nil and isFiniteNumber(health) then
            data.health = health
        end
    end
end

function tvRP.updateArmour(armour)
    local user_id = vRP.getUserId(source)
    if user_id ~= nil then
        local data = vRP.getUserDataTable(user_id)
        armour = tonumber(armour)
        if data ~= nil and isFiniteNumber(armour) then
            data.armour = armour
        end
    end
end

function tvRP.StoreWeaponsDead()
    local player = source 
    local user_id = vRP.getUserId(player)
    if user_id == nil then
        return
    end
    if storing_weapons[user_id] or (last_weapon_store[user_id] and GetGameTimer() - last_weapon_store[user_id] < 15000) then
        vRPclient.notify(player,{"~o~Your weapons are already being stored hmm..."})
        return
    end
    local token = {}
    storing_weapons[user_id] = token
    last_weapon_store[user_id] = GetGameTimer()
    SetTimeout(15000,function()
        if storing_weapons[user_id] == token then
            storing_weapons[user_id] = nil
        end
    end)
    Wait(1000)
    if not vRP.isPlayerDowned(player) then
        storing_weapons[user_id] = nil
        last_weapon_store[user_id] = nil
        return
    end
	vRPclient.getWeapons(player,{},function(weapons)
        weapons = vRP.reconcileWeapons(user_id, weapons, true)
        vRPclient.giveWeapons(player,{{},true}, function(removedwep)
            for k,v in pairs(weapons) do
                vRP.giveInventoryItem(user_id, "wbody|"..k, 1, true)
                if v.ammo > 0 then
                    vRP.giveInventoryItem(user_id, "wammo|"..k, v.ammo, true)
                end
            end
            if storing_weapons[user_id] == token then
                storing_weapons[user_id] = nil
            end
            vRPclient.notify(player,{"~g~Weapons Stored"})
        end)
	end)
end