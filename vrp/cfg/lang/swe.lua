
-- define all language properties

local lang = {
  common = {
    welcome = "Välkommen till servern. tryck K för att öppna menyn.~n~",
    no_player_near = "~r~ingen spelare nära.",
    invalid_value = "~r~Ogiltig värde.",
    invalid_name = "~r~Ogiltig namn.",
    not_found = "~r~Hittades inte.",
    request_refused = "~r~Förfrågan nekad.",
    wearing_uniform = "~r~Var försiktig, du har en uniform.",
    not_allowed = "~r~Inte tillåtet."
  },
  weapon = {
    pistol = "Pistol"
  },  
  survival = {
    starving = "hungrig",
    thirsty = "törstig"
  },
  money = {
    display = "<span class=\"symbol\">$</span> {1}",
    bdisplay = "<span class=\"symbol\">$</span> {1}",
    given = "Ger ~r~{1}$.",
    received = "Mottagen ~g~{1}$.",
    not_enough = "~r~förlite med pengar.",
    paid = "betald ~r~{1}$.",
    give = {
      title = "Ger Pengar",
      description = "Ger pengar till närmste spelare.",
      prompt = "Belopp att ge:"
    }
  },
  inventory = {
    title = "Inventory",
    description = "öppnat inventory.",
    iteminfo = "({1})<br /><br />{2}<br /><em>{3} kg</em>",
    info_weight = "Vikt {1}/{2} kg",
    give = {
      title = "Ge",
      description = "Ge objekt till närmaste spelare.",
      prompt = "Belopp att ge (max {1}):",
      given = "Ger ~r~{1} ~s~{2}.",
      received = "Mottagen ~g~{1} ~s~{2}.",
    },
    trash = {
      title = "skräp",
      description = "Förstör objekt.",
      prompt = "Belop till skräp (max {1}):",
      done = "slängt ~r~{1} ~s~{2}."
    },
    missing = "~r~uppdrag {2} {1}.",
    full = "~r~Inventory full.",
    chest = {
      title = "Låda",
      already_opened = "~r~låda är redan öppen av någon annan.",
      full = "~r~Lådan är full.",
      take = {
        title = "Ta",
        prompt = "Belop att ta (max {1}):"
      },
      put = {
        title = "Sätta",
        prompt = "Belopp att sätta (max {1}):"
      }
    }
  },
  atm = {
    title = "Bankomat",
    info = {
      title = "Info",
      bank = "bank: {1} $"
    },
    deposit = {
      title = "insättning",
      description = "plånbok till bank",
      prompt = "skriv in summan du vill lägga in:",
      deposited = "~r~{1}$~s~ insättning."
    },
    withdraw = {
      title = "Ta ut",
      description = "bank till spelare",
      prompt = "skriv in summan du vill ta ut:",
      withdrawn = "~g~{1}$ ~s~withdrawn.",
      not_enough = "~r~du har inte tillräckligt med pengar på banken."
    }
  },
  business = {
    title = "Handelskammare",
    directory = {
      title = "katalog",
      description = "Företagskatalog.",
      dprev = "> Bakåt",
      dnext = "> Nästa",
      info = "<em>huvudstad: </em>{1} $<br /><em>ägare: </em>{2} {3}<br /><em>registrering nr: </em>{4}<br /><em>Telefon: </em>{5}"
    },
    info = {
      title = "Företags Info",
      info = "<em>namn: </em>{1}<br /><em>huvudstad: </em>{2} $<br /><em>kapitalöverföring: </em>{3} $<br /><br/>Kapitalöverföring är det belopp som överförts för en ekonomisk period, maximalt är rörelsekapitalet."    },
    addcapital = {
      title = "Lägg till kapital",
      description = "	.",
      prompt = "Belopp som ska läggas till företagskapitalet:",
      added = "~r~{1}$ ~s~läggas till affärskapitalet."
    },
    launder = {
      title = "Pengatvätt",
      description = "Använd ditt företag för att tvätta smutsiga pengar.",
      prompt = "Mängden smutsiga pengar som tvättas (max {1} $): ",
      laundered = "~g~{1}$ ~s~tvättas.",
      not_enough = "~r~Inte tillräckligt smutspengar."
    },
    open = {
      title = "Öppna Företag",
      description = "Öppna ditt Företag , minsta Kapital {1} $.",
      prompt_name = "Företags namn (Kan inte ändras tillbaka, max {1} chars):",
      prompt_capital = "Startkapital (min {1})",
      created = "~g~Företaget skapats."
      
    }
  },
  cityhall = {
    title = "Stadshus",
    identity = {
      title = "Ny identitet",
      description = "Skapa ny Identitet, cost = {1} $.",
      prompt_firstname = "Skriv ditt Förnamn:",
      prompt_name = "Skriv ditt Efternamn:",
      prompt_age = "Skriv din Ålder:",
    },
    menu = {
      title = "Identitet",
      info = "<em>Förnamn: </em>{2}<br /><em>Efternamn: </em>{1}<br /><em>Ålder: </em>{3}<br /><em>Registrering nr: </em>{4}<br /><em>Telefon: </em>{5}<br /><em>Address: </em>{7}, {6}"
    }
  },
  police = {
    title = "Polis",
    wanted = "Efterlyst Nivå {1}",
    not_handcuffed = "~r~ej handbojor",
    cloakroom = {
      title = "Garderob",
      uniform = {
        title = "Uniform",
        description = "sätt på uniform."
      }
    },
    pc = {
      title = "PC",
      searchreg = {
        title = "Registrerings Sökning",
        description = "Sök identitet genom registrering.",
        prompt = "Ange registreringsnummer:"
      },
      closebusiness = {
        title = "Stäng Företag",
        description = "Stäng Företaget för närmste spelare.",
        request = "Är du säker på att du vill stänga ditt företag? {3} owned by {1} {2} ?",
        closed = "~g~Företag Stängt."
      },
      trackveh = {
        title = "Spåra Fordon",
        description = "Spåra ett fordon med sitt registreringsnummer.",
        prompt_reg = "Skriv in registreringsnummer:",
        prompt_note = "Ange en spårning anteckning/orsak:",
        tracking = "~b~Spårning started.",
        track_failed = "~b~Spårning av {1}~s~ ({2}) ~n~~r~Misslyckandes.",
        tracked = "Spårad {1} ({2})"
      },
      records = {
        show = {
          title = "Visa uppgifter",
          description = "Visa Polis uppgifter av Registreringsnummer."
        },
        delete = {
          title = "Rensa uppgifter",
          description = "Rensa polisregister med registreringsnummer.",
          deleted = "~b~Polisens register raderas"
        }
      }
    },
    menu = {
      handcuff = {
        title = "handbojor",
        description = "sätt/ta bort handbojor närmsta spelare."
      },
      putinveh = {
        title = "Sätt i fordon",
        description = "Placera närmaste fängslad Spelare i närmaste bil, som passagerare."
      },
      getoutveh = {
        title = "Ta spelare ur bilen",
        description = "Gå ut ur fordonet närmaste spelare med hanbojor."
      },
      askid = {
        title = "Fråga om ID",
        description = "Fråga om ID kort från närmste spelare.",
        request = "Vill du ge ditt ID kort?",
        request_hide = "Göm ID kort.",
        asked = "Fråga om ID..."
      },
      check = {
        title = "Kontrollera spelaren",
        description = "kontrollera spelarens pengar, inventory och vapen från närmaste spelare.",
        request_hide = "Dölj kontrollrapporten.",
        info = "<em>Pengar: </em>{1} $<br /><br /><em>inventory: </em>{2}<br /><br /><em>vapen: </em>{3}",
        checked = "Du har kontrollerats."
      },
      seize = {
        seized = "Grep/ta {2} ~r~{1}",
        weapons = {
          title = "Ta Vapen",
          description = "Ta Närmste spelares Vapen",
          seized = "~b~Dina vapen har beslagtagits."
        },
        items = {
          title = "Gripa illegaler",
          description = "beslagtagits olagliga föremål",
          seized = "~b~Dina olagliga saker har beslagtagits."
        }
      },
      jail = {
        title = "Fängelse",
        description = "sätt / släpp närmste spelare I/från Närmste Fängelse.",
        not_found = "~r~inget fängelse hittades.",
        jailed = "~b~Fängslad.",
        unjailed = "~b~Fritagen.",
        notify_jailed = "~b~Du har blivit fängslad.",
        notify_unjailed = "~b~Du har blivit Fri Släppt."
      },
      fine = {
        title = "Böter",
        description = "Bötfäll närmste spelare.",
        fined = "~b~bötfälld ~s~{2} $ for ~b~{1}.",
        notify_fined = "~b~Du har blivit bötfälld ~s~ {2} $ for ~b~{1}.",
        record = "[Böter] {2} $ for {1}"
      },
      store_weapons = {
        title = "Förvara Vapen",
        description = "Förvara ditt vapen i inventory."
      }
    },
    identity = {
      info = "<em>namn: </em>{1}<br /><em>förnamn: </em>{2}<br /><em>ålder: </em>{3}<br /><em>Registrering nr: </em>{4}<br /><em>Telefon: </em>{5}<br /><em>Företag: </em>{6}<br /><em>Företagskapital: </em>{7} $<br /><em>Address: </em>{9}, {8}"
    }
  },
  emergency = {
    menu = {
      revive = {
        title = "Återuppliva",
        description = "Återuppliva närmaste spelare.",
        not_in_coma = "~r~Inte i Koma."
      }
    }
  },
  phone = {
    title = "Telefon",
    directory = {
      title = "katalog",
      description = "Öppna Telefon's katalog.",
      add = {
        title = "➕ adda",
        prompt_number = "Skriv in Telefon nummer för att adda:",
        prompt_name = "Skriv Namn på spelare's nummer:",
        added = "~g~Nummer Lagts till."
      },
      sendsms = {
        title = "skicka SMS",
        prompt = "Skriv ett SMS (max {1} chars):",
        sent = "~g~ Skickat till Nummer{1}.",
        not_sent = "~r~ Nummer{1} inte tillgänglig."
      },
      sendpos = {
        title = "Skicka position",
      },
      remove = {
        title = "Tabort"
      }
    },
    sms = {
      title = "SMS Historik",
      description = "Mottagna SMS-historik.",
      info = "<em>{1}</em><br /><br />{2}",
      notify = "SMS~b~ {1}:~s~ ~n~{2}"
    },
    smspos = {
      notify = "SMS-Position ~b~ {1}"
    },
    service = {
      title = "tjänst",
      description = "Ring en tjänst eller ett nödnummer.",
      prompt = "Ange vid behov ett meddelande för tjänsten:",
      ask_call = "Mottagen {1} Ringer, Tar du det ? <em>{2}</em>",
      taken = "~r~Detta samtal är redan tagit av en kollega."
    },
    announce = {
      title = "annonsera",
      description = "Skicka en annonsering synlig för alla i några sekunder.",
      item_desc = "{1} $<br /><br/>{2}",
      prompt = "Meddela innehåll (10-1000 chars): "
    }
  },
  emotes = {
    title = "Emotes",
    clear = {
      title = "> rensa",
      description = "Rensa alla valda emotes."
    }
  },
  home = {
    buy = {
      title = "Köp",
      description = "Köp ett hem här, price is {1} $.",
      bought = "~g~Köpt.",
      full = "~r~Platsen är full.",
      have_home = "~r~Du äger redan ett Hem."
    },
    sell = {
      title = "sälj",
      description = "Sälja ditt hem för {1} $",
      sold = "~g~Sålt.",
      no_home = "~r~Du har inget hem här."
    },
    intercom = {
      title = "Porttelefon",
      description = "Använd porttelefon för att komma in i ett hem.",
      prompt = "Nummer:",
      not_available = "~r~Inte Tillgänglig.",
      refused = "~r~Vägra att komma in.",
      prompt_who = "Frågar Vem du är:",
      asked = "Frågar...",
      request = "Någon Ringer på din porttelefon: <em>{1}</em>"
    },
    slot = {
      leave = {
        title = "Lämna/gå ut"
      },
      ejectall = {
        title = "Gå ut med alla",
        description = "Tar ut alla besökare. Plus dig själv och stänger hemmet."
      }
    },
    wardrobe = {
      title = "Garderob",
      save = {
        title = "> Spara",
        prompt = "Spar Namnet:"
      }
    },
    gametable = {
      title = "Spelbord",
      bet = {
        title = "Starta ett bet",
        description = "Starta ett bet med spelare nära dig, Vinnaren blir Slumpmässigt vald.",
        prompt = "Lägg summa:",
        request = "[BET] vill du lägga ett bet {1} $ ?",
        started = "~g~Bettet har lagts."
      }
    }
  },
  garage = {
    title = "Garage ({1})",
    owned = {
      title = "Ägd",
      description = "Ägda fordon."
    },
    buy = {
      title = "Köp",
      description = "Köp Fordon.",
      info = "{1} $<br /><br />{2}"
    },
    sell = {
      title = "Sälj",
      description = "Sälj Fordon."
    },
    rent = {
      title = "Hyr",
      description = "Hyr ett fordon för sessionen (tills du loggar ut)."
    },
    store = {
      title = "Spara",
      description = "Spara ditt fordon i garaget."
    }
  },
  vehicle = {
    title = "Fordon",
    no_owned_near = "~r~Inget ägt fordon nära dig.",
    trunk = {
      title = "bagageutrymme",
      description = "Öppna fordonets bagageutrymme."
    },
    detach_trailer = {
      title = "Lossa släpvagnen",
      description = "Lossa släpvagnen."
    },
    detach_towtruck = {
      title = "Lossna från Bärgningsbil",
      description = "Lossna från Bärgningsbil."
    },
    detach_cargobob = {
      title = "Lossna cargobob",
      description = "Lossna cargobob."
    },
    lock = {
      title = "Lås/Olåst",
      description = "Lås eller lås upp ditt fordon."
    },
    engine = {
      title = "Motor På/av",
      description = "Starta eller stänga av motorn."
    },
    asktrunk = {
      title = "Fråga om att öppen bagagelucka",
      asked = "~g~Frågar...",
      request = "Vill Du öppna bagageluckan ?"
    },
    replace = {
      title = "Byt Fordon",
      description = "Byt ut det närmaste fordonet på marken."
    },
    repair = {
      title = "Reparera Fordon",
      description = "Reparera Frodonet."
    }
  },
  gunshop = {
    title = "VapenButik ({1})",
    prompt_ammo = "Mängden ammunition att köpa för {1}:",
    info = "<em>body: </em> {1} $<br /><em>ammunition: </em> {2} $/u<br /><br />{3}"
  },
  market = {
    title = "Marknad ({1})",
    prompt = "	Mängd av {1} att köpa:",
    info = "{1} $<br /><br />{2}"
  },
  skinshop = {
    title = "Klädbutik"
  },
  cloakroom = {
    title = "Garderob ({1})",
    undress = {
      title = "> Klä av"
    }
  },
  itemtr = {
    informer = {
      title = "Olaglig Angivare",
      description = "{1} $",
      bought = "~g~Position skickad till din GPS."
    }
  },
  mission = {
    blip = "Uppdrag ({1}) {2}/{3}",
    display = "<span class=\"namn\">{1}</span> <span class=\"step\">{2}/{3}</span><br /><br />{4}",
    cancel = {
      title = "Avbryt uppdraget"
    }
  },
  aptitude = {
    title = "färdigheter",
    description = "visa färdigheter.",
    lose_exp = "färdigheter ~b~{1}/{2} ~r~-{3} ~s~exp.",
    earn_exp = "färdigheter ~b~{1}/{2} ~g~+{3} ~s~exp.",
    level_down = "färdigheter ~b~{1}/{2} ~r~lose level ({3}).",
    level_up = "färdigheter ~b~{1}/{2} ~g~level up ({3}).",
    display = {
      group = "{1}: ",
      aptitude = "--- {1} | exp {2} | lvl {3} | framsteg {4}%"
    }
  }
}

return lang
