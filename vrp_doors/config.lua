local cfg = {}

cfg.doors = {
    -- Police stations
        [1] = { locked = true, key = "1", permission="cop.keycard", name = "1", hash =  "v_ilev_ph_gendoor004", coords={ 449.69815063477,-986.46911621094,30.689594268799}},
        [2] = { locked = true, key = "1", permission="cop.keycard", name = "1", hash =  "v_ilev_arm_secdoor", coords={ 452.61877441406,-982.7021484375,30.689598083496}},
        [3] = { locked = true, key = "1", permission="cop.keycard", name = "1", hash =  "v_ilev_ph_gendoor002", coords={ 447.23818969727,-980.63006591797,30.689598083496}},
        [4] = { locked = true, key = "1", permission="cop.keycard", name = "1", hash =  "v_ilev_ph_gendoor005", coords={ 443.97,-989.033,30.6896}, pairs = 5},
        [5] = { locked = true, key = "1", permission="cop.keycard", name = "1", hash =  "v_ilev_ph_gendoor005", coords={ 445.37,-989.705,30.6896}, pairs = 4},
        [6] = { locked = true, key = "1", permission="cop.keycard", name = "1", hash =  "v_ilev_ph_cellgate", coords={ 461.89053344727,-993.59692382813,24.914764404297}},
        [7] = { locked = true, key = "1", permission="cop.keycard", name = "1", hash =  "v_ilev_ph_cellgate", coords={ 463.94390869141,-992.77770996094,24.914751052856}},
        [8] = { locked = true, key = "1", permission="cop.keycard", name = "1", hash =  "v_ilev_ph_cellgate", coords={ 461.81600952148,-998.38293457031,24.914754867554}},
        [9] = { locked = true, key = "1", permission="cop.keycard", name = "1", hash =  "v_ilev_ph_cellgate", coords={ 461.78784179688,-1001.9349975586,24.914754867554}},
        [10] = { locked = true, key = "1", permission="cop.keycard", name = "1", hash =  "v_ilev_gtdoor", coords={ 464.2981262207,-1003.7673950195,24.914764404297}},
        [11] = { locked = true, key = "1", permission="cop.keycard", name = "1", hash =  "v_ilev_gtdoor02", coords={ 464.36140,-984.67800,43.6918}},
        [12] = { locked = true, key = "1", permission="cop.keycard", name = "1", hash =  -2023754432, coords={ 468.3716,-1014.452,26.53623}, pairs = 13},
        [13] = { locked = true, key = "1", permission="cop.keycard", name = "1", hash =  -2023754432, coords={ 468.9679,-1014.452,26.53623}, pairs = 12},
    -- The hospital
        [14] = { locked = true, key = "2", permission="ems.keycard", name = "2", hash =  "v_ilev_cor_doorglassa", coords={ 253.93524169922, -1360.0373535156,24.537809371948}, pairs = 17},
        [15] = { locked = true, key = "2", permission="ems.keycard", name = "2", hash =  "v_ilev_cor_firedoorwide", coords={ 271.64025878906, -1361.0727539063,24.537803649902}}, 
        [16] = { locked = true, key = "2", permission="ems.keycard", name = "2", hash =  "v_ilev_cor_firedoorwide", coords={ 265.51382446289, -1362.8316650391,24.5378074646}},
        [17] = { locked = true, key = "2", permission="ems.keycard", name = "2", hash =  "v_ilev_cor_doorglassb", coords={ 253.26365661621, -1360.9027099609,24.537809371948}, pairs = 14},
        [18] = { locked = true, key = "2", permission="ems.keycard", name = "2", hash =  "v_ilev_cor_doorglassb", coords={ 266.32699584961, -1345.3035888672,24.537809371948}, pairs = 19}, 
		[19] = { locked = true, key = "2", permission="ems.keycard", name = "2", hash =  "v_ilev_cor_doorglassa", coords={ 267.06994628906, -1344.4372558594,24.537788391113}, pairs = 18},		
    -- Michael's house
        [20] = { locked = true, key = "5", permission="", name = "5", hash =  "v_ilev_mm_doorm_r", coords={ -816.34075927734, 178.02558898926,72.227691650391}, pairs = 21},
        [21] = { locked = true, key = "5", permission="", name = "5", hash =  "v_ilev_mm_doorm_l", coords={ -816.58001708984, 178.50416564941,72.227813720703}, pairs = 20},     
        [22] = { locked = true, key = "5", permission="", name = "5", hash =  "v_ilev_mm_door", coords={ -807.15789794922, 185.71429443359,72.484481811523}},
        [23] = { locked = true, key = "5", permission="", name = "5", hash =  "prop_bh1_48_backdoor_l", coords={-793.64440917969, 181.22857666016,72.83528137207}, pairs = 26},
        [24] = { locked = true, key = "5", permission="", name = "5", hash =  "prop_bh1_48_backdoor_l", coords={-796.09320068359, 177.35055541992,72.835258483887}, pairs = 25},
        [25] = { locked = true, key = "5", permission="", name = "5", hash =  "prop_bh1_48_backdoor_r", coords={ -795.15954589844, 177.74322509766,72.835266113281}, pairs = 24},    
        [26] = { locked = true, key = "5", permission="", name = "5", hash =  "prop_bh1_48_backdoor_r", coords={ -793.95068359375, 182.0545501709,72.835350036621}, pairs = 23},
        [27] = { locked = true, key = "5", permission="", name = "5", hash =  -2125423493, coords={ -843.4931, 155.8496,66.8763}},
    -- Denice's hus
        [28] = { locked = true, key = "6", permission="", name = "6", hash =  520341586, coords={ -14.1750, -1440.6750, 31.1015}},
    -- Franklins hus
        [29] = { locked = true, key = "7", permission="", name = "7", hash =  308207762, coords={ 8.1706, 538.9403, 176.0281}},       
    -- The Lost MC
        [30] = { locked = true, key = "8", permission="Skab.8", name = "8", hash =  190770132, coords={ 981.9177, -103.1663, 74.8487}},        
    -- BeachHouse
        [31] = { locked = true, key = "17", permission="", name = "17", hash =  -607040053, coords={ -1149.8902, -1521.6926, 10.6280}},
    -- Paleto PD
        [32] = { locked = true, key = "1", permission="cop.keycard", name = "1", hash =  -1501157055, coords={ -444.123, 6016.644,31.716}, pairs = 33},
        [33] = { locked = true, key = "1", permission="cop.keycard", name = "1", hash =  -1501157055, coords={ -442.938, 6015.612,31.715}, pairs = 32},
    -- Retssalen   
        [34] = { locked = true, key = "3", permission="", name = "3", hash =  34120519,  coords={ 227.5726, -416.0190,-118.4651}},
    -- La Blanca
        [35] = { locked = true, key = "14", permission="", name = "14", hash =  "v_ilev_ra_door4l", coords={ 1395.920, 1142.904, 114.700}, pairs = 36}, -- front left
        [36] = { locked = true, key = "14", permission="", name = "14", hash =  "v_ilev_ra_door4r", coords={ 1395.919, 1140.704, 114.790}, pairs = 35}, -- front right
    -- Lawyer's office
        [37] = { locked = true, key = "15", permission="", name = "15", hash =  "v_ilev_fib_door2", coords={ 121.21444702148, -757.10894775391,242.15208435059}}, -- front left
        [38] = { locked = true, key = "15", permission="", name = "15", hash =  "v_ilev_fib_door2", coords={ 127.42668151855, -763.98931884766,242.15208435059}}, -- front right
        [39] = { locked = true, key = "15", permission="", name = "15", hash =  "v_ilev_fib_door2", coords={ 119.02278900146, -734.02886962891,242.15196228027}}, -- front right
    -- POINTS OF SALE 
            [40] = { locked = true, key = "", permission="sellroom.whitelisted", name = "The grocer", hash =  "v_ilev_epsstoredoor", coords={ 242.5555, 360.6089,105.8533}},      
    -- PRISON
            [41] = { locked = true, key = "1", permission="cop.keycard", name = "1", hash =  741314661, coords={ 1845.0246582031, 2608.3833007813,45.588790893555}, range = 10},
            [42] = { locked = true, key = "1", permission="cop.keycard", name = "1", hash =  741314661, coords={ 1818.4844970703, 2608.4245605469,45.594127655029}, range = 10},

            [43] = { locked = true, key = "21", permission="", name = "21", hash =  "v_ilev_roc_door2", coords={ 99.571685791016, -1293.2911376953,29.268753051758}},
            [44] = { locked = true, key = "21", permission="", name = "21", hash =  "prop_magenta_door", coords={ 95.564407348633, -1285.1196289063,29.278381347656}},
    -- HELLS ANGELS
            [45] = { locked = true, key = "22", permission="", name = "22", hash =  "v_ilev_tort_door", coords={ 134.4093170166, -2203.4624023438,7.3598127365112}},      
    -- EXTRA TO BASEMENT HOSPITAL       
            [46] = { locked = true, key = "2", permission="ems.keycard", name = "2", hash =  "v_ilev_cor_firedoor", coords={ 251.61546325684, -1365.6739501953,24.537788391113}, pairs = 47},
            [47] = { locked = true, key = "2", permission="ems.keycard", name = "2", hash =  "v_ilev_cor_firedoor", coords={ 252.44039916992, -1366.3625488281,24.537811279297}, pairs = 46},
    -- SonsOfAnarchy
            [48] = { locked = true, key = "8", permission="", name = "8", hash =  "prop_facgate_01", coords={ 957.348, -138.583, 73.562}, range = 10},
    -- MissionRowEXTENDED
            [49] = { locked = true, key = "1", permission="cop.keycard", name = "1", hash =  "v_ilev_gtdoor", coords={ 445.62120, -999.00100,30.78866}, pairs = 50},
            [50] = { locked = true, key = "1", permission="cop.keycard", name = "1", hash =  "v_ilev_gtdoor", coords={ 446.21840, -999.00230,30.78942}, pairs = 49},
            [51] = { locked = true, key = "1", permission="cop.keycard", name = "1", hash =  "v_ilev_gtdoor", coords={ 467.19220, -996.45940,25.00599}},
            [52] = { locked = true, key = "1", permission="cop.keycard", name = "1", hash =  "v_ilev_gtdoor", coords={ 471.47550, -996.45940,25.00599}},
            [53] = { locked = true, key = "1", permission="cop.keycard", name = "1", hash =  "v_ilev_gtdoor", coords={ 475.75430, -996.45940,25.00599}},
            [54] = { locked = true, key = "1", permission="cop.keycard", name = "1", hash =  "v_ilev_gtdoor", coords={ 480.03010, -996.45940,25.00599}},
    -- FightClubThingy
            [55] = { locked = true, key = "8", permission="", name = "8", hash =  "prop_fnclink_02gate6_r", coords={ 964.043, -188.9519,73.48999}},

            [56] = { locked = true, key = "1", permission="cop.keycard", name = "1", hash =  "v_ilev_ph_cellgate", coords={ 1848.3480224609, 3681.1394042969,34.286602020264}},
            [57] = { locked = true, key = "1", permission="cop.keycard", name = "1", hash =  "v_ilev_ph_cellgate", coords={ 1846.0610351563, 3684.9367675781,34.286643981934}},
	-- Nightclub
			[58] = { locked = true, key = "9", permission="", name = "Nightclub", hash =  "ba_prop_door_club_glass", coords={ -1621.751953125,-3015.9489746094,-75.205078125}},
			[59] = { locked = true, key = "9", permission="", name = "Nightclub", hash =  "ba_prop_door_club_glam_generic", coords={ -1621.3787841797,-3019.1606445313,-75.205078125}},
			[60] = { locked = true, key = "9", permission="", name = "Nightclub", hash =  "ba_prop_door_club_generic_vip", coords={ -1607.4812011719,-3006.1018066406,-75.205146789551}},
			[61] = { locked = true, key = "9", permission="", name = "Nightclub", hash =  "ba_prop_door_club_edgy_generic", coords={ -1583.4389648438,-3005.720703125,-76.004959106445}},
	-- EKSTRA TIL STRIPKLUBBEN v_ilev_door_orangesolid
			[62] = { locked = true, key = "21", permission="", name = "21", hash =  "v_ilev_door_orangesolid", coords={ 113.65085601807, -1296.8083496094,29.268762588501}},
	-- Tequila
			[63] = { locked = true, key = "10", permission="", name = "10", hash =  "v_ilev_roc_door3", coords={ -568.20495605469,281.09652709961,82.976066589355}}, -- Garderobe
			[64] = { locked = true, key = "10", permission="", name = "10", hash =  "v_ilev_roc_door4", coords={ -562.00219726563,293.64669799805,87.627990722656}}, -- Bagdør
			[65] = { locked = true, key = "10", permission="", name = "10", hash =  "v_ilev_roc_door2", coords={ -569.76776123047,293.07702636719,79.176704406738}}, -- Under
	-- PD LSCUSTOMS		
			[66] = { locked = true, key = "1", permission="cop.keycard", name = "1", hash =  "prop_com_gar_door_01", coords={ 452.34289550781,-1001.1693115234,25.709547042847}, range = 5},
			[67] = { locked = true, key = "1", permission="cop.keycard", name = "1", hash =  "prop_com_gar_door_01", coords={ 447.41268920898,-1001.1377563477,25.709869384766}, range = 5},
	-- Fænglet
			[68] = { locked = true, key = "1", permission="cop.keycard", name = "1", hash =  "v_ilev_gtdoor", coords={ 1658.584,2397.722,45.71526}},
			[69] = { locked = true, key = "1", permission="cop.keycard", name = "1", hash =  "v_ilev_gtdoor", coords={ 1759.62,2412.837,45.71166}},
			[70] = { locked = true, key = "1", permission="cop.keycard", name = "1", hash =  "v_ilev_gtdoor", coords={ 1821.17,2476.265,45.68915}},
			[71] = { locked = true, key = "1", permission="cop.keycard", name = "1", hash =  "v_ilev_gtdoor", coords={ 1820.77,2620.77,45.95126}},
			[72] = { locked = true, key = "1", permission="cop.keycard", name = "1", hash =  "v_ilev_gtdoor", coords={ 1845.79,2698.621,45.95531}},
			[73] = { locked = true, key = "1", permission="cop.keycard", name = "1", hash =  "v_ilev_gtdoor", coords={ 1773.108,2759.7,45.88673}},
			[74] = { locked = true, key = "1", permission="cop.keycard", name = "1", hash =  "v_ilev_gtdoor", coords={ 1651.161,2755.436,45.87868}},
			[75] = { locked = true, key = "1", permission="cop.keycard", name = "1", hash =  "v_ilev_gtdoor", coords={ 1572.662,2679.191,45.72976}},
			[76] = { locked = true, key = "1", permission="cop.keycard", name = "1", hash =  "v_ilev_gtdoor", coords={ 1537.811,2585.995,45.68915}},
			[77] = { locked = true, key = "1", permission="cop.keycard", name = "1", hash =  "v_ilev_gtdoor", coords={ 1543.241,2471.294,45.71201}},
	-- Trevors trailor
			[78] = { locked = true, key = "11", permission="", name = "Trevors Trailor", hash =  "v_ilev_trevtraildr", coords={ 1973.4393310547,3815.7998046875,33.510219573975}},
	-- TeamTurbo
			[79] = { locked = true, key = "4", permission="nummerplade.whitelisted", name = "2Fast", hash =  741314661, coords={ 970.10406494141,-1603.8894042969,30.196130752563}, range = 10},
	-- håndværker
			[80] = { locked = true, key = "12", permission="haandvaerker.whitelisted", name = "Håndværker", hash =  "v_ilev_gtdoor", coords={ -62.699779510498,-2519.4790039063,7.4011693000793}},
	-- Skaterpark
			[81] = { locked = true, key = "13", permission="", name = "2Fast", hash =  741314661, coords={ 779.96643066406,-1222.4064941406,26.340658187866}, range = 10},
	-- Sandymek
			[82] = { locked = true, key = "16", permission="", name = "Sandymek", hash =  "prop_fnclink_03gate2", coords={ 1759.4360351563,3312.7041015625,41.118431091309}, range = 10},
}	
return cfg
