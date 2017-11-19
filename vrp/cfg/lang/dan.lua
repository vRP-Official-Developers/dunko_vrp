
-- define all language properties

local lang = {
  common = {
    welcome = "Velkommen. Tryk på K for at bruge menuen",
    no_player_near = "~r~Ingen spiller nær dig.",
    invalid_value = "~r~Ugyldig værdi.",
    invalid_name = "~r~Ugyldigt navn.",
    not_found = "~r~Ikke fundet.",
    request_refused = "~r~Forspørgsel mislykket.",
    wearing_uniform = "~r~Husk du har uniform på.",
    not_allowed = "~r~Ikke tilladt."
  },
  weapon = {
    pistol = "Pistol"
  },
  survival = {
    starving = "Sulten",
    thirsty = "Tørstig"
  },
  money = {
    display = "<span class=\"symbol\">DKK</span> {1}",
	bdisplay = "<span class=\"symbol\">DKK</span> {1}",
    given = "Givet ~r~{1} DKK.",
    received = "Modtaget ~g~{1} DKK.",
    not_enough = "~r~Ikke nok penge.",
    paid = "Betalt ~r~{1} DKK.",
    give = {
      title = "Giv penge",
      description = "Giv penge til den nærmeste spiller.",
      prompt = "Beløb du ønsker at give:"
    }
  },
  inventory = {
    title = "Taske",
    description = "Se indholdet i din taske.",
    iteminfo = "({1})<br /><br />{2}<br /><em>{3} kg</em>",
    info_weight = "Vægt {1}/{2} kg",
    give = {
      title = "Giv ting",
      description = "Giv ting til den nærmeste spiller.",
      prompt = "Antal du ønsker at give (maks {1}):",
      given = "Givet ~r~{1} ~s~{2}.",
      received = "Modtaget ~g~{1} ~s~{2}.",
    },
    trash = {
      title = "Ødelæg",
      description = "Ødelæg.",
      prompt = "Antal du ønsker at ødelægge (maks {1}):",
      done = "Ødelagt ~r~{1} ~s~{2}."
    },
    missing = "~r~Mangler {2} {1}.",
    full = "~r~Din taske er fuld.",
    chest = {
      title = "Kiste",
      already_opened = "~r~Kisten er allerede, åbnet af en anden.",
      full = "~r~Kisten er fuld.",
      take = {
        title = "Tag",
        prompt = "Mængde du vil tage (max {1}):"
      },
      put = {
        title = "Læg",
        prompt = "Mængde du vil lægge i (max {1}):"
      }
    }
  },
  atm = {
    title = "Hæveautomat",
    info = {
      title = "Konto",
      bank = "bank: {1} DKK"
    },
    deposit = {
      title = "Sæt ind",
      description = "Sæt penge ind på din konto.",
      prompt = "Beløb du ønsker at indsætte..",
      deposited = "~r~{1} DKK~s~ indsat."
    },
    withdraw = {
      title = "Hæv",
      description = "Hæv penge fra din konto",
      prompt = "Beløb du ønsker at hæve..",
      withdrawn = "~g~{1} DKK ~s~Hævet.",
      not_enough = "~r~Der er desværre ikke nok penge på din konto."
    }
  },
  business = {
    title = "Virksomhed",
    directory = {
      title = "Alle firmaer",
      description = "Tjek alle firmaer, der er oprettet.",
      dprev = "- Tilbage",
      dnext = "- Næste",
      info = "<em>Kapital: </em>{1} DKK <br /><em>Ejer: </em>{2} {3}<br /><em>Firma navn: </em>{4}<br /><em>Mobilnummer: </em>{5}"
    },
    info = {
      title = "Virksomhedsinformationer",
      info = "<em>Navn: </em>{1}<br /><em>Kapital: </em>{2} DKK<br /><em>Overfør kapital: </em>{3} DKK<br /><br/>Overfør kapital til næste regnskabsår."
    },
    addcapital = {
      title = "Læg et kapital ind",
      description = "Tilføj kapital til dit firma.",
      prompt = "Beløb du ønsker at tilføje:",
      added = "~r~{1} DKK ~s~tilføjet til kapital."
    },
    launder = {
      title = "Hvidvaskning",
      description = "Brug dit firma til hvidvaskning af penge.",
      prompt = "Beløb du ønsker at hvidvaske (Maks {1} DKK): ",
      laundered = "~g~{1} DKK ~s~vasket.",
      not_enough = "~r~Du har ikke nok sorte penge."
    },
    open = {
      title = "Åbn virksomhed",
      description = "Åben Firma, minimums kapitalapitalet er {1} DKK.",
      prompt_name = "Firmanavn (Kan ikke skiftes, maks {1} karakterer):",
      prompt_capital = "Start kapital (minimum {1} DKK)",
      created = "~g~Firma oprettet."
      
    }
  },
  cityhall = {
    title = "Rådhuset",
    identity = {
      title = "Opret en ny identitet",
      description = "Lav en ny indentitet, koster {50} DKK.",
      prompt_firstname = "Fornavn:",
      prompt_name = "Efternavn:",
      prompt_age = "Alder:",
    },
    menu = {
      title = "Identitet",
      info = "<em>Fornavn </em>{1}<br /><em>Efternavn: </em>{2}<br /><em>Alder: </em>{3}<br /><em>CPR-NUMMER: </em>{4}<br /><em>Mobilnummer: </em>{5}<br /><em>Adresse: </em>{7} {6}"
    }
  },
  police = {
    title = "Politiet",
    wanted = "Eftersøgts niveau {1}",
    not_handcuffed = "~r~Ikke sat i håndjern",
    cloakroom = {
      title = "Omklædningsrum",
      uniform = {
        title = "Uniform",
        description = "Tag uniform på."
      }
    },
    pc = {
      title = "PC",
      searchreg = {
        title = "Søg i CPR register",
        description = "Slå et CPR nummer op.",
        prompt = "Skriv det CPR-NUMMER du ønsker at slå op.."
      },
      closebusiness = {
        title = "Luk virksomhed",
        description = "Luk virksomheden på den nærmeste spiller.",
        request = "Er du sikker på du ønsker at lukke virksomheden - {3} EJET AF {1} {2} ?",
        closed = "~g~Firmaet er nu lukket."
      },
      trackveh = {
        title = "Efterlys et køretøj",
        description = "Efterlys et køretøj, med CPR-NUMMER.",
        prompt_reg = "Skriv den nummerplade du ønsker at efetlyse.",
        prompt_note = "Beskriv din grund til at efterlyse dette køretøj.",
        tracking = "~b~Efterlysning af køretøjet er sat igang.",
        track_failed = "~b~Efterlysning af {1}~s~ ({2}) ~n~~r~Mislykket.",
        tracked = "Efterlysning af {1} ({2})"
      },
      records = {
        show = {
          title = "CPR Register",
          description = "Slå CPR nummer op.."
        },
        delete = {
          title = "Tøm CPR Register",
          description = "Tøm den lagrede CPR register-liste.",
          deleted = "~b~Registeret blev tømt"
        }
      }
    },
    menu = {
      handcuff = {
        title = "Håndjern",
        description = "Sæt nærmeste spiller i håndjern."
      },
      putinveh = {
        title = "Sæt i køretøj",
        description = ""
      },
      getoutveh = {
        title = "Tag ud af køretøj",
        description = ""
      },
      askid = {
        title = "Spørg efter ID",
        description = "",
        request = "Ønsker du at fremvise dit ID?",
        request_hide = "Skjul ID .",
        asked = "Spørger efter ID..."
      },
      check = {
        title = "Visiter spiller",
        description = "Visiter for penge, inventar og våben på nærmeste spiller.",
        request_hide = "Gem rapport.",
        info = "<em>Penge: </em>{1} DKK<br /><br /><em>Inventar: </em>{2}<br /><br /><em>Våben: </em>{3}",
        checked = "Du blev visiteret."
      },
      seize = {
        seized = "Beslaglagde {2} ~r~{1}",
        weapons = {
          title = "Beslaglæg våben",
          description = "",
          seized = "~b~Dine våben er blevet beslaglagt."
        },
        items = {
          title = "Beslaglæg illegale ting",
          description = "",
          seized = "~b~Dine ulovlige genstande er blevet beslaglagt."
        }
      },
      jail = {
        title = "Fængsel",
        description = "Fængsel/frifind nærmeste spiller.",
        not_found = "~r~Du står ikke på stationen.",
        jailed = "~b~Fængslet.",
        unjailed = "~b~Frifundet.",
        notify_jailed = "~b~Du blev fængslet.",
        notify_unjailed = "~b~Du blev frifundet."
      },
      fine = {
        title = "Bøde",
        description = "",
        fined = "~b~Bøde ~s~{2} DKK for ~b~{1}.",
        notify_fined = "~b~Du modtog en bøde ~s~ {2} DKK for ~b~{1}.",
        record = "[Politiet] {2} DKK for {1}"
      },
      store_weapons = {
        title = "Læg våben i tasken",
        description = ""
      }
    },
    identity = {
      info = "<em>Fornavn: </em>{1}<br /><em>Efternavn: </em>{2}<br /><em>Alder: </em>{3}<br /><em>CPR-NUMMER: </em>{4}<br /><em>Mobilnummer: </em>{5}<br /><em>Firmanavn: </em>{6}<br /><em>Firma Kapital: </em>{7} DKK<br /><em>Adresse: </em>{9} {8}"
    }
  },
  emergency = {
    menu = {
      revive = {
        title = "Genopliv",
        description = "",
        not_in_coma = "~r~Ikke i koma."
      }
    }
  },
  phone = {
    title = "Mobil",
    directory = {
      title = "Kontakter",
      description = "",
      add = {
        title = "- Tilføj kontakt",
        prompt_number = "Mobilnummer",
        prompt_name = "Fulde navn",
        added = "~g~Kontakten blev tilføjet."
      },
      sendsms = {
        title = "Send en SMS",
        prompt = "Skriv din besked (maks {1})",
        sent = "~g~ Beskeden blev sendt til {1}.",
        not_sent = "~r~ {1} Ikke tilgængelig."
      },
      sendpos = {
        title = "Send position",
      },
      remove = {
        title = "- Fjern"
      }
    },
    sms = {
      title = "Indbakke",
      description = "",
      info = "<em>{1}</em><br /><br />{2}",
      notify = "BESKED~b~ {1}:~s~ ~n~{2}"
    },
    smspos = {
      notify = "SMS-Lokalisering ~b~ {1}"
    },
    service = {
      title = "Servicering",
      description = "",
      prompt = "Skriv venligst en besked, så Vi kan hjælpe dig hurtigere.",
      ask_call = "Modtaget {1} Opkald, tager du det ? <em>{2}</em>",
      taken = "~r~Dette opkald er allerede taget af en anden."
    },
    announce = {
      title = "Reklamer",
      description = "Skriv en reklame som bliver vist i et par sekunder for andre.",
      item_desc = "{1} DKK<br /><br/>{2}",
      prompt = "Reklame beskrivelse (10-1000 tegn): "
    }
  },
  emotes = {
    title = "Handlinger",
    clear = {
      title = "> Stop",
      description = "Stopper alle handlinger."
    }
  },
  home = {
    buy = {
      title = "Køb",
      description = "Køb en lejlighed her, prisen er {1} DKK.",
      bought = "~g~Købt.",
      full = "~r~Boligblokken er desværre fuld.",
      have_home = "~r~Du har allerede en lejlighed."
    },
    sell = {
      title = "Sælg",
      description = "Sælg dit hjem for {1} DKK",
      sold = "~g~Solgt.",
      no_home = "~r~Du har ikke en adresse her."
    },
    intercom = {
      title = "Ring på",
      description = "Ring på enten din eller din nabos dør.",
      prompt = "Nummer:",
      not_available = "~r~Ikke tilgængelig.",
      refused = "~r~Nægtet at komme ind.",
      prompt_who = "Sig hvem du er:",
      asked = "Spørger...",
      request = "Nogen banker på din dør: <em>{1}</em>"
    },
    slot = {
      leave = {
        title = "Forlad"
      },
      ejectall = {
        title = "Smid alle ud",
        description = "Smid alle inklusiv dig selv ud, og lås stedet."
      }
    },
    wardrobe = {
      title = "Klædeskab",
      save = {
        title = "> Gem",
        prompt = "Navn:"
      }
    },
    gametable = {
      title = "Pokerbord",
      bet = {
        title = "Start sats",
        description = "Start et pokerspil med de andre spillere i nærheden, vinderen findes tilfældigt.",
        prompt = "Stats:",
        request = "[BUD] Ønsker du at satse {1} DKK?",
        started = "~g~Spil startet."
      }
    }
  },
  garage = {
    title = "- Garage ({1})",
    owned = {
      title = "Mine køretøjer",
      description = ""
    },
    buy = {
      title = "Køb et køretøj",
      description = "",
      info = "{1} DKK<br /><br />{2}"
    },
    sell = {
      title = "Sælg dit køretøj",
      description = ""
    },
    rent = {
      title = "Lej et køretøj",
      description = "Midlertidigt ejerskab indtil du forlader byen."
    },
    store = {
      title = "Parker køretøj",
      description = ""
    }
  },
  vehicle = {
    title = "Bil",
    no_owned_near = "~r~Du ejer ikke dette køretøj.",
    trunk = {
      title = "Bagagerum",
      description = "Åben bagagerum."
    },
    detach_trailer = {
      title = "Fjern trailer",
      description = "Fjern trailer."
    },
    detach_towtruck = {
      title = "Fjern krog (Bugseringskøretøj)",
      description = "Fjern krogen."
    },
    detach_cargobob = {
      title = "Fjern krog (Cargobob)",
      description = "Fjern krogen."
    },
    lock = {
      title = "Lås/Lås op",
      description = ""
    },
    engine = {
      title = "Tænd/Sluk",
      description = ""
    },
    asktrunk = {
      title = "Spørg om at åbne baggagerum",
      asked = "~g~Spørger...",
      request = "Vil du åbne bagagerummet?"
    },
    replace = {
      title = "Respawn køretøj",
      description = ""
    },
    repair = {
      title = "Reparer køretøj",
      description = ""
    }
  },
  gunshop = {
    title = "Våbenbutik ({1})",
    prompt_ammo = "Antal af skud du ønsker at købe {1}",
    info = "<em>Våben: </em> {1} DKK<br /><em>Skud: </em> {2} DKK/u<br /><br />{3}"
  },
  market = {
    title = "Butik ({1})",
    prompt = "Antal af {1} du ønsker at købe",
    info = "{1} DKK<br /><br />{2}"
  },
  skinshop = {
    title = "Tøjforretning"
  },
  cloakroom = {
    title = "Omklædningsrum ({1})",
    undress = {
      title = "> Fjern uniform"
    }
  },
  itemtr = {
    informer = {
      title = "Illegal informer",
      description = "{1} DKK",
      bought = "~g~Position sendt til din GPS."
    }
  },
  mission = {
    blip = "Mission ({1}) {2}/{3}",
    display = "<span class=\"name\">{1}</span> <span class=\"step\">{2}/{3}</span><br /><br />{4}",
    cancel = {
      title = "Annuller mission"
    }
  },
  aptitude = {
    title = "Informationer",
    description = "Vis informationer.",
    lose_exp = "Fædighed: ~b~{1}/{2} ~r~-{3} ~s~XP.",
    earn_exp = "Fædighed: ~b~{1}/{2} ~g~+{3} ~s~XP.",
    level_down = "Fædighed: ~b~{1}/{2} ~r~tabte niveau ({3}).",
    level_up = "Fædighed: ~b~{1}/{2} ~g~niveau op ({3}).",
    display = {
      group = "{1}: ",
      aptitude = "{1} (Level {3})"
    }
  }
}

return lang
