local lang = vRP.lang
local LootBagEntities = {}
-- YOU MUST HAVE ONESYNC ENABLED THIS IS NOT AN OPTION!


--[[
    QUICK LOOTBAGS MADE BY JAMESUK MAY CONTAIN BUGS. JAMESUK DOES NOT GURANTEE THIS SCRIPT TO BE BUG FREE.
    Also, awful code design as was quickly created will be revamped in the rewrite of Dunko vRP.
]]



function tvRP.Coma()
    local source = source
    if vRPConfig.LootBags then
        Wait(3000) -- wait delay for death.
        local user_id = vRP.getUserId(source)
        local model = GetHashKey('prop_cs_heist_bag_01')
        local name1 = GetPlayerName(source)
        local lootbag = CreateObjectNoOffset(model, GetEntityCoords(GetPlayerPed(source)) + 0.4, true, true, false)
        local lootbagnetid = NetworkGetNetworkIdFromEntity(lootbag)
        LootBagEntities[lootbagnetid] = {lootbag, lootbag, false, source}
        LootBagEntities[lootbagnetid].Items = {}
        LootBagEntities[lootbagnetid].name = name1 
        local ndata = vRP.getUserDataTable(user_id)
        local stored_inventory = nil;
        if ndata ~= nil then
            if ndata.inventory ~= nil then
                stored_inventory = ndata.inventory
                vRP.clearInventory(user_id)
                for k, v in pairs(stored_inventory) do
                    LootBagEntities[lootbagnetid].Items[k] = {}
                    LootBagEntities[lootbagnetid].Items[k].amount = v.amount
                end
            end
        end
    end
end

