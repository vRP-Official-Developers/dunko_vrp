
local cfg = {}

-- define each group with a set of permissions
-- _config property:
--- gtype (optional): used to have only one group with the same gtype per player (example: a job gtype to only have one job)
--- onspawn (optional): function(player) (called when the player spawn with the group)
--- onjoin (optional): function(player) (called when the player join the group)
--- onleave (optional): function(player) (called when the player leave the group)
--- (you have direct access to vRP and vRPclient, the tunnel to client, in the config callbacks)

cfg.groups = {
  ["superadmin"] = {
    _config = {onspawn = function(player) vRPclient.notify(player,{"You are superadmin."}) end},
    "player.group.add",
    "player.group.remove",
    "player.givemoney",
    "player.giveitem"
  },
  ["admin"] = {
    "admin.tickets",
    "admin.announce",
	"admin.menu",
	"admin.easy_unjail",
	"admin.spikes",
	-- "admin.godmode",
	"admin.spawnveh",
	"admin.deleteveh",
	"player.blips",
	"player.tptowaypoint",
    "player.list",
    "player.whitelist",
    "player.unwhitelist",
    "player.kick",
    "player.ban",
    "player.unban",
    "player.noclip",
    "player.custom_emote",
    "player.custom_sound",
    "player.display_custom",
    "player.coords",
    "player.tptome",
	"emergency.revive",
	"emergency.shop",
    "player.tpto"
  },
     -- ["god"] = {
    -- "admin.god" -- reset survivals/health periodically
  -- },
  ["recruiter"] = {
    "player.list",
	"player.group.add",
    "player.group.remove",
    },
  ["mod"] = {
	"admin.tickets",
    "admin.announce",
    "player.list",
    "player.kick",
    "player.coords",
    "player.tptome",
	"emergency.revive",
	"emergency.shop",
    "player.tpto"
  },
  -- the group user is auto added to all logged players
  ["user"] = {
    "player.phone",
    "player.calladmin",
	"player.fix_haircut",
	"player.check",
	--"mugger.mug",
    "police.askid",
    "police.store_weapons",
	"player.store_money",
	"player.check",
	"player.loot",
	"player.player_menu",
	"player.userlist",
    "police.seizable",	-- can be seized
	"user.paycheck"
  },
  ["Fisher"] = {
    _config = { gtype = "job",
	onspawn = function(player) vRPclient.notify(player,{"You are a Fisherman."}) end
	},
	"mission.delivery.fish",
    "fisher.service",
	"fisher.vehicle"
    },
  ["Cargo Pilot"] = {
    _config = { gtype = "job",
	onspawn = function(player) vRPclient.notify(player,{"You are a Cargo Pilot. Salary: $2000."}) end
	},
	"mission.pilot.cargo",
	"pilot.vehicle",
	"pilot.paycheck"
    },
  ["Airline Pilot"] = {
    _config = { gtype = "job",
	onspawn = function(player) vRPclient.notify(player,{"You are Pilot, salary : $2000."}) end
	},
    "airlines.service",
	"air.vehicle",
	"air.paycheck"
  },
  ["Medical Transport"] = {
    _config = { gtype = "job",
	onspawn = function(player) vRPclient.notify(player,{"You now transport Medical weed."}) end
	},
	"mission.delivery.medical",
    "medical.service",
	"medical.vehicle"
    },
  ["Weapons Smuggler"] = {
    _config = { gtype = "job",
	onspawn = function(player) vRPclient.notify(player,{"You are a Weapons Smuggler."}) end
	},
	"mission.weapons.smuggler",
    "smuggler.service"
    },
  ["Police Officer"] = {
    _config = { 
      gtype = "job",
      onjoin = function(player) vRPclient.setCop(player,{true}) end,
      onspawn = function(player) vRPclient.setCop(player,{true}) end,
      onleave = function(player) vRPclient.setCop(player,{true}) end
    },
    "Officer.cloakroom",
	"highway.cloakroom",
    "police.pc",
    --"police.handcuff",
    "police.putinveh",
    "police.getoutveh",
	"police.drag",
	"police.easy_cuff",
	"police.easy_fine",
	"police.easy_jail",
	"police.easy_unjail",
	"police.spikes",
	"police.menu",
    "police.check",
	"toggle.service",
	"police.freeze",
    "police.service",
    "police.wanted",
    "police.seize.weapons",
    "police.seize.items",
    --"police.jail",
    --"police.fine",
    "police.announce",
   -- "-police.store_weapons",
    "-police.seizable",	-- negative permission, police can't seize itself, even if another group add the permission
	"police.vehicle",
	"police.loadshop",
	"cop.whitelisted",
	"emergency.market",
	"emergency.revive",
	"emergency.shop",
	"player.list",
	"police.paycheck",
	"police.mission",
	"player.blips",
	"police.menu_interaction"
  },
  ["Police Detective"] = {  
    _config = { 
      gtype = "job",
      onjoin = function(player) vRPclient.setCop(player,{true}) end,
      onspawn = function(player) vRPclient.setCop(player,{true}) end,
      onleave = function(player) vRPclient.setCop(player,{true}) end
    },
    "Detective.cloakroom",
	"highway.cloakroom",
    "police.pc",
    --"police.handcuff",
    "police.putinveh",
    "police.getoutveh",
    "police.service",
    "police.wanted",
    "police.seize.weapons",
    "police.seize.items",
    --"police.jail",
    --"police.fine",
	"police.drag",
	"police.easy_cuff",
	"police.easy_fine",
	"police.easy_jail",
	"police.easy_unjail",
	"police.spikes",
	"police.menu",
    "police.check",
	"toggle.service",
	"police.freeze",
    "police.announce",
   -- "-police.store_weapons",
    "-police.seizable",	-- negative permission, police can't seize itself, even if another group add the permission
	"police.vehicle",
	"police.loadshop",
	"cop.whitelisted",
	"emergency.market",
	"emergency.revive",
	"emergency.shop",
	"player.list",
	"Detective.paycheck",
	"police.menu_interaction",
	"player.blips",
	"police.mission"
  },
  ["EMS Chief"] = {
    _config = { gtype = "job",
	onspawn = function(player) vRPclient.notify(player,{"You are a EMS Chief, salary : $5000."}) end
	},
    "emergency.revive",
	"police.pc",
	--"police.wanted",
    "emergency.shop",
    "emergency.service",
	"emergency.cloakroom",
	"emergency.vehicle",
	"emergency.market",
	"ems.whitelisted",
	"ems.loadshop",
	"player.list",
	"police.menu_interaction",
	"emsChief.paycheck",
	"player.blips",
	"ems.mission"
  },
  ["EMS Paramedic"] = {
    _config = { gtype = "job",
	onspawn = function(player) vRPclient.notify(player,{"You are a EMS Paramedic, salary : $2000."}) end
	},
    "emergency.revive",
	"police.pc",
	--"police.wanted",
    "emergency.shop",
    "emergency.service",
	"emergency.cloakroom",
	"emergency.vehicle",
	"emergency.market",
	"ems.whitelisted",
	"ems.loadshop",
	"player.list",
	"police.menu_interaction",
	"emsMedic.paycheck",
	"player.blips",
	"ems.mission"
  },
  ["EMS Lieutenant"] = {
    _config = { gtype = "job",
	onspawn = function(player) vRPclient.notify(player,{"You are a EMS Lieutenant, salary : $3000."}) end
	},
    "emergency.revive",
	"police.pc",
	--"police.wanted",
    "emergency.shop",
    "emergency.service",
	"emergency.cloakroom",
	"emergency.vehicle",
	"emergency.market",
	"ems.whitelisted",
	"ems.loadshop",
	"player.list",
	"police.menu_interaction",
	"emsLieutenant.paycheck",
	"player.blips",
	"ems.mission"
  },
  ["EMS Search and Rescue"] = {
    _config = { gtype = "job",
	onspawn = function(player) vRPclient.notify(player,{"You are a EMS Search and Rescue, salary : $2500."}) end
	},
    "emergency.revive",
	"police.pc",
	--"police.wanted",
    "emergency.shop",
    "emergency.service",
	"emergency.cloakroom",
	"emergency.vehicle",
	"emergency.market",
	"ems.whitelisted",
	"ems.loadshop",
	"player.list",
	"police.menu_interaction",
	"emsSearchRescue.paycheck",
	"player.blips",
	"ems.mission"
  },
  ["Mechanic"] = {
    _config = { gtype = "job",
	onspawn = function(player) vRPclient.notify(player,{"You are Mechanic, salary : $2000."}) end
	},
    "vehicle.repair",
    "vehicle.replace",
    "repair.service",
	"mission.repair.satellite_dishes",
	"mission.repair.wind_turbines",
	"repair.vehicle",
	"repair.market",
	"repair.paycheck"
  },
  ["Forger"] = {
    _config = { gtype = "job",
	onspawn = function(player) vRPclient.notify(player,{"You are Forger, go get some credit cards from hackers."}) end
	},
    "fraud.credit_cards",
	"forger.mission"
  },
  ["UBER"] = {
    _config = { gtype = "job",
	onspawn = function(player) vRPclient.notify(player,{"You are UBER, PRESS DEL TO START MISSIONS. Salary : $2000."}) end
	},
    "uber.service",
	"uber.vehicle",
	"uber.mission",
	"uber.paycheck"
  },
 -- ["Gunrunning"] = {
   -- _config = { gtype = "job",
	--onspawn = function(player) vRPclient.notify(player,{"Coming soon, Please wait!"}) end
  --}
--},
  ["Unemployed"] = {
    _config = { gtype = "job",
	onspawn = function(player) vRPclient.notify(player,{"You are Unemployed, go to Department of Jobs."}) end
	},
	"citizen.paycheck"
  },
  ["Delivery"] = {
    _config = { gtype = "job",
	onspawn = function(player) vRPclient.notify(player,{"You are Delivery Driver, Salary : $2000."}) end
	},
	"mission.delivery.food",
	"delivery.vehicle",
	"delivery.paycheck"
  },
  ["Trash Collector"] = {
    _config = { gtype = "job",
	onspawn = function(player) vRPclient.notify(player,{"You are Trash Collector, Salary : $2000."}) end
	},
	"mission.collect.trash", -- mission permission
	"trash.vehicle", -- garage permission
	"trash.paycheck" -- paycheck permission
  },
  ["Lawyer"] = {
    _config = { gtype = "job",
	onspawn = function(player) vRPclient.notify(player,{"You are a Lawyer, Salary : $2000."}) end
	},
	"Lawyer.vehicle",
	"Lawyer.whitelisted",
	"Lawyer.cloakroom",
	"Lawyer.paycheck"
  },
  ["Drug Dealer"] = {
    _config = { gtype = "job",
	    onspawn = function(player) vRPclient.notify(player,{"You are a Drug Dealer."}) end
	  },
    "mission.drugseller.weed",
    "drugseller.market",
    "harvest.weed"
  },
  -- ["Santa"] = {
    -- _config = { gtype = "job",
	    -- onspawn = function(player) vRPclient.notify(player,{"You are Santa, ho ho ho."}) end
	  -- },
    -- "mission.santa", -- What mission Santa has
    -- "santa.vehicle", -- Access to his garage
	-- "santa.paycheck", -- How much santa gets paid per 15 mins
	-- "santa.cloakroom", -- Santa's cloakroom
    -- "harvest.presents" -- What he gathers (item transformers.lua)
  -- },
  ["Hacker"] = {
    _config = { gtype = "job",
	onspawn = function(player) vRPclient.notify(player,{"You are a Hacker."}) end
	},
	"mission.hacker.information",
	"hacker.hack",
	"hacker.credit_cards"
  },
  ["Bankdriver"] = {
    _config = { gtype = "job",
	onspawn = function(player) vRPclient.notify(player,{"You are a Bank Driver. Salary: $2000."}) end
	},
	"mission.bankdriver.moneybank",
	"mission.bankdriver.moneybank2",
	"bankdriver.vehicle",
	"bankdriver.paycheck",
	"bankdriver.money"
  },
  ["Judge"] = {
    _config = { gtype = "job",
	onspawn = function(player) vRPclient.notify(player,{"You are a Judge. Salary : $5000"}) end
	},
	"judge.paycheck",
	"Judge.whitelisted"
  },
  ["Cadet"] = {
    _config = { gtype = "job",
	  onjoin = function(player) vRPclient.setCop(player,{true}) end,
      onspawn = function(player) vRPclient.setCop(player,{true}) end,
      onleave = function(player) vRPclient.setCop(player,{false}) end
	},
	"police.cloakroom",
    "police.putinveh",
    "police.getoutveh",
    "police.service",
    "police.seize.weapons",
	"police.drag",
	"police.easy_cuff",
	"police.easy_fine",
	"police.easy_jail",
	"police.easy_unjail",
	"police.spikes",
	"police.menu",
    "police.check",
	"toggle.service",
	"police.freeze",
    "police.announce",
   -- "-police.store_weapons",
    "-police.seizable",	-- negative permission, police can't seize itself, even if another group add the permission
	"Cadet.vehicle",
	"police.loadshop",
	"cop.whitelisted",
	"Cadet.paycheck",
	"police.menu_interaction",
	"police.mission"
  },
  ["SWAT"] = {
    _config = { gtype = "job",
	  onjoin = function(player) vRPclient.setCop(player,{true}) end,
      onspawn = function(player) vRPclient.setCop(player,{true}) end,
      onleave = function(player) vRPclient.setCop(player,{false}) end
	},
	"SWAT.cloakroom",
    "police.pc",
    --"police.handcuff",
    "police.putinveh",
    "police.getoutveh",
    "police.service",
    "police.wanted",
    "police.seize.weapons",
    "police.seize.items",
    --"police.jail",
	"police.drag",
	"police.easy_cuff",
	"police.easy_fine",
	"police.easy_jail",
	"police.easy_unjail",
	"police.spikes",
	"police.menu",
    "police.check",
	"toggle.service",
	"police.freeze",
    "police.announce",
   -- "-police.store_weapons",
    "-police.seizable",	-- negative permission, police can't seize itself, even if another group add the permission
	"police.vehicle",
	"police.loadshop",
	"emergency.market",
	"emergency.revive",
	"emergency.shop",
	"cop.whitelisted",
	"SWAT.paycheck",
	"police.menu_interaction",
	"police.mission"
  },
  ["Chief of Police"] = {
    _config = { gtype = "job",
	  onjoin = function(player) vRPclient.setCop(player,{true}) end,
      onspawn = function(player) vRPclient.setCop(player,{true}) end,
      onleave = function(player) vRPclient.setCop(player,{false}) end
	},
	"Chief.cloakroom",
    "police.pc",
    --"police.handcuff",
    "police.putinveh",
    "police.getoutveh",
    "police.service",
	"police.drag",
	"police.easy_cuff",
	"police.easy_fine",
	"police.easy_jail",
	"police.easy_unjail",
	"police.spikes",
	"police.menu",
    "police.check",
	"toggle.service",
	"police.freeze",
    "police.wanted",
    "police.seize.weapons",
    "police.seize.items",
    --"police.jail",
    --"police.fine",
    "police.announce",
    --"-police.store_weapons",
    "-police.seizable",	-- negative permission, police can't seize itself, even if another group add the permission
	"police.vehicle",
	"police.loadshop",
	"emergency.market",
	"emergency.revive",
	"emergency.shop",
	"cop.whitelisted",
	"Chief.paycheck",
	"police.menu_interaction",
	"police.mission"
  },
  ["Bounty Hunter"] = {
    _config = { gtype = "job",
	  onjoin = function(player) vRPclient.setCop(player,{true}) end,
      onspawn = function(player) vRPclient.setCop(player,{true}) end,
      onleave = function(player) vRPclient.setCop(player,{false}) end
	},
	"Bounty.cloakroom",
    --"police.handcuff",
    "police.putinveh",
    "police.getoutveh",
	"police.drag",
	"police.easy_cuff",
	"police.easy_fine",
	"police.easy_jail",
	"police.easy_unjail",
	"police.spikes",
	"police.menu",
    "police.check",
	"toggle.service",
	"police.freeze",
    "police.service",
    "police.wanted",
    "Bounty.vehicle",
   -- "-police.store_weapons",
    "-police.seizable",	-- negative permission, police can't seize itself, even if another group add the permission
	"Bounty.vehicle",
	"Bounty.loadshop",
	"police.menu_interaction",
	"cop.whitelisted"
  },
  ["Sheriff"] = {
    _config = { gtype = "job",
	  onjoin = function(player) vRPclient.setCop(player,{true}) end,
      onspawn = function(player) vRPclient.setCop(player,{true}) end,
      onleave = function(player) vRPclient.setCop(player,{false}) end
	},
	"sheriff.cloakroom",
    "police.pc",
    --"police.handcuff",
    "police.putinveh",
    "police.getoutveh",
    "police.service",
	"police.drag",
	"police.easy_cuff",
	"police.easy_fine",
	"police.easy_jail",
	"police.easy_unjail",
	"police.spikes",
	"police.menu",
    "police.check",
	"toggle.service",
	"police.freeze",
    "police.wanted",
    "police.seize.weapons",
    "police.seize.items",
    --"police.jail",
    --"police.fine",
    "police.announce",
   -- "-police.store_weapons",
    "-police.seizable",	-- negative permission, police can't seize itself, even if another group add the permission
	"police.vehicle",
	"police.loadshop",
	"emergency.market",
	"emergency.revive",
	"emergency.shop",
	"cop.whitelisted",
	"sheriff.paycheck",
	"police.menu_interaction",
	"police.mission"
  },
  ["State Trooper"] = {
    _config = { gtype = "job",
	  onjoin = function(player) vRPclient.setCop(player,{true}) end,
      onspawn = function(player) vRPclient.setCop(player,{true}) end,
      onleave = function(player) vRPclient.setCop(player,{false}) end
	},
	 "Commander.cloakroom",
    "police.pc",
    --"police.handcuff",
    "police.putinveh",
    "police.getoutveh",
    "police.service",
    "police.wanted",
    "police.seize.weapons",
	"police.drag",
	"police.easy_cuff",
	"police.easy_fine",
	"police.easy_jail",
	"police.easy_unjail",
	"police.spikes",
	"police.menu",
    "police.check",
	"toggle.service",
	"police.freeze",
    "police.seize.items",
    --"police.jail",
    --"police.fine",
    "police.announce",
    --"-police.store_weapons",
    "-police.seizable",	-- negative permission, police can't seize itself, even if another group add the permission
	"police.vehicle",
	"police.loadshop",
	"emergency.market",
	"emergency.revive",
	"emergency.shop",
	"cop.whitelisted",
	"Commander.paycheck",
	"police.menu_interaction",
	"police.mission"
  },
    ["Deputy Sheriff"] = {
    _config = { gtype = "job",
	  onjoin = function(player) vRPclient.setCop(player,{true}) end,
      onspawn = function(player) vRPclient.setCop(player,{true}) end,
      onleave = function(player) vRPclient.setCop(player,{false}) end
	},
	"Deputy.cloakroom",
    "police.pc",
    --"police.handcuff",
    "police.putinveh",
    "police.getoutveh",
    "police.service",
    "police.wanted",
	"police.drag",
	"police.easy_cuff",
	"police.easy_fine",
	"police.easy_jail",
	"police.easy_unjail",
	"police.spikes",
	"police.menu",
    "police.check",
	"toggle.service",
	"police.freeze",
    "police.seize.weapons",
    "police.seize.items",
    --"police.jail",
    --"police.fine",
    "police.announce",
   -- "-police.store_weapons",
    "-police.seizable",	-- negative permission, police can't seize itself, even if another group add the permission
	"police.vehicle",
	"police.loadshop",
	"emergency.market",
	"emergency.revive",
	"emergency.shop",
	"cop.whitelisted",
	"Deputy.paycheck",
	"police.menu_interaction",
	"police.mission"
  },
      ["Police Captain"] = {
    _config = { gtype = "job",
	  onjoin = function(player) vRPclient.setCop(player,{true}) end,
      onspawn = function(player) vRPclient.setCop(player,{true}) end,
      onleave = function(player) vRPclient.setCop(player,{false}) end
	},
	"Captain.cloakroom",
    "police.pc",
    --"police.handcuff",
    "police.putinveh",
    "police.getoutveh",
    "police.service",
	"police.drag",
	"police.easy_cuff",
	"police.easy_fine",
	"police.easy_jail",
	"police.easy_unjail",
	"police.spikes",
	"police.menu",
    "police.check",
	"toggle.service",
	"police.freeze",
    "police.wanted",
    "police.seize.weapons",
    "police.seize.items",
    --"police.jail",
    --"police.fine",
    "police.announce",
   -- "-police.store_weapons",
    "-police.seizable",	-- negative permission, police can't seize itself, even if another group add the permission
	"police.vehicle",
	"police.loadshop",
	"emergency.market",
	"emergency.revive",
	"emergency.shop",
	"cop.whitelisted",
	"Captain.paycheck",
	"police.menu_interaction",
	"police.mission"
  },
    ["Police Lieutenant"] = {
    _config = { gtype = "job",
	  onjoin = function(player) vRPclient.setCop(player,{true}) end,
      onspawn = function(player) vRPclient.setCop(player,{true}) end,
      onleave = function(player) vRPclient.setCop(player,{false}) end
	},
	"Lieutenant.cloakroom",
    "police.pc",
    --"police.handcuff",
    "police.putinveh",
    "police.getoutveh",
    "police.service",
	"police.drag",
	"police.easy_cuff",
	"police.easy_fine",
	"police.easy_jail",
	"police.easy_unjail",
	"police.spikes",
	"police.menu",
    "police.check",
	"toggle.service",
	"police.freeze",
    "police.wanted",
    "police.seize.weapons",
    "police.seize.items",
    --"police.jail",
    --"police.fine",
    "police.announce",
   -- "-police.store_weapons",
    "-police.seizable",	-- negative permission, police can't seize itself, even if another group add the permission
	"police.vehicle",
	"police.loadshop",
	"emergency.market",
	"emergency.revive",
	"emergency.shop",
	"cop.whitelisted",
	"Lieutenant.paycheck",
	"police.menu_interaction",
	"police.mission"
  },
      ["Police Detective"] = {
    _config = { gtype = "job",
	  onjoin = function(player) vRPclient.setCop(player,{true}) end,
      onspawn = function(player) vRPclient.setCop(player,{true}) end,
      onleave = function(player) vRPclient.setCop(player,{false}) end
	},
	"Detective.cloakroom",
    "police.pc",
    --"police.handcuff",
    "police.putinveh",
    "police.getoutveh",
    "police.service",
	"police.drag",
	"police.easy_cuff",
	"police.easy_fine",
	"police.easy_jail",
	"police.easy_unjail",
	"police.spikes",
	"police.menu",
    "police.check",
	"toggle.service",
	"police.freeze",
    "police.wanted",
    "police.seize.weapons",
    "police.seize.items",
    --"police.jail",
    --"police.fine",
    "police.announce",
   -- "-police.store_weapons",
    "-police.seizable",	-- negative permission, police can't seize itself, even if another group add the permission
	"police.vehicle",
	"police.loadshop",
	"emergency.market",
	"emergency.revive",
	"emergency.shop",
	"cop.whitelisted",
	"Detective.paycheck",
	"police.menu_interaction",
	"police.mission"
  },
    ["Police Sergeant"] = {
    _config = { gtype = "job",
	  onjoin = function(player) vRPclient.setCop(player,{true}) end,
      onspawn = function(player) vRPclient.setCop(player,{true}) end,
      onleave = function(player) vRPclient.setCop(player,{false}) end
	},
	"Sergeant.cloakroom",
    "police.pc",
    --"police.handcuff",
    "police.putinveh",
    "police.getoutveh",
    "police.service",
    "police.wanted",
	"police.drag",
	"police.easy_cuff",
	"police.easy_fine",
	"police.easy_jail",
	"police.easy_unjail",
	"police.spikes",
	"police.menu",
    "police.check",
	"toggle.service",
	"police.freeze",
    "police.seize.weapons",
    "police.seize.items",
    --"police.jail",
    --"police.fine",
    "police.announce",
   -- "-police.store_weapons",
    "-police.seizable",	-- negative permission, police can't seize itself, even if another group add the permission
	"police.vehicle",
	"police.loadshop",
	"emergency.market",
	"emergency.revive",
	"emergency.shop",
	"cop.whitelisted",
	"Sergeant.paycheck",
	"police.menu_interaction",
	"police.mission"
  },
      ["Dispatcher"] = {
    _config = { gtype = "job",
	  onjoin = function(player) vRPclient.setCop(player,{true}) end,
      onspawn = function(player) vRPclient.setCop(player,{true}) end,
      onleave = function(player) vRPclient.setCop(player,{false}) end
	},
    "police.pc",
    "police.check",
    "police.service",
	"police.drag",
	"police.easy_cuff",
	"police.easy_fine",
	"police.easy_jail",
	"police.easy_unjail",
	"police.spikes",
	"police.menu",
    "police.check",
	"toggle.service",
	"police.freeze",
    "police.wanted",
    "police.announce",
   -- "-police.store_weapons",
    "-police.seizable",	-- negative permission, police can't seize itself, even if another group add the permission
	"emergency.market",
	"emergency.revive",
	"emergency.shop",
	"cop.whitelisted",
	"Dispatch.paycheck",
	"police.menu_interaction",
	"police.mission"
  },


  -- ["trafficguard"] = {
    -- _config = { gtype = "job",
	  -- onjoin = function(player) vRPclient.setCop(player,{true}) end,
      -- onspawn = function(player) vRPclient.setCop(player,{true}) end,
      -- onleave = function(player) vRPclient.setCop(player,{false}) end
	-- },
	-- "police.cloakroom",
    -- "police.pc",
    -- "police.handcuff",
    -- "police.putinveh",
    -- "police.getoutveh",
    -- "police.check",
    -- "police.service",
    -- "police.wanted",
    -- "police.seize.weapons",
    -- "police.seize.items",
    -- "police.jail",
    -- "police.fine",
    -- "police.announce",
    -- "-police.store_weapons",
    -- "-police.seizable",	-- negative permission, police can't seize itself, even if another group add the permission
	-- "police.vehicle",
	-- "police.loadshop",
	-- "cop.whitelisted",
	-- "trafficguard.paycheck"
  -- },
  
  
  -- whitelist group for police, emergency and president jobs / add player to this group and user can view the job selection / search in the map
  -- moderator=president / president is guy from the server give a player group cop ems moderator when admin is offline / sallary : $10.000
  ["cop"] = {
    "cop.whitelisted"
  },
  ["Exotic Car Dealer"] = {
   	_config = { gtype = "job",
	  onspawn = function(player) vRPclient.notify(player,{"You are an Exotic Car Dealer"}) end
	},
	"exotic.whitelisted",
    "exotic.vehicle",
    "player.group.add",
    "player.group.remove",
    "player.list"
  },
  ["buyer"] = {  
    "exotic.vehicle"
  },
  ["ems"] = {  
    "ems.whitelisted"
  },
  ["moderator"] = {
    "president.whitelisted"
  }
}

