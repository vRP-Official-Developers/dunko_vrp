resource_manifest_version '77731fab-63ca-442c-a67b-abc70f28dfa5'

client_script  "@crpthere/SharedScripts/MagicDust/main.lua" 

files {
    'vehicles/**/handling.meta',
    'vehicles/**/vehicles.meta',
    'vehicles/**/carvariations.meta',
    'vehicles/**/carcols.meta',
    'vehicles/**/vehiclelayouts.meta',
}

data_file 'HANDLING_FILE'            'vehicles/**/handling.meta'
data_file 'VEHICLE_METADATA_FILE'    'vehicles/**/vehicles.meta'
data_file 'CARCOLS_FILE'             'vehicles/**/carcols.meta'
data_file 'VEHICLE_VARIATION_FILE'   'vehicles/**/carvariations.meta'
data_file 'VEHICLE_LAYOUTS_FILE'     'vehicles/**/vehiclelayouts.meta'