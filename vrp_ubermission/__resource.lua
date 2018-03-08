-- This has been designed to work with my pack, if you're not using my pack and can't get this to work, don't request help.
-- Introduced in vRP (Dunko) V6.6

description "vRP Uber Mission"

dependency "vrp"

client_scripts{ 
  "lib/Tunnel.lua",
  "lib/Proxy.lua",
  "client.lua"
}

server_scripts{ 
  "@vrp/lib/utils.lua",
  '@mysql-async/lib/MySQL.lua',
  "server.lua"
}