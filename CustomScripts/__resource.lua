-- server scripts
server_scripts{ 
  "@vrp/lib/utils.lua",
  "deletepoliceweapons-server.lua",
  "commands-server.lua",
  "deathmessages-server.lua",
  "weathersync-server.lua",
  "dispatch-server.lua"
}

-- client scripts
client_scripts{
  "cfg/config.lua",
  "crouch-client.lua",
  "pointfinger-client.lua",
  "handsup-client.lua",
  "stopwanted-client.lua",
  "deletepoliceweapons-client.lua",
  "deathmessages-client.lua",
  "gameui-client.lua",
  "weathersync-client.lua",
  "missiontext-client.lua",
  "noweapondrops-client.lua"
 }
 
  exports {
    'getSurrenderStatus',
}