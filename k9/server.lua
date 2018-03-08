RegisterServerEvent("K9:SendLanguage")
AddEventHandler("K9:SendLanguage", function()
    local s = source
    TriggerClientEvent("K9:UpdateLanguage", s, K9Config.Languages[K9Config.LanguageChoice])
end)

RegisterServerEvent("K9:RequestOpenMenu")
AddEventHandler("K9:RequestOpenMenu", function()
    local src = source
    if K9Config.OpenMenuIdentifierRestriction then
        local foundIdentifier = false
        for a = 1, #K9Config.LicenseIdentifiers do
            if not foundIdentifier then
                if GetPlayerId('license', src) == K9Config.LicenseIdentifiers[a] then
                    foundIdentifier = true
                end
            end
        end
        for b = 1, #K9Config.SteamIdentifiers do
            if not foundIdentifier then
                if GetPlayerId('steam', src) == K9Config.SteamIdentifiers[b] then
                    foundIdentifier = true
                end
            end
        end
        if foundIdentifier then
            TriggerClientEvent("K9:OpenMenu", src, K9Config.OpenMenuPedRestriction, K9Config.PedsList)
            return
        else
            TriggerClientEvent("K9:IdentifierRestricted", src)
        end
    else
        TriggerClientEvent("K9:OpenMenu", src, K9Config.OpenMenuPedRestriction, K9Config.PedsList)
    end
end)

RegisterServerEvent("K9:RequestVehicleToggle")
AddEventHandler("K9:RequestVehicleToggle", function()
    local src = source
    print("Requested Vehicle Toggle")
    TriggerClientEvent("K9:ToggleVehicle", src, K9Config.VehicleRestriction, K9Config.VehiclesList)
end)

RegisterServerEvent("K9:RequestItems")
AddEventHandler("K9:RequestItems", function()
    print("Requested Items")
    local src = source
    TriggerClientEvent("K9:SearchVehicle", src, K9Config.Items, K9Config.OpenDoorsOnSearch)
end)

--[[ Functions ]]--
function GetPlayerId(type, id)
    local identifiers = GetPlayerIdentifiers(id)
    for i = 1, #identifiers do
        if string.find(identifiers[i], type, 1) ~= nil then
            return identifiers[i]
        end
    end
    return false
end