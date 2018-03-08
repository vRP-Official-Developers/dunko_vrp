client_script 'config.lua'
server_script 'config.lua'


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
	'models_c.lua'
}

server_scripts {
    '@vrp/lib/utils.lua',
    'server.lua'
}