MySQL = module("vrp_mysql", "MySQL")

local Proxy = module("lib/Proxy")
local Tunnel = module("lib/Tunnel")
local Lang = module("lib/Lang")
Debug = module("lib/Debug")

local config = module("cfg/base")
local version = module("version")
Debug.active = config.debug

-- versioning
print("[vRP] launch version "..version)
--[[
PerformHttpRequest("https://raw.githubusercontent.com/ImagicTheCat/vRP/master/vrp/version.lua",function(err,text,headers)
    if err == 0 then
        text = string.gsub(text,"return ","")
        local r_version = tonumber(text)
        if version ~= r_version then
            print("[vRP] WARNING: A new version of vRP is available here https://github.com/ImagicTheCat/vRP, update to benefit from the last features and to fix exploits/bugs.")
        end
    else
        print("[vRP] unable to check the remote version")
    end
end, "GET", "")
--]]

vRP = {}
Proxy.addInterface("vRP",vRP)

tvRP = {}
Tunnel.bindInterface("vRP",tvRP) -- listening for client tunnel

-- load language 
local dict = module("cfg/lang/"..config.lang) or {}
vRP.lang = Lang.new(dict)

-- init
vRPclient = Tunnel.getInterface("vRP","vRP") -- server -> client tunnel

vRP.users = {} -- will store logged users (id) by first identifier
vRP.rusers = {} -- store the opposite of users
vRP.user_tables = {} -- user data tables (logger storage, saved to database)
vRP.user_tmp_tables = {} -- user tmp data tables (logger storage, not saved)
vRP.user_sources = {} -- user sources 
-- queries
Citizen.CreateThread(function()
    Wait(2500) -- Wait for GHMatti to Initialize
    MySQL.SingleQuery([[
    CREATE TABLE IF NOT EXISTS vrp_users(
    id INTEGER AUTO_INCREMENT,
    last_login VARCHAR(100),
    whitelisted BOOLEAN,
    banned BOOLEAN,
    bantime VARCHAR(100) NOT NULL DEFAULT "",
    banreason VARCHAR(1000) NOT NULL DEFAULT "",
    banadmin VARCHAR(100) NOT NULL DEFAULT "",
    CONSTRAINT pk_user PRIMARY KEY(id)
    );
    ]])
    MySQL.SingleQuery([[
    CREATE TABLE IF NOT EXISTS vrp_user_ids (
    identifier VARCHAR(100) NOT NULL,
    user_id INTEGER,
    banned BOOLEAN,
    CONSTRAINT pk_user_ids PRIMARY KEY(identifier)
    );
    ]])
    MySQL.SingleQuery([[
        CREATE TABLE IF NOT EXISTS vrp_user_tokens (
        token VARCHAR(200),
        user_id INTEGER,
        banned BOOLEAN  NOT NULL DEFAULT 0,
        CONSTRAINT pk_user_ids PRIMARY KEY(token)
        );
    ]])
    MySQL.SingleQuery([[
    CREATE TABLE IF NOT EXISTS vrp_user_data(
    user_id INTEGER,
    dkey VARCHAR(100),
    dvalue TEXT,
    CONSTRAINT pk_user_data PRIMARY KEY(user_id,dkey),
    CONSTRAINT fk_user_data_users FOREIGN KEY(user_id) REFERENCES vrp_users(id) ON DELETE CASCADE
    );
    ]])
    MySQL.SingleQuery([[
    CREATE TABLE IF NOT EXISTS vrp_srv_data(
    dkey VARCHAR(100),
    dvalue TEXT,
    CONSTRAINT pk_srv_data PRIMARY KEY(dkey)
    );
    ]])
    MySQL.SingleQuery([[
    CREATE TABLE IF NOT EXISTS vrp_user_moneys(
    user_id INTEGER,
    wallet INTEGER,
    bank INTEGER,
    CONSTRAINT pk_user_moneys PRIMARY KEY(user_id),
    CONSTRAINT fk_user_moneys_users FOREIGN KEY(user_id) REFERENCES vrp_users(id) ON DELETE CASCADE
    );
    ]])
    MySQL.SingleQuery([[
    CREATE TABLE IF NOT EXISTS vrp_user_moneys(
    user_id INTEGER,
    wallet INTEGER,
    bank INTEGER,
    CONSTRAINT pk_user_moneys PRIMARY KEY(user_id),
    CONSTRAINT fk_user_moneys_users FOREIGN KEY(user_id) REFERENCES vrp_users(id) ON DELETE CASCADE
    );
    ]])
    MySQL.SingleQuery([[
    CREATE TABLE IF NOT EXISTS vrp_user_business(
    user_id INTEGER,
    name VARCHAR(30),
    description TEXT,
    capital INTEGER,
    laundered INTEGER,
    reset_timestamp INTEGER,
    CONSTRAINT pk_user_business PRIMARY KEY(user_id),
    CONSTRAINT fk_user_business_users FOREIGN KEY(user_id) REFERENCES vrp_users(id) ON DELETE CASCADE
    );
    ]])
    MySQL.SingleQuery([[
    CREATE TABLE IF NOT EXISTS vrp_user_vehicles(
    user_id INTEGER,
    vehicle VARCHAR(100),
    vehicle_plate varchar(255) NOT NULL,
    CONSTRAINT pk_user_vehicles PRIMARY KEY(user_id,vehicle),
    CONSTRAINT fk_user_vehicles_users FOREIGN KEY(user_id) REFERENCES vrp_users(id) ON DELETE CASCADE
    );
    ]])
    MySQL.SingleQuery([[
    CREATE TABLE IF NOT EXISTS vrp_user_homes(
    user_id INTEGER,
    home VARCHAR(100),
    number INTEGER,
    CONSTRAINT pk_user_homes PRIMARY KEY(user_id),
    CONSTRAINT fk_user_homes_users FOREIGN KEY(user_id) REFERENCES vrp_users(id) ON DELETE CASCADE,
    UNIQUE(home,number)
    );
    ]])
    MySQL.SingleQuery([[
    CREATE TABLE IF NOT EXISTS vrp_user_identities(
    user_id INTEGER,
    registration VARCHAR(100),
    phone VARCHAR(100),
    firstname VARCHAR(100),
    name VARCHAR(100),
    age INTEGER,
    CONSTRAINT pk_user_identities PRIMARY KEY(user_id),
    CONSTRAINT fk_user_identities_users FOREIGN KEY(user_id) REFERENCES vrp_users(id) ON DELETE CASCADE,
    INDEX(registration),
    INDEX(phone)
    );
    ]])
    MySQL.SingleQuery("ALTER TABLE vrp_users ADD IF NOT EXISTS bantime varchar(100) NOT NULL DEFAULT '';")
    MySQL.SingleQuery("ALTER TABLE vrp_users ADD IF NOT EXISTS banreason varchar(100) NOT NULL DEFAULT '';")
    MySQL.SingleQuery("ALTER TABLE vrp_users ADD IF NOT EXISTS banadmin varchar(100) NOT NULL DEFAULT ''; ")
    print("[vRP] init base tables")
end)






