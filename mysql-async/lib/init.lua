AddEventHandler('onServerResourceStart', function (resource)
    if resource == "mysql-async" then
        MySQL:init()

        TriggerEvent('onMySQLReady')
    end
end)