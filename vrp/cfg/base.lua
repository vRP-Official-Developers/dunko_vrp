
local cfg = {}

-- mysql credentials
cfg.db = {
  host = "127.0.0.1", -- database ip (default is local)
  database = "vrpfx",   -- name of database
  user = "vrpenw",    --  database username
  password = ""   -- password of your database
}

cfg.save_interval = 30 -- seconds
cfg.whitelist = enable -- enable/disable whitelist

-- delay the tunnel at loading (for weak connections)
cfg.load_duration = 5 -- seconds, player duration in loading mode at the first spawn
cfg.load_delay = 0 -- milliseconds, delay the tunnel communication when in loading mode
cfg.global_delay = 0 -- milliseconds, delay the tunnel communication when not in loading mode

cfg.ping_timeout = 5 -- number of minutes after a client should be kicked if not sending pings

cfg.lang = "it" -- en / fr / it / ger / pt / ru / lith / dan (English/Français/Italiano/Deutsche/Português/Pусский/Lietuvių/Dansk)
cfg.debug = false


return cfg
