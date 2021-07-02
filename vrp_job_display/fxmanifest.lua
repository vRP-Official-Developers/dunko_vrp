fx_version 'cerulean'
games { 'gta5' }

description "vRP job display"
--ui_page "ui/index.html"

dependency "vrp"

server_scripts{ 
  "@vrp/lib/utils.lua",
  "server.lua"
}