MySQL.createCommand("vRP/create_user","INSERT INTO vrp_users(whitelisted,banned) VALUES(false,false)")
MySQL.createCommand("vRP/add_identifier","INSERT INTO vrp_user_ids(identifier,user_id) VALUES(@identifier,@user_id)")
MySQL.createCommand("vRP/userid_byidentifier","SELECT user_id FROM vrp_user_ids WHERE identifier = @identifier")
MySQL.createCommand("vRP/identifier_all","SELECT * FROM vrp_user_ids WHERE identifier = @identifier")
MySQL.createCommand("vRP/select_identifier_byid_all","SELECT * FROM vrp_user_ids WHERE user_id = @id")

MySQL.createCommand("vRP/set_userdata","REPLACE INTO vrp_user_data(user_id,dkey,dvalue) VALUES(@user_id,@key,@value)")
MySQL.createCommand("vRP/get_userdata","SELECT dvalue FROM vrp_user_data WHERE user_id = @user_id AND dkey = @key")

MySQL.createCommand("vRP/set_srvdata","REPLACE INTO vrp_srv_data(dkey,dvalue) VALUES(@key,@value)")
MySQL.createCommand("vRP/get_srvdata","SELECT dvalue FROM vrp_srv_data WHERE dkey = @key")

MySQL.createCommand("vRP/get_banned","SELECT banned FROM vrp_users WHERE id = @user_id")
MySQL.createCommand("vRP/set_banned","UPDATE vrp_users SET banned = @banned, bantime = @bantime,  banreason = @banreason,  banadmin = @banadmin WHERE id = @user_id")
MySQL.createCommand("vRP/set_identifierbanned","UPDATE vrp_user_ids SET banned = @banned WHERE identifier = @iden")
MySQL.createCommand("vRP/getbanreasontime", "SELECT * FROM vrp_users WHERE id = @user_id")

