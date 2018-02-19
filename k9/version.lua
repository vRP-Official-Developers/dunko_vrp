--[[ Version Checker ]]--
local version = 2


AddEventHandler("onResourceStart", function(resource)
    if resource == GetCurrentResourceName() then
        CheckFrameworkVersion()
    end
end)

function CheckFrameworkVersion()
    PerformHttpRequest("http://xcross.nn.pe/versions/k9_version.txt", function(err, text, headers)
    
        if text == tostring(version) then
            print(" ")
            print("---------- K9 VERSION ----------")
            print("K9 Script Updated and ready to go!")
            print("--------------------------------")
        else
            print(" ")
            print("---------- K9 VERSION ----------")
            print("K9 Script is outdated. Maybe look into updating?")
            print("--------------------------------")
        end
    
    end, 'GET', '', {})

end