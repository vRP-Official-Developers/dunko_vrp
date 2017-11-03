
local cfg = {}

-- exp notes:
-- levels are defined by the amount of xp
-- with a step of 5: 5|15|30|50|75 (by default)
-- total exp for a specific level, exp = step*lvl*(lvl+1)/2
-- level for a specific exp amount, lvl = (sqrt(1+8*exp/step)-1)/2

-- define groups of aptitudes
--- _title: title of the group
--- map of aptitude => {title,init_exp,max_exp}
---- max_exp: -1 for infinite exp
cfg.gaptitudes = {
  ["physical"] = {
    _title = "Fisica",
    ["strength"] = {"Forza", 30, 275} -- required, level 3 to 6 (by default, can carry 10kg per level)
  },
  ["science"] = {
    _title = "Science",
    ["chemicals"] = {"Studio chimica", 0, -1}, -- example
    ["mathematics"] = {"Studio Matematica", 0, -1} -- example
  },
  ["laboratory"] = {
    _title = "laboratorio di droga",
	["cocaine"] = {"processa la cocaina, ti serve benzoilmetilecgonina, la trovi in piantagione .", 0, -1},
	["weed"] = {"processa marjuana, ti serve semi, la trovi  in piantagione .", 0, -1},
	["lsd"] = {"processa l'lsd, ti serve Harness, la trovi in piantagione .", 0, -1}
  },
  ["hacker"] = {
    _title = "Studia per hackers",
	["logic"] = {"Studia logica.", 0, -1},
	["c++"] = {"Studia linguaggi oC++.", 0, -1},
	["lua"] = {"Studia linguaggio lua.", 0, -1},
	["hacking"] = {"Impara le basi del hackers.", 0, -1}
  }
}

return cfg