MySQL.createCommand("vRP/get_whitelisted","SELECT whitelisted FROM vrp_users WHERE id = @user_id")
MySQL.createCommand("vRP/set_whitelisted","UPDATE vrp_users SET whitelisted = @whitelisted WHERE id = @user_id")
MySQL.createCommand("vRP/set_last_login","UPDATE vrp_users SET last_login = @last_login WHERE id = @user_id")
MySQL.createCommand("vRP/get_last_login","SELECT last_login FROM vrp_users WHERE id = @user_id")

--Token Banning 
MySQL.createCommand("vRP/add_token","INSERT INTO vrp_user_tokens(token,user_id) VALUES(@token,@user_id)")
MySQL.createCommand("vRP/check_token","SELECT user_id, banned FROM vrp_user_tokens WHERE token = @token")
MySQL.createCommand("vRP/check_token_userid","SELECT token FROM vrp_user_tokens WHERE user_id = @id")
MySQL.createCommand("vRP/ban_token","UPDATE vrp_user_tokens SET banned = @banned WHERE token = @token")
--Token Banning

-- init tables


-- identification system

--- sql.
-- cbreturn user id or nil in case of error (if not found, will create it)
function vRP.getUserIdByIdentifiers(ids, cbr)
    local task = Task(cbr)
    
    if ids ~= nil and #ids then
        local i = 0
        
        -- search identifiers
        local function search()
            i = i+1
            if i <= #ids then
                if not config.ignore_ip_identifier or (string.find(ids[i], "ip:") == nil) then  -- ignore ip identifier
                    MySQL.query("vRP/userid_byidentifier", {identifier = ids[i]}, function(rows, affected)
                        if #rows > 0 then  -- found
                            task({rows[1].user_id})
                        else -- not found
                            search()
                        end
                    end)
                else
                    search()
                end
            else -- no ids found, create user
                MySQL.query("vRP/create_user", {}, function(rows, affected)
                    if rows.affectedRows > 0 then
                        local user_id = rows.insertId
                        -- add identifiers
                        for l,w in pairs(ids) do
                            if not config.ignore_ip_identifier or (string.find(w, "ip:") == nil) then  -- ignore ip identifier
                                MySQL.execute("vRP/add_identifier", {user_id = user_id, identifier = w})
                            end
                        end
                        
                        task({user_id})
                    else
                        task()
                    end
                end)
            end
        end
        
        search()
    else
        task()
    end
end

-- return identification string for the source (used for non vRP identifications, for rejected players)
function vRP.getSourceIdKey(source)
    local ids = GetPlayerIdentifiers(source)
    local idk = "idk_"
    for k,v in pairs(ids) do
        idk = idk..v
    end
    
    return idk
end

function vRP.getPlayerEndpoint(player)
    return GetPlayerEP(player) or "0.0.0.0"
end

function vRP.getPlayerName(player)
    return GetPlayerName(player) or "unknown"
end

--- sql

