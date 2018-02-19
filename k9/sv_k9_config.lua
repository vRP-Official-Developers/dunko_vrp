K9_Config = {}
K9_Config = setmetatable(K9_Config, {})

K9_Config.DogModel = "A_C_Rottweiler" -- Set dog model of your choice
K9_Config.PedRestricted = true -- [true means the menu is restricted to cop peds. false means the menu can be used by everyone.]
K9_Config.VehicleRestricted = true -- [true means the dog can only get into police vehicles listed. false means he can enter any vehicle told to.]
K9_Config.GodmodeDog = true -- [true means the dog can NOT die. false means the dog CAN die.]
K9_Config.SearchSetting = "random" -- [random means it randomly generates items in the vehicle.]

K9_Config.PedList = {
	-- Police --
	"s_m_y_cop_01",
	"s_f_y_cop_01",
	-- Highway --
	"s_m_y_hwaycop_01",
	-- Sheriff --
	"s_m_y_sheriff_01",
	"s_f_y_sheriff_01",
	-- SWAT --
	"s_m_y_swat_01",
	-- Ranger --
	"s_m_y_ranger_01",
	"s_f_y_ranger_01"
}

K9_Config.VehicleList = {
	"POLICET", -- 456714581
	"FBI", -- FBI
	"FBI2", -- FBI2
	"POLICE", -- Police
	"POLICE2", -- Police2
	"POLICE3", -- POlice3
	"POLICE4", -- Police4
	"PRANGER", -- Pranger
	"RIOT", -- Riot
	"SHERIFF", -- Sheriff
	"SHERIFF2" -- Sheriff2
}

K9_Config.Items = {
	illegal = {
		"Meth",
		"Marijuana",
		"Crack Cocaine",
		"Bath Salts",
		"Heroin"
	},
	suspicious = {
		"Open Alcahol Container(s)",
		"Marijuana Seed(s)",
		"Marijuana Stem(s)",
		"Large Wad of Cash",
        "Scale",
        "Small Baggies"
	},
	legal = {
		"Dirty Socks",
		"Bag(s) of candy",
		"Empty Food Wrapper(s)",
		"Empty Cup(s)",
		"Change"
    },
}