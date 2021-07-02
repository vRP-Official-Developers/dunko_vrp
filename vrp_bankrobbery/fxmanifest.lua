fx_version 'cerulean'
games { 'gta5' }

description "vRP Bank Robberies by Lee Fall - Edited by Dunko"
--ui_page "ui/index.html"

dependency "vrp"

client_scripts{ 
  "client.lua"
}

server_scripts{ 
  "@vrp/lib/utils.lua",
  "server.lua"
}
