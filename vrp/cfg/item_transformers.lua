
local cfg = {}

-- define static item transformers
-- see https://github.com/ImagicTheCat/vRP to understand the item transformer concept/definition

cfg.item_transformers = {
  -- example of harvest item transformer
    {
    name="Fishing", -- menu name
    permissions = {"mission.delivery.fish"}, -- you can add permissions
    r=0,g=125,b=255, -- color
    max_units=100000,
    units_per_minute=100000,
    x=743.19586181641,y=3895.3967285156,z=30.5, 
    radius=3, height=1.5, -- area
    recipes = {
      ["Catch some Catfish"] = { -- action name
        description="Trying to catch some Catfish", -- action description
        in_money=0, -- money taken per unit
        out_money=0, -- money earned per unit
        reagents={}, -- items taken per unit
        products={ -- items given per unit
          ["catfish"] = 1
        }
      },
      ["Catch some Bass"] = { -- action name
        description="Trying to catch some Bass", -- action description
        in_money=0, -- money taken per unit
        out_money=0, -- money earned per unit
        reagents={}, -- items taken per unit
        products={ -- items given per unit
          ["bass"] = 1
        }
      }
    }
  },
       {
    name="Trash Collector", -- menu name
    permissions = {"mission.collect.trash"}, -- you can add permissions
    r=0,g=125,b=255, -- color
    max_units=100000,
    units_per_minute=100000,
    x=805.77130126953,y=-1078.0639648438,z=28.55744934082,
    radius=3, height=1.5, -- area
    recipes = {
      ["Gather Trash"] = { -- action name
        description="Gathering Trash...", -- action description
        in_money=0, -- money taken per unit
        out_money=0, -- money earned per unit
        reagents={}, -- items taken per unit
        products={ -- items given per unit
          ["trash"] = 1
        }
      }
    }
  },
      {
    name="Weapons Smuggler", -- menu name
    permissions = {"mission.weapons.smuggler"}, -- you can add permissions
    r=0,g=125,b=255, -- color
    max_units=100000,
    units_per_minute=100000,
    x=-343.28500366211,y=6098.6586914063,z=31.327739715576,
    radius=3, height=1.5, -- area
    recipes = {
      ["Gather AK's"] = { -- action name
        description="Grabbing AK's", -- action description
        in_money=0, -- money taken per unit
        out_money=0, -- money earned per unit
        reagents={}, -- items taken per unit
        products={ -- items given per unit
          ["AK47"] = 1
        }
      },
      ["Gather M4A1"] = { -- action name
        description="Grabbing M4's", -- action description
        in_money=0, -- money taken per unit
        out_money=0, -- money earned per unit
        reagents={}, -- items taken per unit
        products={ -- items given per unit
          ["M4A1"] = 1
        }
      }
    }
  },
      {
    name="Medical Transport", -- menu name
    permissions = {"mission.delivery.medical"}, -- you can add permissions
    r=0,g=125,b=255, -- color
    max_units=100000,
    units_per_minute=100000,
    x=2213.0520019531,y=5577.5981445313,z=53.795757293701,
    radius=3, height=1.5, -- area
    recipes = {
      ["Gather Medical Weed"] = { -- action name
        description="Gathering Medical Weed", -- action description
        in_money=0, -- money taken per unit
        out_money=0, -- money earned per unit
        reagents={}, -- items taken per unit
        products={ -- items given per unit
          ["Medical Weed"] = 1
        }
      }
	 }
  },
 -- {
    -- name="Santa's Workshop", -- menu name
    -- permissions = {"harvest.presents"}, -- you can add permissions
    -- r=0,g=125,b=255, -- color
    -- max_units=100000,
    -- units_per_minute=2,
    -- x=2213.0520019531,y=5577.5981445313,z=53.795757293701, -- UPDATE THIS
    -- radius=3, height=1.5, -- area
    -- recipes = {
      -- ["Gather Presents"] = { -- action name
        -- description="Gathering Presents", -- action description
        -- in_money=0, -- money taken per unit
        -- out_money=0, -- money earned per unit
        -- reagents={}, -- items taken per unit
        -- products={ -- items given per unit
          -- ["Presents"] = 1
        -- }
      -- }
	 -- }
  -- },
  {
    name="Water bottles/tacos tree", -- menu name
    -- permissions = {"harvest.water_bottle_tacos"}, -- you can add permissions
    r=0,g=125,b=255, -- color
    max_units=100000,
    units_per_minute=100000,
    x=-1692.6646728516,y=-1086.3079833984,z=13.152559280396, -- pos
    radius=5, height=1.5, -- area
    recipes = {
      ["Harvest water"] = { -- action name
        description="Harvest some water bottles.", -- action description
        in_money=0, -- money taken per unit
        out_money=0, -- money earned per unit
        reagents={}, -- items taken per unit
        products={ -- items given per unit
          ["water"] = 1
        }
      },
      ["Harvest tacos"] = { -- action name
        description="Harvest some tacos.", -- action description
        in_money=0, -- money taken per unit
        out_money=0, -- money earned per unit
        reagents={}, -- items taken per unit
        products={ -- items given per unit
          ["tacos"] = 1
        }
      }
    }
    --, onstart = function(player,recipe) end, -- optional start callback
    -- onstep = function(player,recipe) end, -- optional step callback
    -- onstop = function(player,recipe) end -- optional stop callback
  },
  {
    name="Body training", -- menu name
    r=255,g=125,b=0, -- color
    max_units=100000,
    units_per_minute=1,
    x=-1202.96252441406,y=-1566.14086914063,z=4.61040639877319,
    radius=7.5, height=1.5, -- area
    recipes = {
      ["Strength"] = { -- action name
        description="Increase your strength.", -- action description
        in_money=0, -- money taken per unit
        out_money=0, -- money earned per unit
        reagents={}, -- items taken per unit
        products={}, -- items given per unit
        aptitudes={ -- optional
          ["physical.strength"] = 0.2 -- "group.aptitude", give 1 exp per unit
        }
      }
    }
  },
  {
    name="Hacker", -- menu name
	permissions = {"hacker.credit_cards"}, -- you can add permissions
    r=255,g=125,b=0, -- color
    max_units=100000,
    units_per_minute=100000,
    x=707.357238769531,y=-966.98876953125,z=30.4128551483154,
    radius=2, height=1.0, -- area
    recipes = {
      ["hacking"] = { -- action name
        description="Hacking credit cards.", -- action description
        in_money=0, -- money taken per unit
        out_money=0, -- money earned per unit
        reagents={}, -- items taken per unit
        products={
		["credit"] = 1,
		["dirty_money"] = 1
		}, -- items given per unit
        aptitudes={ -- optional
          ["hacker.hacking"] = 0.2 -- "group.aptitude", give 1 exp per unit
        }
      }
    }
  },
  {
    name="Forger", -- menu name
	permissions = {"fraud.credit_cards"}, -- you can add permissions
    r=255,g=125,b=0, -- color
    max_units=100000,
    units_per_minute=100000,
    x=1272.7305908203,y=-1711.9899902344,z=54.771453857422,
    radius=2, height=1.0, -- area
    recipes = {
      ["Forging"] = { -- action name
        description="Forging fake ID's", -- action description
        in_money=0, -- money taken per unit
        out_money=0, -- money earned per unit
        reagents={
		["credit"] = 1
		}, -- items taken per unit
        products={
		["fake_id"] = 1
		}, -- items given per unit
        aptitudes={}
      }
    }
  },
  {
    name="Driver License", -- menu name
    r=255,g=125,b=0, -- color
    max_units=1,
    units_per_minute=1,
    x=-261.40533447266,y=-965.15747070313,z=31.224115371704,        
    radius=2, height=1.0, -- area
    recipes = {
      ["Driver"] = { -- action name
       description="Buy a Driver License.", -- action description`
        in_money=150, -- money taken per unit
        out_money=0, -- money earned per unit
        reagents={}, -- items taken per unit
        products={
		["driver"] = 1
		}, -- items given per unit
        aptitudes={} -- optional
      }
    }
  },
  {
    name="Bank Driver Mission", -- menu name
	permissions = {"bankdriver.money"}, -- you can add permissions
    r=255,g=125,b=0, -- color
    max_units=1,
    units_per_minute=1,
    x=236.87298583984,y=217.09535217285,z=106.28678894043,
    radius=2, height=1.0, -- area
    recipes = {
      ["Bank Money"] = { -- action name
       description="Get a money bank for mission.", -- action description
        in_money=0, -- money taken per unit
        out_money=0, -- money earned per unit
        reagents={}, -- items taken per unit
        products={
		["bank_money"] = 500000
		}, -- items given per unit
        aptitudes={} -- optional
      }
    }
  },
  {
    name="Collect Cargo", -- menu name
	permissions = {"mission.pilot.cargo"}, -- you can add permissions
    r=255,g=125,b=0, -- color
    max_units=100000,
    units_per_minute=100000,
    x=1618.9204101563,y=3227.7058105469,z=40.411529541016,
    radius=2, height=1.0, -- area
    recipes = {
      ["Cargo"] = { -- action name
       description="Collecting Cargo...", -- action description
        in_money=0, -- money taken per unit
        out_money=0, -- money earned per unit
        reagents={}, -- items taken per unit
        products={
		["cargo"] = 1
		}, -- items given per unit
        aptitudes={} -- optional
      }
    }
  },
 -- {
   -- name="Robbery Bank", -- menu name
   -- r=255,g=125,b=0, -- color
   -- max_units=600,
   -- units_per_minute=1,
   -- x=265.94982910156,y=213.54983520508,z=101.68338775635,
   -- radius=2, height=1.0, -- area
   -- recipes = {
     -- ["Bank Money"] = { -- action name
      -- description="get the money.", -- action description
       -- in_money=0, -- money taken per unit
       -- out_money=0, -- money earned per unit
      --  reagents={}, -- items taken per unit
      --  products={
	--	["dirty_money"] = 0
	--	}, -- items given per unit
       -- aptitudes={} -- optional
     -- }
   -- }
 -- },
  {
    name="Drug Lab", -- menu name
	permissions = {"harvest.weed"}, -- job drug dealer required to use
    r=0,g=255,b=0, -- color
    max_units=100000,
    units_per_minute=100000,
    x=-77.722381591797,y=6223.626953125,z=31.089864730835, -- pos (needed for public use lab tools)
    radius=1.1, height=1.5, -- area
    recipes = {
      ["cocaine"] = { -- action name
        description="make cocaine", -- action description
        in_money=500, -- money taken per unit
        out_money=0, -- money earned per unit
        reagents={ -- items taken per unit
          ["benzoilmetilecgonina"] = 1
        },
        products={ -- items given per unit
          ["cocaine"] = 3
        },
        aptitudes={ -- optional
          ["laboratory.cocaine"] = 3, -- "group.aptitude", give 1 exp per unit
          ["science.chemicals"] = 6
        }
      },
      ["weed"] = { -- action name
        description="make weed", -- action description
        in_money=500, -- money taken per unit
        out_money=0, -- money earned per unit
        reagents={ -- items taken per unit
          ["seeds"] = 1
        },
        products={ -- items given per unit
          ["weed"] = 3
        },
        aptitudes={ -- optional
          ["laboratory.weed"] = 3, -- "group.aptitude", give 1 exp per unit
          ["science.chemicals"] = 6
        }
      },
      ["lsd"] = { -- action name
          description="make lsd", -- action description
          in_money=500, -- money taken per unit
          out_money=0, -- money earned per unit
          reagents={ -- items taken per unit
            ["harness"] = 1
          },
          products={ -- items given per unit
            ["lsd"] = 3
          },
          aptitudes={ -- optional
            ["laboratory.lsd"] = 3, -- "group.aptitude", give 1 exp per unit
            ["science.chemicals"] = 6
          }
        }
      }
    }
}

-- define transformers randomly placed on the map
cfg.hidden_transformers = {
  ["weed field"] = {
    def = {
      name="Weed field", -- menu name
      permissions = {"harvest.weed"}, -- you can add permissions
      r=0,g=200,b=0, -- color
      max_units=100000,
      units_per_minute=100000,
      x=0,y=0,z=0, -- pos
      radius=5, height=1.5, -- area
      recipes = {
        ["Harvest"] = { -- action name
          description="Harvest some drugs.", -- action description
          in_money=0, -- money taken per unit
          out_money=0, -- money earned per unit
          reagents={}, -- items taken per unit
          products={ -- items given per unit
            ["seeds"] = 1
          }
        }
      }
    },
    positions = {
      {2208.0104980469,5577.6987304688,53.739212036133}
    }
  },
  ["cocaine dealer"] = {
    def = {
      name="Cocaine Dealer", -- menu name
      permissions = {"harvest.weed"}, -- you can add permissions
      r=0,g=200,b=0, -- color
      max_units=100000,
      units_per_minute=100000,
      x=0,y=0,z=0, -- pos
      radius=5, height=1.5, -- area
      recipes = {
        ["Harvest"] = { -- action name
          description="Harvest some drugs.", -- action description
          in_money=0, -- money taken per unit
          out_money=0, -- money earned per unit
          reagents={}, -- items taken per unit
          products={ -- items given per unit
            ["benzoilmetilecgonina"] = 1
          }
        }
      }
    },
    positions = {
      {-631.00543212891,-229.42568969727,38.057052612305}
    }
  },
  ["lsd bar"] = {
    def = {
      name="LSD Bar", -- menu name
      permissions = {"harvest.weed"}, -- you can add permissions
      r=0,g=200,b=0, -- color
      max_units=100000,
      units_per_minute=100000,
      x=0,y=0,z=0, -- pos
      radius=5, height=1.5, -- area
      recipes = {
        ["Harvest"] = { -- action name
          description="Harvest some drugs.", -- action description
          in_money=0, -- money taken per unit
          out_money=0, -- money earned per unit
          reagents={}, -- items taken per unit
          products={ -- items given per unit
      			["harness"] = 1
          }
        }
      }
    },
    positions = {
      {1992.5993652344,3044.1806640625,47.215068817139}
    }
  },
  ["police1"] = {
    def = {
      name="Police Report", -- menu name
      permissions = {"police.mission"}, -- you can add permissions
      r=0,g=200,b=0, -- color
      max_units=100000,
      units_per_minute=100000,
      x=0,y=0,z=0, -- pos
      radius=5, height=1.5, -- area
      recipes = {
        ["Write Report"] = { -- action name
          description="Writing Report...", -- action description
          in_money=0, -- money taken per unit
          out_money=0, -- money earned per unit
          reagents={}, -- items taken per unit
          products={ -- items given per unit
            ["police_report"] = 1
          }
        }
      }
    },
    positions = {
      {439.57083129883,-995.072265625,30.689596176147} -- Mission Row
    }
  },
  ["police2"] = {
    def = {
      name="Police Report", -- menu name
      permissions = {"police.mission"}, -- you can add permissions
      r=0,g=200,b=0, -- color
      max_units=100000,
      units_per_minute=100000,
      x=0,y=0,z=0, -- pos
      radius=5, height=1.5, -- area
      recipes = {
        ["Write Report"] = { -- action name
          description="Writing Report...", -- action description
          in_money=0, -- money taken per unit
          out_money=0, -- money earned per unit
          reagents={}, -- items taken per unit
          products={ -- items given per unit
            ["police_report"] = 1
          }
        }
      }
    },
    positions = {
      {1851.6605224609,3690.6713867188,34.267044067383} -- Sandy Shores
    }
  },
  ["police3"] = {
    def = {
      name="Police Report", -- menu name
      permissions = {"police.mission"}, -- you can add permissions
      r=0,g=200,b=0, -- color
      max_units=100000,
      units_per_minute=100000,
      x=0,y=0,z=0, -- pos
      radius=5, height=1.5, -- area
      recipes = {
        ["Write Report"] = { -- action name
          description="Writing Report...", -- action description
          in_money=0, -- money taken per unit
          out_money=0, -- money earned per unit
          reagents={}, -- items taken per unit
          products={ -- items given per unit
            ["police_report"] = 1
          }
        }
      }
    },
    positions = {
      {-449.43395996094,6010.796875,31.716377258301} -- Paleto
    }
  },
  ["ems"] = {
    def = {
      name="Medical Report", -- menu name
      permissions = {"ems.mission"}, -- you can add permissions
      r=0,g=200,b=0, -- color
      max_units=100000,
      units_per_minute=100000,
      x=0,y=0,z=0, -- pos
      radius=5, height=1.5, -- area
      recipes = {
        ["Write Report"] = { -- action name
          description="Writing Report...", -- action description
          in_money=0, -- money taken per unit
          out_money=0, -- money earned per unit
          reagents={}, -- items taken per unit
          products={ -- items given per unit
            ["ems_report"] = 1
          }
        }
      }
    },
    positions = {
      {-272.08700561523,27.639623641968,54.752536773682},
      {465.04064941406,3569.1174316406,33.238555908203},
      {-1145.8566894531,4939.5083007813,222.2686920166}
    }
  }
}

-- time in minutes before hidden transformers are relocated (min is 5 minutes)
cfg.hidden_transformer_duration = 5*24*60 -- 5 days

-- configure the information reseller (can sell hidden transformers positions)
cfg.informer = {
  infos = {
    ["weed field"] = 20000,
	["cocaine dealer"] = 20000,
	["lsd bar"] = 20000
  },
  positions = {
    {2208.0104980469,5577.6987304688,53.739212036133},
    {-631.00543212891,-229.42568969727,38.057052612305},
	{1992.5993652344,3044.1806640625,47.215068817139}
  },
  interval = 60, -- interval in minutes for the reseller respawn
  duration = 10, -- duration in minutes of the spawned reseller
  blipid = 133,
  blipcolor = 2
}

return cfg
