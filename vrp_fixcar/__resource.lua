
description "vRP Fixcar with permissions"

dependency "vrp"

client_scripts{ 
  "client.lua"
}

server_scripts{ 
  "@vrp/lib/utils.lua",
  "server.lua"
}