function vRP.ReLoadChar(source)
    local name = GetPlayerName(source)
    local ids = GetPlayerIdentifiers(source)
    vRP.getUserIdByIdentifiers(ids, function(user_id)
        if user_id ~= nil then  
            vRP.StoreTokens(source, user_id) 
            if vRP.rusers[user_id] == nil then -- not present on the server, init
                vRP.users[ids[1]] = user_id
                vRP.rusers[user_id] = ids[1]
                vRP.user_tables[user_id] = {}
                vRP.user_tmp_tables[user_id] = {}
                vRP.user_sources[user_id] = source
                vRP.getUData(user_id, "vRP:datatable", function(sdata)
                    local data = json.decode(sdata)
                    if type(data) == "table" then vRP.user_tables[user_id] = data end
                    local tmpdata = vRP.getUserTmpTable(user_id)
                    vRP.getLastLogin(user_id, function(last_login)
                        tmpdata.last_login = last_login or ""
                        tmpdata.spawns = 0
                        local ep = vRP.getPlayerEndpoint(source)
                        local last_login_stamp = ep.." "..os.date("%H:%M:%S %d/%m/%Y")
                        MySQL.execute("vRP/set_last_login", {user_id = user_id, last_login = last_login_stamp})
                        print("[vRP] "..name.." ("..vRP.getPlayerEndpoint(source)..") joined (user_id = "..user_id..")")
                        TriggerEvent("vRP:playerJoin", user_id, source, name, tmpdata.last_login)
                        TriggerClientEvent("VRP:CheckIdRegister", source)
                    end)
                end)
            else -- already connected
                print("[vRP] "..name.." ("..vRP.getPlayerEndpoint(source)..") re-joined (user_id = "..user_id..")")
                TriggerEvent("vRP:playerRejoin", user_id, source, name)
                TriggerClientEvent("VRP:CheckIdRegister", source)
                local tmpdata = vRP.getUserTmpTable(user_id)
                tmpdata.spawns = 0
            end
        end
    end)
end

RegisterNetEvent("VRP:CheckID")
AddEventHandler("VRP:CheckID", function()
    local user_id = vRP.getUserId(source)
    if not user_id then
        vRP.ReLoadChar(source)
    end
end)

function vRP.isBanned(user_id, cbr)
    local task = Task(cbr, {false})
    
    MySQL.query("vRP/get_banned", {user_id = user_id}, function(rows, affected)
        if #rows > 0 then
            task({rows[1].banned})
        else
            task()
        end
    end)
end

--- sql

--- sql
function vRP.isWhitelisted(user_id, cbr)
    local task = Task(cbr, {false})
    
    MySQL.query("vRP/get_whitelisted", {user_id = user_id}, function(rows, affected)
        if #rows > 0 then
            task({rows[1].whitelisted})
        else
            task()
        end
    end)
end

--- sql
function vRP.setWhitelisted(user_id,whitelisted)
    MySQL.execute("vRP/set_whitelisted", {user_id = user_id, whitelisted = whitelisted})
end

--- sql
function vRP.getLastLogin(user_id, cbr)
    local task = Task(cbr,{""})
    MySQL.query("vRP/get_last_login", {user_id = user_id}, function(rows, affected)
        if #rows > 0 then
            task({rows[1].last_login})
        else
            task()
        end
    end)
end

function vRP.fetchBanReasonTime(user_id,cbr)
    MySQL.query("vRP/getbanreasontime", {user_id = user_id}, function(rows, affected)
        if #rows > 0 then 
            cbr(rows[1].bantime, rows[1].banreason, rows[1].banadmin)
        end
    end)
end

function vRP.setUData(user_id,key,value)
    MySQL.execute("vRP/set_userdata", {user_id = user_id, key = key, value = value})
end

function vRP.getUData(user_id,key,cbr)
    local task = Task(cbr,{""})
    
    MySQL.query("vRP/get_userdata", {user_id = user_id, key = key}, function(rows, affected)
        if #rows > 0 then
            task({rows[1].dvalue})
        else
            task()
        end
    end)
end

function vRP.setSData(key,value)
    MySQL.execute("vRP/set_srvdata", {key = key, value = value})
end

function vRP.getSData(key, cbr)
    local task = Task(cbr,{""})
    
    MySQL.query("vRP/get_srvdata", {key = key}, function(rows, affected)
        if #rows > 0 then
            task({rows[1].dvalue})
        else
            task()
        end
    end)
end

-- return user data table for vRP internal persistant connected user storage
function vRP.getUserDataTable(user_id)
    return vRP.user_tables[user_id]