if vRPConfig.LootBags then 
    RegisterNetEvent('vRP:LootBag')
    AddEventHandler('vRP:LootBag', function(netid)
        local source = source
        if LootBagEntities[netid] and not LootBagEntities[netid][3] and #(GetEntityCoords(LootBagEntities[netid][1]) - GetEntityCoords(GetPlayerPed(source))) < 2.0 then
            LootBagEntities[netid][3] = true;
            local user_id = vRP.getUserId(source)
            if user_id ~= nil then
                LootBagEntities[netid][5] = source
                OpenInv(source, netid, LootBagEntities[netid].Items)
                if vRPConfig.DisplayNamelLootbag then
                    vRPclient.notify(source,{"~g~You have opened " .. LootBagEntities[netid].name .. "'s lootbag"})
                end
            end
        else
            vRPclient.notify(source, {'~r~This loot bag is already being looted.'})
        end
    end)

    Citizen.CreateThread(function()
        while true do 
            Wait(250)
            for i,v in pairs(LootBagEntities) do 
                if v[5] then 
                    local coords = GetEntityCoords(GetPlayerPed(v[5]))
                    local objectcoords = GetEntityCoords(v[1])
                    if #(objectcoords - coords) > 2.0 then
                        vRP.closeMenu(v[5])
                        Wait(3000)
                        v[3] = false; 
                        v[5] = nil;
                    end
                end
            end
        end
    end)

    -- Garabge collector for empty lootbags.
    Citizen.CreateThread(function()
        while true do 
            Wait(60000)
            for i,v in pairs(LootBagEntities) do 
                local itemCount = 0;
                for i,v in pairs(v.Items) do
                    itemCount = itemCount + 1
                end
                if itemCount == 0 then
                    if DoesEntityExist(v[1]) then 
                        DeleteEntity(v[1])
                        print('Deleted Lootbag')
                        LootBagEntities[i] = nil;
                    end
                end
            end
            --print('All Lootbag garbage collected.')
        end
    end)





    -- awful vrp inventory system below. This is awful can be improved if I ever decide to make an inventory..
    local function build_itemlist_menu(name, items, cb)
        local menu = {
            name = name,
            css = {
                top = "75px",
                header_color = "rgba(0,255,125,0.75)"
            }
        }

        local kitems = {}

        -- choice callback
        local choose = function(player, choice)
            local idname = kitems[choice]
            if idname then
                cb(idname)
            end
        end

        -- add each item to the menu
        for k, v in pairs(items) do
            local name, description, weight = vRP.getItemDefinition(k)
            if name ~= nil then
                kitems[name] = k -- reference item by display name
                menu[name] = {choose, lang.inventory.iteminfo({v.amount, description, string.format("%.2f", weight)})}
            end
        end

        return menu
    end

    function OpenInv(source, netid, items)
        -- open menu
        local refreshing = false;
        local user_id = vRP.getUserId(source)
        local menu = {
            name = lang.inventory.chest.title(),
            css = {
                top = "75px",
                header_color = "rgba(0,255,125,0.75)"
            }
        }
        local RefreshMenu = nil;
        local cb_take = function(idname)
            local citem = LootBagEntities[netid].Items[idname]
            if not citem or citem.amount <= 0 then
                LootBagEntities[netid].Items[idname] = nil 
                return;
            end
            vRP.prompt(source, lang.inventory.chest.take.prompt({citem.amount}), "", function(player, amount)
                amount = parseInt(amount)
                if amount >= 0 and amount <= citem.amount then
                    local new_weight = vRP.getInventoryWeight(user_id) + vRP.getItemWeight(idname) * amount
                    if new_weight <= vRP.getInventoryMaxWeight(user_id) then
                        vRP.giveInventoryItem(user_id, idname, amount, true)
                        citem.amount = citem.amount - amount
                        if citem.amount <= 0 then
                            LootBagEntities[netid].Items[idname] = nil 
                        end
                        if cb_out then
                            cb_out(idname, amount)
                        end
                        refreshing = true;
                        RefreshMenu(netid, source)
                        vRP.closeMenu(player)
                    else
                        vRPclient.notify(source, {lang.inventory.full()})
                    end
                else
                    vRPclient.notify(source, {lang.common.invalid_value()})
                end
            end)
        end

        local ch_take = function(player, choice)
            local submenu = build_itemlist_menu(lang.inventory.chest.take.title(), LootBagEntities[netid].Items, cb_take)
            local weight = vRP.computeItemsWeight(LootBagEntities[netid].Items)
            local hue = math.floor(math.max(125 * (1 - weight / 30), 0))
            submenu["<div class=\"dprogressbar\" data-value=\"" .. string.format("%.2f", weight / 30) ..
                "\" data-color=\"hsl(" .. hue .. ",100%,50%)\" data-bgcolor=\"hsl(" .. hue ..
                ",100%,25%)\" style=\"height: 12px; border: 3px solid black;\"></div>"] =
                {function()
                end, lang.inventory.info_weight({string.format("%.2f", weight), 30})}

            submenu.onclose = function()
                vRP.openMenu(player, menu)
            end
            vRP.openMenu(player, submenu)
        end
        local submenu2 = build_itemlist_menu('LootBag', LootBagEntities[netid].Items, cb_take)
        RefreshMenu = function(netid, player)
            vRP.closeMenu(source)
            local items = 0;
            for k, v in pairs(LootBagEntities[netid].Items) do
                local name, description, weight = vRP.getItemDefinition(k)
                if submenu2[name] then 
                    submenu2[name][2] = lang.inventory.iteminfo({v.amount, description, string.format("%.2f", weight)})
                end
                items = items + 1
            end
            if items == 0 then 
                vRP.closeMenu(source)
                return 
            end
            vRP.openMenu(source, submenu2)
            submenu2.onclose = function()
                if not refreshing then 
                    LootBagEntities[netid][3] = false;
                    LootBagEntities[netid][5] = nil;
                else 
                    submenu2 = build_itemlist_menu('LootBag', LootBagEntities[netid].Items, cb_take)
                    vRP.openMenu(player, submenu2)
                    refreshing = false    
                end 
            end
        end
        vRP.openMenu(source, submenu2)
    end
end
