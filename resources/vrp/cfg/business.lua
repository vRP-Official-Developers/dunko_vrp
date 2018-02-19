
local cfg = {}

-- minimum capital to open a business
cfg.minimum_capital = 25000

-- capital transfer reset interval in minutes
-- default: reset every 24h
cfg.transfer_reset_interval = 60

-- commerce chamber {blipid,blipcolor}
cfg.blip = {500,2} 

-- positions of commerce chambers
cfg.commerce_chambers = {
	{-266.61505126953,-968.71441650391,31.224632263184}
}

return cfg
