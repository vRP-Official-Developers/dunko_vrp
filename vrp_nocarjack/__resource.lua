
description "vrp_nocarjack"

client_scripts{ 
  "lib/Proxy.lua",
  "lib/Tunnel.lua",
  "cfg/nocarjack.lua",
  "client.lua"
}

server_scripts{ 
  "@vrp/lib/utils.lua",
  "server.lua"
}