-- groups are added dynamically using the API or the menu, but you can add group when an user join here
cfg.users = {
  [1] = { -- give superadmin and admin group to the first created user on the database
    "superadmin",
    "admin",
	"recruiter"
  }
}

-- group selectors
-- _config
--- x,y,z, blipid, blipcolor, permissions (optional)

cfg.selectors = {
  ["Job Selector"] = {
    _config = {x = -268.363739013672, y = -957.255126953125, z = 31.22313880920410, blipid = 351, blipcolor = 47},
    "UBER",
    "Mechanic",
	"Delivery",
	"Bankdriver",
	"Fisher",
	"Medical Transport",
    "Unemployed"
  },
  ["Police job"] = { -- Alta Street
    _config = {x = 447.35137939453, y = -975.57592773438, z = 30.689584732056, blipid = 351, blipcolor = 38, permissions = {"cop.whitelisted"} },
	"State Trooper",
	"Police Captain",
	"Police Lieutenant",
	"Police Detective",
	"Police Sergeant",
	"Sheriff",
	"Deputy Sheriff",
	"Police Officer",
	"Dispatcher",
	"Cadet",
	"SWAT",
	"Unemployed"
    },
  ["Police job 2"] = { -- Sandy Shores
    _config = {x = 1857.5961914063, y = 3688.8952636719, z = 34.267040252686, blipid = 351, blipcolor = 38, permissions = {"cop.whitelisted"} },
	"State Trooper",
	"Police Captain",
	"Police Lieutenant",
	"Police Detective",
	"Police Sergeant",
	"Sheriff",
	"Deputy Sheriff",
	"Police Officer",
	"Dispatcher",
	"Cadet",
	"SWAT",
	"Unemployed"
    },
  ["Police job 3"] = { -- Paleto Bay
    _config = {x = -449.00927734375, y = 6017.1953125, z = 31.716377258301, blipid = 351, blipcolor = 38, permissions = {"cop.whitelisted"} },
	"State Trooper",
	"Police Captain",
	"Police Lieutenant",
	"Police Detective",
	"Police Sergeant",
	"Sheriff",
	"Deputy Sheriff",
	"Police Officer",
	"Dispatcher",
	"Cadet",
	"SWAT",
	"Unemployed"
    },
  ["Emergency job"] = { -- Spawn Hospital
    _config = {x =  249.50639343262, y = -1375.0694580078, z = 39.534378051758, blipid = 351, blipcolor = 3, permissions = {"ems.whitelisted"} },
    "EMS Chief",
    "EMS Lieutenant",
    "EMS Search and Rescue",
	"EMS Paramedic",
	"Unemployed"
  },
  ["Lawyer"] = {
    _config = {x = -1911.9273681641, y = -569.71649169922, z = 19.097215652466, blipid = 351, blipcolor = 7, permissions = {"Lawyer.whitelisted"} },
    "Lawyer",
	"Unemployed"
  },
  ["drugseller job"] = {
    _config = {x = 1865.1586914063, y = 3749.4343261719, z = 33.046268463135, blipid = 277, blipcolor = 4},
    "Drug Dealer",
    "Unemployed"
  },
  ["Smuggler job"] = {
    _config = {x = 283.10546875, y = 6788.7104492188, z = 15.695198059082, blipid =  150, blipcolor = 4},
    "Weapons Smuggler",
    "Unemployed"
  },
  ["Airline Pilot"] = {
    _config = {x = -759.6591796875, y = -1515.3978271484, z = 4.9768991470337, blipid =  307, blipcolor = 4},
	"Airline Pilot",
    "Unemployed"
  },
  ["Cargo Pilot"] = {
    _config = {x = -928.89624023438, y = -2937.396484375, z = 13.945074081421,blipid = 472, blipcolor = 4},
	"Cargo Pilot",
    "Unemployed"
  },
  ["Trash Collector"] = {
    _config = {x = 750.05029296875, y = -1402.9224853516, z = 26.549806594849,blipid = 318, blipcolor = 2}, -- Job starts here
	"Trash Collector",
    "Unemployed"
  },
  ["Judge"] = {
    _config = {x = -59.127178192139, y = 359.25082397461, z = 113.05643463135, blipid = 351, blipcolor = 7, permissions = {"Judge.whitelisted"} },
    "Judge",
	"Unemployed"
  },
  ["Forger"] = {
    _config = {x = 388.61703491211, y = 3587.1179199219, z = 33.292263031006, blipid = 472, blipcolor = 4},
    "Forger",
	"Unemployed"
  },
  ["Hacker job"] = {
    _config = {x = 705.682189941406, y = -966.919067382813, z = 30.3953418731689, blipid = 472, blipcolor = 4},
    "Hacker",
    "Unemployed"
  }
  
}

return cfg