end

function vRP.getUserTmpTable(user_id)
    return vRP.user_tmp_tables[user_id]
end

function vRP.isConnected(user_id)
    return vRP.rusers[user_id] ~= nil
end

function vRP.isFirstSpawn(user_id)
    local tmp = vRP.getUserTmpTable(user_id)
    return tmp and tmp.spawns == 1
end

function vRP.getUserId(source)
    if source ~= nil then
        local ids = GetPlayerIdentifiers(source)
        if ids ~= nil and #ids > 0 then
            return vRP.users[ids[1]]
        end
    end
    
    return nil
end

-- return map of user_id -> player source
function vRP.getUsers()
    local users = {}
    for k,v in pairs(vRP.user_sources) do
        users[k] = v
    end
    
    return users
end

-- return source or nil
function vRP.getUserSource(user_id)
    return vRP.user_sources[user_id]
end

function vRP.IdentifierBanCheck(source,user_id,cb)
    for i,v in pairs(GetPlayerIdentifiers(source)) do 
        MySQL.query('vRP/identifier_all', {identifier = v}, function(rows)
            for i = 1,#rows do 
                if rows[i].banned then 
                    if user_id ~= rows[i].user_id then 
                        cb(true, rows[i].user_id)
                    end 
                end
            end
        end)
    end
end

function vRP.BanIdentifiers(user_id, value)
    MySQL.query('vRP/select_identifier_byid_all', {id = user_id}, function(rows)
        for i = 1, #rows do 
            MySQL.execute("vRP/set_identifierbanned", {banned = value, iden = rows[i].identifier })
        end
    end)
end

function vRP.setBanned(user_id,banned,time,reason, admin)
    if banned then 
        MySQL.execute("vRP/set_banned", {user_id = user_id, banned = banned, bantime = time, banreason = reason, banadmin = admin})
        vRP.BanIdentifiers(user_id, true)
        vRP.BanTokens(user_id, true) 
    else 
        MySQL.execute("vRP/set_banned", {user_id = user_id, banned = banned, bantime = "", banreason =  "", banadmin =  ""})
        vRP.BanIdentifiers(user_id, false)
        vRP.BanTokens(user_id, false) 
    end 
end

function vRP.ban(adminsource,permid,time,reason)
    local adminPermID = vRP.getUserId(adminsource)
    local getBannedPlayerSrc = vRP.getUserSource(tonumber(permid))
    if getBannedPlayerSrc then 
        if tonumber(time) then 
            local banTime = os.time()
            banTime = banTime  + (60 * 60 * tonumber(time))  
            vRP.setBanned(permid,true,banTime,reason, GetPlayerName(adminsource) .. " | ID Of Admin: " .. adminPermID)
            vRP.kick(getBannedPlayerSrc,"You have been banned from this server. Your ban expires in: " .. os.date("%c", banTime) .. " Reason: " .. reason .. " | BanningAdmin: " ..  GetPlayerName(adminsource) .. " | ID Of Admin: " .. adminPermID ) 
            vRPclient.notify(adminsource,{"~g~Success banned! User PermID:" .. permid})
        else 
            vRPclient.notify(adminsource,{"~g~Success banned! User PermID:" .. permid})
            vRP.setBanned(permid,true,"perm",reason, GetPlayerName(adminsource) .. " | ID Of Admin: " .. adminPermID)
            vRP.kick(getBannedPlayerSrc,"You have been banned from this server. Your ban expires in: " .. "Never, you've been permanently banned." .. " Reason: " .. reason .. " | BanningAdmin: " ..  GetPlayerName(adminsource) .. " | ID Of Admin: " .. adminPermID ) 
        end
    else 
        if tonumber(time) then 
            local banTime = os.time()
            banTime = banTime  + (60 * 60 * tonumber(time))  
            vRPclient.notify(adminsource,{"~g~Success banned! User PermID:" .. permid})
            vRP.setBanned(permid,true,banTime,reason, GetPlayerName(adminsource) .. " | ID Of Admin: " .. adminPermID)
        else 
            vRPclient.notify(adminsource,{"~g~Success banned! User PermID:" .. permid})
            vRP.setBanned(permid,true,"perm",reason, GetPlayerName(adminsource) .. " | ID Of Admin: " .. adminPermID)
        end
    end
