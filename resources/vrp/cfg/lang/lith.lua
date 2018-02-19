
-- define all language properties

local lang = {
  common = {
    welcome = "Sveikas atvykes į serverį. Meniu rasite paspaude [K] raidę.~n~",
    no_player_near = "~r~Žaidėjo nėra prie jūsų.",
    invalid_value = "~r~Netinkama vertė.",
    invalid_name = "~r~Netinkamas vardas.",
    not_found = "~r~Nerasta.",
    request_refused = "~r~Prašymas atsisakytas.",
    wearing_uniform = "~r~Atsargiai, tu dėvi uniformą.",
    not_allowed = "~r~Neleidžiama."
  },
  weapon = {
    pistol = "Pistoletas"
  },  
  survival = {
    starving = "Badauji",
    thirsty = "Ištroškęs"
  },
  money = {
    display = "<span class=\"symbol\">€</span> {1}",
    bdisplay = "<span class=\"symbol\">€</span> {1}",
    given = "Duota ~r~{1}€.",
    received = "Gauta ~g~{1}€.",
    not_enough = "~r~Nepakanka pinigų.",
    paid = "Sumokėta ~r~{1}€.",
    give = {
      title = "Duoti pinigų",
      description = "Duoti pinigų artimiausiui žaidėjui.",
      prompt = "Suma:"
    }
  },
  inventory = {
    title = "Inventorius",
    description = "Atidaryti inventorių.",
    iteminfo = "({1})<br /><br />{2}<br /><em>{3} kg</em>",
    info_weight = "Svoris {1}/{2} kg",
    give = {
      title = "Duoti",
      description = "Duoti daiktą artimiausiui žaidėjui.",
      prompt = "Duoti: (daugiausiai {1}):",
      given = "Duota ~r~{1} ~s~{2}.",
      received = "Gauta ~g~{1} ~s~{2}.",
    },
    trash = {
      title = "Išmesti",
      description = "Sunaikinti daiktą.",
      prompt = "Išmesti: (daugiausiai {1}):",
      done = "Išmesta ~r~{1} ~s~{2}."
    },
    missing = "~r~Trūksta {2} {1}.",
    full = "~r~Inventorius pilnas.",
    chest = {
      title = "Dėžė",
      already_opened = "~r~Šią dėžę jau atidarė kitas asmuo.",
      full = "~r~Dėžė pilna.",
      take = {
        title = "Paimti",
        prompt = "Paimti (daugiausiai {1}):"
      },
      put = {
        title = "Įdėti",
        prompt = "Įdėti (daugiausiai {1}):"
      }
    }
  },
  atm = {
    title = "Bankomatas",
    info = {
      title = "Informacija",
      bank = "banke: {1} €"
    },
    deposit = {
      title = "Įdėti pinigų",
      description = "Galėsite įdėti pinigų į banką",
      prompt = "Įrašykite sumą pinigų kiek norėsite įdėti:",
      deposited = "~r~{1}€~s~ buvo sėkmingai įdėta."
    },
    withdraw = {
      title = "Nusiimti pinigų",
      description = "Galėsite nusiimti pinigų iš banko",
      prompt = "Įrašykite sumą kiek norėsite nusiimti:",
      withdrawn = "~g~{1}€ ~s~buvo nuimta iš banko.",
      not_enough = "~r~Tu neturi pakankamai pinigų banke."
    }
  },
  business = {
    title = "Prekybos rūmai",
    directory = {
      title = "Katalogas",
      description = "Verslo katalogas.",
      dprev = "> Ankstesnis",
      dnext = "> Kitas",
      info = "<em>Turtas: </em>{1} €<br /><em>Savininkas: </em>{2} {3}<br /><em>Registracijos n°: </em>{4}<br /><em>Numeris: </em>{5}"
    },
    info = {
      title = "Verslo informacija",
      info = "<em>Vardas: </em>{1}<br /><em>Kapitalas: </em>{2} €<br /><em>Kapitalo pervedimas: </em>{3} €<br /><br/>Kapitalo pervedimas yra per verslo ekonominį laikotarpį pervestų pinigų suma, maksimalus verslo kapitalas."
    },
    addcapital = {
      title = "Pridėti kapitalą",
      description = "Pridėti kapitalą į biznį.",
      prompt = "Įveskite suma kiek norite įdėti į kapitalą:",
      added = "~r~{1}€ ~s~pridėta į biznio kapitalą."
    },
    launder = {
      title = "Pinigų plovimas",
      description = "Naudok savo biznį pinigų plovimui.",
      prompt = "Įveskite sumą kiek norite įdėti pinigų (daugiausiai {1} €): ",
      laundered = "~g~{1}€ ~s~praplauti.",
      not_enough = "~r~Nepakanka nešvarių pinigų."
    },
    open = {
      title = "Atidaryti biznį",
      description = "Atidarykite savo biznį, minimalus kapitalas {1} €.",
      prompt_name = "Biznio pavadinimas (pakeisti bus negalima, daugiausiai {1} raidžių):",
      prompt_capital = "Pradinis kapitalas (min {1})",
      created = "~g~Biznis sukurtas."
      
    }
  },
  cityhall = {
    title = "Miesto rotušė",
    identity = {
      title = "Nauja tapatybė",
      description = "Sukurkiti naują tapatybę, kainuoja = {1} €.",
      prompt_firstname = "Įveskite savo vardą:",
      prompt_name = "Įveskite savo pavardę:",
      prompt_age = "Įveskite savo amžių:",
    },
    menu = {
      title = "Tapatybė",
      info = "<em>Vardas: </em>{2}<br /><em>Pavardė: </em>{1}<br /><em>Amžius: </em>{3}<br /><em>Registracijos n°: </em>{4}<br /><em>Numeris: </em>{5}<br /><em>Adresas: </em>{7}, {6}"
    }
  },
  police = {
    title = "Policija",
    wanted = "Ieškomumo lygis {1}",
    not_handcuffed = "~r~Nesurakintas",
    cloakroom = {
      title = "Rūbinė",
      uniform = {
        title = "Uniforma",
        description = "Užsidėti uniformą."
      }
    },
    pc = {
      title = "PC",
      searchreg = {
        title = "Registracijos paieška",
        description = "Ieškokite tapatybės pagal registraciją.",
        prompt = "Įveskite registracijos numerį:"
      },
      closebusiness = {
        title = "Uždaryti biznį",
        description = "Uždaryti artimiausio žaidėjo biznį.",
        request = "Ar tikrai uždarote biznį {3} savininko {1} {2} ?",
        closed = "~g~Biznis uždarytas."
      },
      trackveh = {
        title = "Surasti transportą",
        description = "Surasti transporto priemonę pagal registracijos numerį.",
        prompt_reg = "Įveskite registracijos numerį:",
        prompt_note = "Įveskite sekimo pastabą / priežastį:",
        tracking = "~b~Sekimas pradėtas.",
        track_failed = "~b~Sekimas {1}~s~ ({2}) ~n~~r~nepavyko.",
        tracked = "Sekamas {1} ({2})"
      },
      records = {
        show = {
          title = "Rodyti įrašus",
          description = "Rodyti policijos įrašus pagal registracijos numerį."
        },
        delete = {
          title = "Išvalyti įrašus",
          description = "Išvalyti policijos įrašus pagal registracijos numerį.",
          deleted = "~b~Policijos įrašai ištrinti"
        }
      }
    },
    menu = {
      handcuff = {
        title = "Antrankiai",
        description = "Surakinti/Atrakinti artimiausią žaidėją."
      },
      putinveh = {
        title = "Įsodinti į transporto priemonę",
        description = "Įsodinti surakinta žaidėja į keleivio vietą."
      },
      getoutveh = {
        title = "Išsodinti žaidėją iš transporto",
        description = "Išsodinti surakinta žaidėja iš transporto priemonės."
      },
      askid = {
        title = "Patikrinti ID",
        description = "Paprašyti tapatybės kortelės artimiausio žaidėjo.",
        request = "Ar norite parodyti savo tapatybės kortelę?",
        request_hide = "Slėpti asmens tapatybės kortelę.",
        asked = "Paklausta tapatybės kortelės..."
      },
      check = {
        title = "Patikrinti žaidėja",
        description = "Patikrinti pinigus, inventorių ir ginklus artimiausio žaidėjo.",
        request_hide = "Slėpti ataskaitą.",
        info = "<em>Pinigai: </em>{1} €<br /><br /><em>Inventorius: </em>{2}<br /><br /><em>Ginklai: </em>{3}",
        checked = "Tu buvai patikrintas pareigūno."
      },
      seize = {
        seized = "Konfiskuoti {2} ~r~{1}",
        weapons = {
          title = "Konfiskuoti ginklus",
          description = "Konfiskuoti artimiausio žaidėjo ginklus",
          seized = "~b~Tavo ginklai buvo konfiskuoti."
        },
        items = {
          title = "Konfiskuoti nelegalius",
          description = "Konfiskuoti neteisėtus daiktus",
          seized = "~b~Jūsų neteisėta medžiaga buvo konfiskuota."
        }
      },
      jail = {
        title = "Kalėjimas",
        description = "Pasodinti arba paleisti artimiausią žaidėja iš kalėjimo.",
        not_found = "~r~Nerastas kalėjimas.",
        jailed = "~b~Pasodintas.",
        unjailed = "~b~Paleistas.",
        notify_jailed = "~b~Tu buvai pasodintas į kalėjimą.",
        notify_unjailed = "~b~Tu buvai paleistas iš kalėjimo."
      },
      fine = {
        title = "Bauda",
        description = "Pasiulyti artimiausiui žaidėjui bauda.",
        fined = "~b~Sumokėjo ~s~{2} € už ~b~{1}.",
        notify_fined = "~b~Tau buvo paskirta bauda ~s~ {2} € už ~b~{1}.",
        record = "[Bauda] {2} € už {1}"
      },
      store_weapons = {
        title = "Idėti ginklus",
        description = "Idėti ginklus į inventorių."
      }
    },
    identity = {
      info = "<em>Vardas: </em>{1}<br /><em>Pavardė: </em>{2}<br /><em>Amžius: </em>{3}<br /><em>Registracijos n°: </em>{4}<br /><em>Numeris: </em>{5}<br /><em>Biznis: </em>{6}<br /><em>Biznio kapitalas: </em>{7} €<br /><em>Adresas: </em>{9}, {8}"
    }
  },
  emergency = {
    menu = {
      revive = {
        title = "Prikelti",
        description = "Prikelti artimiausia žaidėją.",
        not_in_coma = "~r~Žaidėjas ne komoje."
      }
    }
  },
  phone = {
    title = "Telefonas",
    directory = {
      title = "Katalogas",
      description = "Atidaryti telefono katalogą.",
      add = {
        title = "➕ Pridėti",
        prompt_number = "Įveskite telefono numerį kad pridėtumėte:",
        prompt_name = "Įveskite varda:",
        added = "~g~Telefono numeris buvo pridėtas."
      },
      sendsms = {
        title = "Siūsti SMS",
        prompt = "Įveskite žinutę (daugiausiai {1} raidžių):",
        sent = "~g~ Nusiusta n°{1}.",
        not_sent = "~r~ n°{1} nepasiekemas."
      },
      sendpos = {
        title = "Siųsti poziciją",
      },
      remove = {
        title = "Pašalinti"
      }
    },
    sms = {
      title = "SMS istorija",
      description = "Gauta SMS istorija.",
      info = "<em>{1}</em><br /><br />{2}",
      notify = "SMS~b~ {1}:~s~ ~n~{2}"
    },
    smspos = {
      notify = "SMS-pozicija ~b~ {1}"
    },
    service = {
      title = "Tarnyba",
      description = "Skambinkite tarnybai arba skubios pagalbos numeriu.",
      prompt = "Jei reikia, įveskite pranešimą tarnybai:",
      ask_call = "Numeris {1} skambina, ar norite atsiliepti ? <em>{2}</em>",
      taken = "~r~Šis skambutis jau priimtas."
    },
    announce = {
      title = "Skelbti",
      description = "Paskelbkite skelbimą, kuris bus rodomas visiems kelias sekundes.",
      item_desc = "{1} €<br /><br/>{2}",
      prompt = "Skelbti turinį (nuo 10-1000 raidžių): "
    }
  },
  emotes = {
    title = "Jausmai",
    clear = {
      title = "> Išvalyti",
      description = "Išvalyti visus paleistus jausmus."
    }
  },
  home = {
    buy = {
      title = "Prikti",
      description = "Įsigykite namą čia, kaina yra {1} €.",
      bought = "~g~Nupirkta.",
      full = "~r~Vieta yra pilna.",
      have_home = "~r~Jau turite namus."
    },
    sell = {
      title = "Parduoti",
      description = "Parduok savo namus už {1} €",
      sold = "~g~Parduota.",
      no_home = "~r~Tu neturi namų čia."
    },
    intercom = {
      title = "Durų raktas",
      description = "Naudok durų raktą arba kodą kad įeitumėte į namus",
      prompt = "Numeris:",
      not_available = "~r~Nepasiekiamas.",
      refused = "~r~Atsisakė įeiti.",
      prompt_who = "Pasakyk kas tu esi:",
      asked = "Klausiama...",
      request = "Kažkas nori atidaryti tavo namų duris: <em>{1}</em>"
    },
    slot = {
      leave = {
        title = "Palikti"
      },
      ejectall = {
        title = "Išmesti visus",
        description = "Išmesti visus žmones iš namo."
      }
    },
    wardrobe = {
      title = "Drabužinė",
      save = {
        title = "> Išsaugoti",
        prompt = "Išsaugoti varda:"
      }
    },
    gametable = {
      title = "Žaidimo stalas",
      bet = {
        title = "Pradėti statymą",
        description = "Pradėkite statymą su šalia esančiais žaidėjais, nugalėtojas bus atsitiktinai parinktas.",
        prompt = "Statymo suma:",
        request = "[Statymas] Ar norite statyti {1} € ?",
        started = "~g~Statymas prasidėjo."
      }
    }
  },
  garage = {
    title = "Garažas ({1})",
    owned = {
      title = "Priklauso žaidėjui",
      description = "Savininko automobiliai."
    },
    buy = {
      title = "Prikti",
      description = "Pirkti transporto priemones.",
      info = "{1} €<br /><br />{2}"
    },
    sell = {
      title = "Parduoti",
      description = "Parduoti automobilius."
    },
    rent = {
      title = "Nuoma",
      description = "Nuomokite transporto priemonę (kol atsijungsite)."
    },
    store = {
      title = "Pastatyti į garažą",
      description = "Pastatyti savo dabartinę transporto priemonę į garažą."
    }
  },
  vehicle = {
    title = "Transporto priemonė",
    no_owned_near = "~r~Nėra jokio nuosavo automobilio šalia.",
    trunk = {
      title = "Bagažinė",
      description = "Atidarykite transporto priemonės bagažine."
    },
    detach_trailer = {
      title = "Atkabinti priekabą",
      description = "Atkabinsite priekabą."
    },
    detach_towtruck = {
      title = "Atkabinti vilkika",
      description = "Atkabinsite vilkika."
    },
    detach_cargobob = {
      title = "Atkabinti krovininį lėktuvą",
      description = "Atkabinsite krovininį lėktuvą."
    },
    lock = {
      title = "Užrakinti/Atrakinti",
      description = "Užrakinsite arba atrakinsite automobilį."
    },
    engine = {
      title = "Variklį užkurti/užgesinti",
      description = "Užkursite arba užgesinsite savo transporto priemonės variklį."
    },
    asktrunk = {
      title = "Paklausti atidaryti bagažine",
      asked = "~g~Klausiama...",
      request = "Ar norite atidaryti bagažine ?"
    },
    replace = {
      title = "Pakeiskite automobilį",
      description = "Pakeiskiti artimiausią automobilį."
    },
    repair = {
      title = "Remontuoti automobilį",
      description = "Remontuosite artimiausią automobilį."
    }
  },
  gunshop = {
    title = "Ginklų parduotuvė ({1})",
    prompt_ammo = "AMMO kiekis, kurį reikia nusipirkti {1}:",
    info = "<em>Ginklas: </em> {1} €<br /><em>ammo: </em> {2} €/u<br /><br />{3}"
  },
  market = {
    title = "Parduotuvė ({1})",
    prompt = "Suma {1} norite nusipirkti:",
    info = "{1} €<br /><br />{2}"
  },
  skinshop = {
    title = "Išvaizda"
  },
  cloakroom = {
    title = "Rūbinė ({1})",
    undress = {
      title = "> Persirengti"
    }
  },
  itemtr = {
    informer = {
      title = "Neteisėtas informatorius",
      description = "{1} $",
      bought = "~g~Pozicija išsiųsta į jūsų GPS."
    }
  },
  mission = {
    blip = "Misija ({1}) {2}/{3}",
    display = "<span class=\"Vardas\">{1}</span> <span class=\"step\">{2}/{3}</span><br /><br />{4}",
    cancel = {
      title = "Atšaukti misiją"
    }
  },
  aptitude = {
    title = "Įgūdžiai",
    description = "Parodyti įgūdžius.",
    lose_exp = "Įgūdis ~b~{1}/{2} ~r~-{3} ~s~prarasti exp.",
    earn_exp = "Įgūdis ~b~{1}/{2} ~g~+{3} ~s~gauti exp.",
    level_down = "Įgūdis ~b~{1}/{2} ~r~prarasti lygį ({3}).",
    level_up = "Aptitude ~b~{1}/{2} ~g~pasikelti lygį ({3}).",
    display = {
      group = "{1}: ",
      aptitude = "--- {1} | exp {2} | lvl {3} | progresas {4}%"
    }
  }
}

return lang
