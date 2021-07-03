local cfg = {}

-- Teleporters
cfg.teleporters_types = {
	["Example"] = { -- Name of the teleporter (NEEDS TO BE THE SAME AS THE ONE BELOW)
		_config = {blipid = 1, blipcolor = 1} -- Remove blipid and blipcolor if you want no blips created for the specific teleporter
	},
}

-- x, y, z = Enterance
-- x2, y2, z2 = Exit
cfg.teleporters = { -- Name of the teleporter and coordinates (NEEDS TO BE THE SAME AS THE ONE ABOVE)
	{"Example", x,y,z,  x2,y2,z2}, -- CHANGE HERE (x,y,z, x2,y2,z2) WITH YOUR SET COORDINATES BEFORE STARTING THE SERVER!!!
}

return cfg