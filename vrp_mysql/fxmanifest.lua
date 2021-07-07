
fx_version 'cerulean'
games {  'gta5' }

description "vRP MySQL async - Modified Version"
dependency "ghmattimysql"
-- server scripts
server_scripts{ 
  "@vrp/lib/utils.lua",
  "MySQL.lua"
}

