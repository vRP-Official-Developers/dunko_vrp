
-- define all language properties

local lang = {
  common = {
    welcome = "Velkommen. Tryk på K for at bruge menuen",
    no_player_near = "~r~Ingen spiller nær dig.",
    invalid_value = "~r~Ugyldig Værdi.",
    invalid_name = "~r~Ugyldigt Navn.",
    not_found = "~r~Ikke fundet.",
    request_refused = "~r~Forspørgsel Mislykket.",
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
    display = "<span class=\"symbol\">€</span> {1}",
	bdisplay = "<span class=\"symbol\">€</span> {1}",
    given = "Givet ~r~{1},- kr.",
    received = "Modtaget ~g~{1},- kr.",
    not_enough = "~r~Ikke nok penge.",
    paid = "Betalt ~r~{1},- kr.",
    give = {
      title = "Giv penge",
      description = "Giv penge til den nærmeste spiller.",
      prompt = "Beløb du ønsker at give:"
    }
  },
  inventory = {
    title = "Taske",
    description = "Se dit indhold i din taske.",
    iteminfo = "({1})<br /><br />{2}<br /><em>{3} kg</em>",
    info_weight = "vægt {1}/{2} kg",
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
      bank = "bank: {1},- kr"
    },
    deposit = {
      title = "Sæt ind",
      description = "Sæt penge ind på din konto.",
      prompt = "Beløb du ønsker at indsætte..",
      deposited = "~r~{1},- kr~s~ indsat."
    },
    withdraw = {
      title = "Hæv",
      description = "Hæv penge fra din konto",
      prompt = "Beløb du ønsker at hæve..",
      withdrawn = "~g~{1},- kr ~s~Hævet.",
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
      info = "<em>Kapital: </em>{1},- kr <br /><em>Ejer: </em>{2} {3}<br /><em>Firma navn: </em>{4}<br /><em>Mobilnummer: </em>{5}"
    },
    info = {
      title = "Info omkring virksomhed",
      info = "<em>Navn: </em>{1}<br /><em>Kapital: </em>{2},- kr<br /><em>Kapital-Overførsel: </em>{3} ,- kr<br /><br/>Capital transfer is the amount of money transfered for a business economic period, the maximum is the business capital."
    },
    addcapital = {
      title = "Læg et kapital ind",
      description = "Add capital to your business.",
      prompt = "Amount to add to the business capital:",
      added = "~r~{1}€ ~s~added to the business capital."
    },
    launder = {
      title = "Hvidvaskning",
      description = "Use your business to launder dirty money.",
      prompt = "Amount of dirty money to launder (max {1} €): ",
      laundered = "~g~{1}€ ~s~laundered.",
      not_enough = "~r~Not enough dirty money."
    },
    open = {
      title = "Åbn virksomhed",
      description = "Åben Firma, minimum kapitalapital er {1} €.",
      prompt_name = "Business name (can't change after, max {1} chars):",
      prompt_capital = "Initial capital (min {1})",
      created = "~g~CVR nummer oprettet."
      
    }
  },
  cityhall = {
    title = "Rådhuset",
    identity = {
      title = "Opret en ny identitet",
      description = "Lav en ny indentitet, koster {50} ,- kr.",
      prompt_firstname = "Fornavn:",
      prompt_name = "Efternavn:",
      prompt_age = "Alder:",
    },
    menu = {
      title = "Identitet",
      info = "<em>Fornavn </em>{1}<br /><em>Efternavn: </em>{2}<br /><em>Alder: </em>{3}<br /><em>CPR-NUMMER: </em>{4}<br /><em>Mobil nummer: </em>{5}<br /><em>Addresse: </em>{7} {6}"
    }
  },
  police = {
    title = "Politiet",
    wanted = "Wanted rank {1}",
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
          title = "CPR Registeret",
          description = "Slå folk op på deres CPR-NUMMER."
        },
        delete = {
          title = "Slet CVR Registeret",
          description = "Slet CPR Registeret, ved den nærmeste spiller.",
          deleted = "~b~[POLITI] - CPR Registeret er nu slettet."
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
        request = "Ønsker du at fremvise din ID?",
        request_hide = "Skjul ID .",
        asked = "Spørger efter ID..."
      },
      check = {
        title = "Tjek Person",
        description = "",
        request_hide = "Skjul rapport",
        info = "<em>Penge: </em>{1} ,- kr<br /><br /><em>Taske: </em>{2}<br /><br /><em>Våben: </em>{3}",
        checked = "Du er blevet kropsvisiteret."
      },
      seize = {
        seized = "beslaglagt{2} ~r~{1}",
        weapons = {
          title = "Beslaglæg våben",
          description = "",
          seized = "~b~Dine våbn er blevet beslaglagt."
        },
        items = {
          title = "Beslaglæg illegale",
          description = "",
          seized = "~b~Dine ulovlige genstande er blevet beslaglagt."
        }
      },
      jail = {
        title = "Sæt i Isulasion",
        description = "",
        not_found = "~r~Intet fængslet blev fundet.",
        jailed = "~b~Fængslet.",
        unjailed = "~b~Løsladt.",
        notify_jailed = "~b~Du er blevet sat i iso.",
        notify_unjailed = "~b~Du er blevet løsladt."
      },
      fine = {
        title = "Bøde",
        description = "",
        fined = "~b~Bøde ~s~{2} ,- kr for ~b~{1}.",
        notify_fined = "~b~Du modtog en bøde ~s~ {2} ,- kr for ~b~{1}.",
        record = "[Fine] {2} € for {1}"
      },
      store_weapons = {
        title = "Læg våben i tasken",
        description = ""
      }
    },
    identity = {
      info = "<em>Fornavn: </em>{1}<br /><em>Efternavn: </em>{2}<br /><em>Alder: </em>{3}<br /><em>CPR-NUMMER: </em>{4}<br /><em>Mobil nummer: </em>{5}<br /><em>CVR NAVN: </em>{6}<br /><em>CVR Kapital: </em>{7} ,- kr<br /><em>Addresse: </em>{9} {8}"
    }
  },
  emergency = {
    menu = {
      revive = {
        title = "Genopliv",
        description = "",
        not_in_coma = "~r~Ikke i coma."
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
        prompt_number = "Mobil Nummer",
        prompt_name = "Fulde Navn",
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
      notify = "BESKEDEN~b~ {1}:~s~ ~n~{2}"
    },
    smspos = {
      notify = "SMS-Position ~b~ {1}"
    },
    service = {
      title = "Telefon bog",
      description = "",
      prompt = "Beskriv venligst dit problem, så meget som muligt..",
      ask_call = "Modtaget {1} Opkald, tager du det ? <em>{2}</em>",
      taken = "~r~Dette opkald er allerede taget af en anden."
    },
    announce = {
      title = "Reklamer",
      description = "Post en Reklame som bliver vist i et par sekunder for andre.",
      item_desc = "{1} €<br /><br/>{2}",
      prompt = "Reklame beskrivelse (10-1000 tegn): "
    }
  },
  emotes = {
    title = "Emotes",
    clear = {
      title = "> Stop",
      description = "Clear all running emotes."
    }
  },
  home = {
    buy = {
      title = "Køb",
      description = "Køb en lejlighed her, prisen er {1} ,- kr.",
      bought = "~g~Købt.",
      full = "~r~Boligblokken er dsv fuld.",
      have_home = "~r~Du har allerede en lejlighed."
    },
    sell = {
      title = "Sælg",
      description = "Sælg dit hjem for {1} ,- kr",
      sold = "~g~Solgt.",
      no_home = "~r~Du ejer ikke et hjem her."
    },
    intercom = {
      title = "Ring på",
      description = "Ring på enten dit eget nummer eller din nabo's.",
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
        description = "Smid alle besøgende, inklusive dig, Og lås hjemmet af."
      }
    },
    wardrobe = {
      title = "Klædeskab",
      save = {
        title = "> Save",
        prompt = "Save name:"
      }
    },
    gametable = {
      title = "Pokerbord",
      bet = {
        title = "Start bet",
        description = "Start a bet with players near you, the winner will be randomly selected.",
        prompt = "Bet amount:",
        request = "[BET] Do you want to bet {1} € ?",
        started = "~g~Bet started."
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
      info = "{1} €<br /><br />{2}"
    },
    sell = {
      title = "Sælg dit køretøj",
      description = ""
    },
    rent = {
      title = "Lej et køretøj",
      description = "Virker indtil du forlader byen."
    },
    store = {
      title = "Deporter køretøj",
      description = ""
    }
  },
  vehicle = {
    title = "Bil",
    no_owned_near = "~r~Du ejer ikke dette køretøj.",
    trunk = {
      title = "Baggagerum",
      description = "Åben bagagerum."
    },
    detach_trailer = {
      title = "Slip trailer",
      description = "Detach trailer."
    },
    detach_towtruck = {
      title = "Slip tow truck",
      description = "Detach tow truck."
    },
    detach_cargobob = {
      title = "Slip cargobob",
      description = "Detach cargobob."
    },
    lock = {
      title = "Lås &- Lås op",
      description = ""
    },
    engine = {
      title = "Tænd &- Sluk",
      description = ""
    },
    asktrunk = {
      title = "Spørg om at åbne baggagerum",
      asked = "~g~Spørger...",
      request = "Vil du åbne bagagerummet ?"
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
    info = "<em>Våben: </em> {1} ,- kr<br /><em>Skud: </em> {2} ,- kr/u<br /><br />{3}"
  },
  market = {
    title = "Butik ({1})",
    prompt = "Antal af {1} du ønsker at købe",
    info = "{1} €<br /><br />{2}"
  },
  skinshop = {
    title = "Tøj forretning"
  },
  cloakroom = {
    title = "Omklædningsrum({1})",
    undress = {
      title = "> Klæd af"
    }
  },
  itemtr = {
    informer = {
      title = "Illegal informer",
      description = "{1} €",
      bought = "~g~Position send til din GPS."
    }
  },
  mission = {
    blip = "Skrald ({1}) {2}/{3}",
    display = "<span class=\"name\">{1}</span> <span class=\"step\">{2}/{3}</span><br /><br />{4}",
    cancel = {
      title = "Anuller mission"
    }
  },
  aptitude = {
    title = "Evner",
    description = "Vis evner.",
    lose_exp = "Aptitude ~b~{1}/{2} ~r~-{3} ~s~exp.",
    earn_exp = "Aptitude ~b~{1}/{2} ~g~+{3} ~s~exp.",
    level_down = "Aptitude ~b~{1}/{2} ~r~lose level ({3}).",
    level_up = "Aptitude ~b~{1}/{2} ~g~level up ({3}).",
    display = {
      group = "{1}: ",
      aptitude = "--- {1} | exp {2} | lvl {3} | progress {4}%"
    }
  }
}

return lang
