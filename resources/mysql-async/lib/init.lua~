AddEventHandler('onServerResourceStart', function (resource)
    if resource == "mysql-async" then
        exports['mysql-async']:mysql_configure()

        Citizen.CreateThread(function ()
            Citizen.Wait(0)
            TriggerEvent('onMySQLReady')
        end)
    end
end)