end

-- To use token banning you need the latest artifacts.
function vRP.StoreTokens(source, user_id) 
    if GetNumPlayerTokens then 
        local numtokens = GetNumPlayerTokens(source)
        for i = 1, numtokens do
            local token = GetPlayerToken(source, i)
            MySQL.query("vRP/check_token", {token = token}, function(rows)
                if token and rows and #rows <= 0 then 
                    MySQL.execute("vRP/add_token", {token = token, user_id = user_id})
                end        
            end)
        end
    end
end


function vRP.CheckTokens(source, user_id) 
    if GetNumPlayerTokens then 
        local banned = false;
        local numtokens = GetNumPlayerTokens(source)
        for i = 1, numtokens do
            local token = GetPlayerToken(source, i)
            local rows = MySQL.asyncQuery("vRP/check_token", {token = token, user_id = user_id})
                if #rows > 0 then 
                if rows[1].banned then 
                    return rows[1].banned, rows[1].user_id
                end
            end
        end
    else 
        return false; 
    end
end

function vRP.BanTokens(user_id, banned) 
    if GetNumPlayerTokens then 
        MySQL.query("vRP/check_token_userid", {id = user_id}, function(id)
            for i = 1, #id do 
                MySQL.execute("vRP/ban_token", {token = id[i].token, banned = banned})
            end
        end)
    end
end


function vRP.kick(source,reason)
    DropPlayer(source,reason)
end

-- tasks

function task_save_datatables()
    TriggerEvent("vRP:save")
    
    Debug.pbegin("vRP save datatables")
    for k,v in pairs(vRP.user_tables) do
        vRP.setUData(k,"vRP:datatable",json.encode(v))
    end
    
    Debug.pend()
    SetTimeout(config.save_interval*1000, task_save_datatables)
end
task_save_datatables()

-- handlers

