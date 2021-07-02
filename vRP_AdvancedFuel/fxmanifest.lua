fx_version 'cerulean'
games { 'gta5' }

ui_page 'notifs/index.html'

files {
	'notifs/index.html',
	'notifs/hotsnackbar.css',
	'notifs/hotsnackbar.js'
}


client_scripts {
	'notifs.lua',
	'map.lua',
	'client.lua',
	'GUI.lua',
	'models_c.lua',
	'config.lua'
}

server_scripts {
    '@vrp/lib/utils.lua',
    'server.lua',
	'config.lua'
}