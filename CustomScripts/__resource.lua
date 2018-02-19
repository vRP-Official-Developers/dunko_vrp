-- server scripts
server_scripts{ 
  "deletepoliceweapons-server.lua",
  "me-server.lua",
  "ooc-server.lua",
  "deathmessages-server.lua",
  -- "deletevehicle-server.lua",
  "weathersync-server.lua",
  -- "fix-server.lua",
  "dispatch-server.lua"
}

-- client scripts
client_scripts{
  "crouch-client.lua",
  "pointfinger-client.lua",
  "handsup-client.lua",
  "stopwanted-client.lua",
  "deletepoliceweapons-client.lua",
  "deathmessages-client.lua",
  "gameui-client.lua",
  --"names-client.lua",
  -- "deletevehicle-client.lua",
  "weathersync-client.lua",
  -- "fix-client.lua",
  "missiontext-client.lua",
  "noweapondrops-client.lua"
 }
 
  exports {
    'getSurrenderStatus',
}