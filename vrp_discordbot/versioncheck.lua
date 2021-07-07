-- This package is part of the vrp package and so the version of vrp will change when this is updated. 



--[[

    WAIT BEFORE YOU REMOVE THE CREDITS THINK ABOUT ALL THE HARDWORK THAT HAS GONE INTO THIS! 

    DEVELOPERS EVERY DAY HAVE THEIR WORK STOLEN OR CLAIMED BY OTHERS.

    IT'S TIME FOR CHANGE. PEOPLE WILL JUST STOP RELEASING THINGS IF YOU STEAL THEIR WORK. 

    - JamesUK#6793
]]


print("[^1JamesUK Discord Bot^7]: " .. 'Checking for vRP Discord Bot Updates..')
local version = module("vrp_discordbot", "version")
PerformHttpRequest("https://raw.githubusercontent.com/JamesEU/dunko_vrp/master/vrp_discordbot/version.lua",function(err,text,headers)
if err == 200 then
    text = string.gsub(text,"return ","")
    local r_version = tonumber(text)
    if version ~= r_version then
        print("[^1JamesUK Discord Bot^7]:" .. 'A vRP Discord Bot Update is available from: https://github.com/DunkoUK/dunko_vrp')
    else 
        print("[^1JamesUK Discord Bot^7]: " .. 'You are running the most up to date JamesUK vRP Bot Version. Thanks for using Jam_e_s_U_K bot and thanks to our contributors for updating the project. Support Found At: https://discord.gg/b8wQn2XqDt')
    end
else
    print("[vRP] unable to check the remote version")
end
end, "GET", "")
