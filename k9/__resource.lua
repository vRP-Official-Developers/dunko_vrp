--[[
    Scripted by: Xander Harrison [X. Cross]
--]]
resource_manifest_version '44febabe-d386-4d18-afbe-5e627f4af937'

ui_page "html/index.html"

files {
    "html/index.html",
    "html/index.css",
    "html/index.js",
    "html/images/test.png",
    "html/images/test2.png",
}

--[[ CONFIG ]]--
server_script 'sv_k9_config.lua'
client_script '@warmenu/warmenu.lua' --REMOVE
--]]

server_script 'version.lua'
server_script 'sv_k9_handler.lua'
client_script 'cl_k9_handler.lua'