AddEventHandler("playerConnecting",function(name,setMessage, deferrals)
    deferrals.defer()
    
    local source = source
    Debug.pbegin("playerConnecting")
    local ids = GetPlayerIdentifiers(source)
    
    if ids ~= nil and #ids > 0 then
        deferrals.update("[vRP] Checking identifiers...")
        vRP.getUserIdByIdentifiers(ids, function(user_id)
            vRP.IdentifierBanCheck(source, user_id, function(status, id)
                if status then
                    print("[vRP] User rejected for attempting to evade ID: " .. user_id .. " | (Ignore joined message, they were rejected)") 
                    deferrals.done("[vRP]: You are banned from this server, please do not try to evade your ban. If you believe this was an error quote your ID which is: " .. id)
                    return 
                end
            end)
            -- if user_id ~= nil and vRP.rusers[user_id] == nil then -- check user validity and if not already connected (old way, disabled until playerDropped is sure to be called)
            if user_id ~= nil then -- check user validity 
                deferrals.update("[vRP] Fetching Tokens...")
                vRP.StoreTokens(source, user_id) 
                deferrals.update("[vRP] Checking banned...")
                vRP.isBanned(user_id, function(banned)
                    if not banned then
                        deferrals.update("[vRP] Checking whitelisted...")
                        vRP.isWhitelisted(user_id, function(whitelisted)
                            if not config.whitelist or whitelisted then
                                Debug.pbegin("playerConnecting_delayed")
                                if vRP.rusers[user_id] == nil then -- not present on the server, init
                                    if vRP.CheckTokens(source, user_id) then 
                                        deferrals.done("[vRP]: You are banned from this server, please do not try to evade your ban.")
                                    end
                                    vRP.users[ids[1]] = user_id
                                    vRP.rusers[user_id] = ids[1]
                                    vRP.user_tables[user_id] = {}
                                    vRP.user_tmp_tables[user_id] = {}
                                    vRP.user_sources[user_id] = source
                                    
                                    -- load user data table
                                    deferrals.update("[vRP] Loading datatable...")
                                    vRP.getUData(user_id, "vRP:datatable", function(sdata)
                                        local data = json.decode(sdata)
                                        if type(data) == "table" then vRP.user_tables[user_id] = data end
                                        
                                        -- init user tmp table
                                        local tmpdata = vRP.getUserTmpTable(user_id)
                                        
                                        deferrals.update("[vRP] Getting last login...")
                                        vRP.getLastLogin(user_id, function(last_login)
                                            tmpdata.last_login = last_login or ""
                                            tmpdata.spawns = 0
                                            
                                            -- set last login
                                            local ep = vRP.getPlayerEndpoint(source)
                                            local last_login_stamp = ep.." "..os.date("%H:%M:%S %d/%m/%Y")
                                            MySQL.execute("vRP/set_last_login", {user_id = user_id, last_login = last_login_stamp})
                                            
                                            -- trigger join
                                            print("[vRP] "..name.." ("..vRP.getPlayerEndpoint(source)..") joined (user_id = "..user_id..")")
                                            TriggerEvent("vRP:playerJoin", user_id, source, name, tmpdata.last_login)
                                            deferrals.done()
                                        end)
                                    end)
                                else -- already connected
                                    if vRP.CheckTokens(source, user_id) then 
                                        deferrals.done("[vRP]: You are banned from this server, please do not try to evade your ban.")
                                    end
                                    print("[vRP] "..name.." ("..vRP.getPlayerEndpoint(source)..") re-joined (user_id = "..user_id..")")
                                    TriggerEvent("vRP:playerRejoin", user_id, source, name)
                                    deferrals.done()
                                    
                                    -- reset first spawn
                                    local tmpdata = vRP.getUserTmpTable(user_id)
                                    tmpdata.spawns = 0
                                end
                                
                                Debug.pend()
                            else
                                print("[vRP] "..name.." ("..vRP.getPlayerEndpoint(source)..") rejected: not whitelisted (user_id = "..user_id..")")
                                deferrals.done("[vRP] Not whitelisted (user_id = "..user_id..").")
                            end
                        end)
                    else
                        deferrals.update("[vRP] Fetching Tokens...")
                        vRP.StoreTokens(source, user_id) 
                        vRP.fetchBanReasonTime(user_id,function(bantime, banreason, banadmin)
                            if tonumber(bantime) then 
                                local timern = os.time()
                                if timern > tonumber(bantime) then 
                                    deferrals.update('Your ban has expired. Please do not violate this server\'s rules again. You will now be automatically connected!')
                                    Wait(2000)
                                    vRP.setBanned(user_id,false)
                                    if vRP.rusers[user_id] == nil then -- not present on the server, init
                                        -- init entries
                                        vRP.users[ids[1]] = user_id
                                        vRP.rusers[user_id] = ids[1]
                                        vRP.user_tables[user_id] = {}
                                        vRP.user_tmp_tables[user_id] = {}
                                        vRP.user_sources[user_id] = source
                                        
                                        -- load user data table
                                        deferrals.update("[vRP] Loading datatable...")
                                        vRP.getUData(user_id, "vRP:datatable", function(sdata)
                                            local data = json.decode(sdata)
                                            if type(data) == "table" then vRP.user_tables[user_id] = data end
                                            
                                            -- init user tmp table
                                            local tmpdata = vRP.getUserTmpTable(user_id)
                                            
                                            deferrals.update("[vRP] Getting last login...")
                                            vRP.getLastLogin(user_id, function(last_login)
                                                tmpdata.last_login = last_login or ""
                                                tmpdata.spawns = 0
                                                
                                                -- set last login
                                                local ep = vRP.getPlayerEndpoint(source)
                                                local last_login_stamp = ep.." "..os.date("%H:%M:%S %d/%m/%Y")
                                                MySQL.execute("vRP/set_last_login", {user_id = user_id, last_login = last_login_stamp})
                                                
                                                -- trigger join
                                                print("[vRP] "..name.." ("..vRP.getPlayerEndpoint(source)..") joined after his ban expired. (user_id = "..user_id..")")
                                                TriggerEvent("vRP:playerJoin", user_id, source, name, tmpdata.last_login)
                                                deferrals.done()
                                            end)
                                        end)
                                    else -- already connected
                                        print("[vRP] "..name.." ("..vRP.getPlayerEndpoint(source)..") re-joined after his ban expired.  (user_id = "..user_id..")")
                                        TriggerEvent("vRP:playerRejoin", user_id, source, name)
                                        deferrals.done()
                                        
                                        -- reset first spawn
                                        local tmpdata = vRP.getUserTmpTable(user_id)
                                        tmpdata.spawns = 0
                                    end
                                    return 
                                end
                                print("[vRP] "..name.." ("..vRP.getPlayerEndpoint(source)..") rejected: banned (user_id = "..user_id..")")
                                deferrals.done("[vRP] You have been banned from this server.\nYour ban will expire on the: " .. os.date("%c", bantime) .. "\nReason: " .. banreason .. "\n\nBanning Admin: " .. banadmin)
                            else 
                                print("[vRP] "..name.." ("..vRP.getPlayerEndpoint(source)..") rejected: banned (user_id = "..user_id..")")
                                deferrals.done("[vRP] You have been banned from this server.\nYour ban will expire: Never, you have been permanently banned \nReason: " .. banreason .. "\n\nBanning Admin: " .. banadmin)
                            end
                        end)
                    end
                end)
            else
                print("[vRP] "..name.." ("..vRP.getPlayerEndpoint(source)..") rejected: identification error")
                deferrals.done("[vRP] Identification error.")
            end
        end)
    else
        print("[vRP] "..name.." ("..vRP.getPlayerEndpoint(source)..") rejected: missing identifiers")
        deferrals.done("[vRP] Missing identifiers.")
    end
    Debug.pend()
end)

