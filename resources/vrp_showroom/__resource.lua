-- ORIGINALLY BY SIGHMIR --
-- MODIFIED TO WORK & ADDITIONS BY DUNKO --
-- REQUIRES MY MODIFIED vrp_lscustoms & vrp_garages from the Dunko vRP Pack --


description "vRP showroom"

dependency "vrp", "vrp_lscustoms", "vrp_garages"

server_scripts{ 
  "@vrp/lib/utils.lua",
  "server.lua"
}

client_scripts{ 
  "lib/Proxy.lua",
  "client.lua"
}