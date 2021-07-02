fx_version 'cerulean'
games { 'gta5' }

description "vRP carwash"
--ui_page "ui/index.html"

dependency "vrp"

client_scripts{ 
  "Proxy.lua",
  "client.lua"
}

server_scripts{ 
  "@vrp/lib/utils.lua",
  "server.lua"
}