AddEventHandler("playerDropped",function(reason)
    local source = source
    Debug.pbegin("playerDropped")
    
    -- remove player from connected clients
    vRPclient.removePlayer(-1,{source})
    
    
    local user_id = vRP.getUserId(source)
    
    if user_id ~= nil then
        TriggerEvent("vRP:playerLeave", user_id, source)
        
        -- save user data table
        vRP.setUData(user_id,"vRP:datatable",json.encode(vRP.getUserDataTable(user_id)))
        
        print("[vRP] "..vRP.getPlayerEndpoint(source).." disconnected (user_id = "..user_id..")")
        vRP.users[vRP.rusers[user_id]] = nil
        vRP.rusers[user_id] = nil
        vRP.user_tables[user_id] = nil
        vRP.user_tmp_tables[user_id] = nil
        vRP.user_sources[user_id] = nil
    end
    Debug.pend()
end)

RegisterServerEvent("vRPcli:playerSpawned")
AddEventHandler("vRPcli:playerSpawned", function()
    Debug.pbegin("playerSpawned")
    -- register user sources and then set first spawn to false
    local user_id = vRP.getUserId(source)
    local player = source
    if user_id ~= nil then
        vRP.user_sources[user_id] = source
        local tmp = vRP.getUserTmpTable(user_id)
        tmp.spawns = tmp.spawns+1
        local first_spawn = (tmp.spawns == 1)
        
        if first_spawn then
            -- first spawn, reference player
            -- send players to new player
            for k,v in pairs(vRP.user_sources) do
                vRPclient.addPlayer(source,{v})
            end
            -- send new player to all players
            vRPclient.addPlayer(-1,{source})
        end
        
        -- set client tunnel delay at first spawn
        --Tunnel.setDestDelay(player, config.load_delay)
        
        -- show loading
        vRPclient.setProgressBar(player,{"vRP:loading", "botright", "Loading...", 0,0,0, 100})
        
        SetTimeout(600, function() -- trigger spawn event
            TriggerEvent("vRP:playerSpawn",user_id,player,first_spawn)
            
            SetTimeout(config.load_duration*1000, function() -- set client delay to normal delay
                Tunnel.setDestDelay(player, config.global_delay)
                vRPclient.removeProgressBar(player,{"vRP:loading"})
            end)
        end)
    end
    
    Debug.pend()
end)

RegisterServerEvent("vRP:playerDied")
