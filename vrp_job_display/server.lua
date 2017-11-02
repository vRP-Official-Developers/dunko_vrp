local Tunnel = module("vrp", "lib/Tunnel")
local Proxy = module("vrp", "lib/Proxy")

vRP = Proxy.getInterface("vRP")
vRPclient = Tunnel.getInterface("vRP","vRP_job_display")

local cfg = module("vrp_job_display", "cfg/display")

-- job display
AddEventHandler("vRP:playerSpawn",function(user_id, source, first_spawn)
  if first_spawn then
    -- add job display
    vRPclient.setDiv(source,{"job",cfg.display_css,vRP.getUserGroupByType({user_id,"job"})})
  end
end)

-- update display
AddEventHandler("vRP:playerJoinGroup", function(user_id, group, gtype)
  local player = vRP.getUserSource({user_id})
  if gtype == "job" then 
	vRPclient.setDivContent(player,{"job",group})
  end
end)