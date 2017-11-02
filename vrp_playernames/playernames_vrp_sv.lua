-- load vRP dependencies
local Proxy = module("vrp", "lib/Proxy")
local vRP = Proxy.getInterface("vRP")

-- store identities for each player
local identities = {}

-- the event!
AddEventHandler('playernames:extendContext', function(id, cb)
    id = tonumber(id)

    if not identities[id] then return end

    -- the cb adds to the context
    for k, v in pairs(identities[id]) do
        cb(k, v)
    end
end)

-- on-join event to set the source's identity
AddEventHandler("vRP:playerJoin", function(user_id,source,name,last_login)
    vRP.getUserIdentity({user_id, function(identity)
        identities[source] = identity
    end})
end)

-- for resource reloading
RegisterNetEvent('playernamvrp:getIdentity')

AddEventHandler('playernamvrp:getIdentity', function()
    local id = source

    local user_id = vRP.getUserId({id})

    vRP.getUserIdentity({user_id, function(identity)
        identities[id] = identity
    end})
end)