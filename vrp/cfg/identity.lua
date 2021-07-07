
local cfg = {}

-- city hall position
cfg.city_hall =	{-262.25286865234,-969.47399902344,31.223146438599}

-- cityhall blip {blipid,blipcolor}
cfg.blip = {498,4}

-- cost of a new identity
cfg.new_identity_cost = 100

-- phone format (max: 20 chars, use D for a random digit)
cfg.phone_format = "DDD-DDDD"
-- cfg.phone_format = "06DDDDDDDD" -- another example for cellphone in France


-- config the random name generation (first join identity)
-- (I know, it's a lot of names for a little feature)
-- (cf: http://names.mongabay.com/most_common_surnames.htm)
cfg.random_first_names = {
  "Change",
  "Change"
}

cfg.random_last_names = {
  "Me",
  "Me"
}

return cfg
