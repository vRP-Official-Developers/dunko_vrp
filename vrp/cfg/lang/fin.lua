
-- define all language properties             Transaltion by Baavoz

local lang = {
  common = {
    welcome = "Tervetuloa serverille paina K avataksesi menu.~n~",
    no_player_near = "~r~Ei pelaajia lähellä.",
    invalid_value = "~r~Virheellinen arvo.",
    invalid_name = "~r~Virheellinen nimi.",
    not_found = "~r~ei löytynyt.",
    request_refused = "~r~Pyyntö hylätty .",
    wearing_uniform = "~r~ole varovainen käytöt uniformua.",
    not_allowed = "~r~Ei ole sallittua."
  },
  weapon = {
    pistol = "Pistooli"
  },  
  survival = {
    starving = "Nälkä",
    thirsty = "Jano"
  },
  money = {
    display = "<span class=\"symbol\">$</span> {1}",
    bdisplay = "<span class=\"symbol\">$</span> {1}",
    given = "Annettu ~r~{1}$.",
    received = "Saatu ~g~{1}$.",
    not_enough = "~r~Ei tarpeeksi rahaa.",
    paid = "Maksettu ~r~{1}$.",
    give = {
      title = "Anna rahaa",
      description = "Anna rahaa lähimmälle pelaajalle.",
      prompt = "Annettava määrä:"
    }
  },
  inventory = {
    title = "Reppu",
    description = "Avaa reppu.",
    iteminfo = "({1})<br /><br />{2}<br /><em>{3} kg</em>",
    info_weight = "Paino {1}/{2} kg",
    give = {
      title = "Anna",
      description = "Anna tavaroita lähimmälle pelaajalle.",
      prompt = "Annettava määrä(max {1}):",
      given = "Annettu ~r~{1} ~s~{2}.",
      received = "Saatu ~g~{1} ~s~{2}.",
    },
    trash = {
      title = "roska",
      description = "Tuhoa tavaroita.",
      prompt = "Määrä roskata (max {1}):",
      done = "Roskattu ~r~{1} ~s~{2}."
    },
    missing = "~r~Puuttuva {2} {1}.",
    full = "~r~Reppu täynnä.",
    chest = {
      title = "Arkku",
      already_opened = "~r~Joku muu on jo avannut tämän arkun :(.",
      full = "~r~Arkku on täynnä.",
      take = {
        title = "Ota",
        prompt = "Otettava määrä (max {1}):"
      },
      put = {
        title = "Laita",
        prompt = "Laitettava määrä (max {1}):"
      }
    }
  },
  atm = {
    title = "Pankkiautomaatti",
    info = {
      title = "Info",
      bank = "Pankki: {1} $"
    },
    deposit = {
      title = "Talleta",
      description = "lompakosta pankkiin",
      prompt = "Anna talletettavan rahan määrä:",
      deposited = "~r~{1}$~s~ talletettu."
    },
    withdraw = {
      title = "Nosta",
      description = "pankista lompakkoon",
      prompt = "Anna nostettavan rahan määrä:",
      withdrawn = "~g~{1}$ ~s~nostettu.",
      not_enough = "~r~Sinulla ei ole tarpeeksi rahaa pankissa."
    }
  },
  business = {
    title = "Kauppakamari",
    directory = {
      title = "Hakemisto",
      description = "Luiiketoiminta hakemisto.",
      dprev = "> Edellinen",
      dnext = "> Seuraava",
      info = "<em>Pääoma: </em>{1} $<br /><em>omistaja: </em>{2} {3}<br /><em>rekisteröinti n°: </em>{4}<br /><em>puhelin: </em>{5}"
    },
    info = {
      title = "Yrityksen tietoja",
      info = "<em>nimi: </em>{1}<br /><em>pääoma: </em>{2} $<br /><em>pääoman siirto: </em>{3} $<br /><br/>pääoma siirto on liiketoiminnan taloudellisen ajanjakson aikana siirretty rahamäärä, enimmäismäärä on liiketoiminan pääoma."
    },
    addpääoma = {
      title = "Lisää pääomaa",
      description = "AddLisää pääomaa yritykseesi.",
      prompt = "Määrä pääomaa listtävänä yritykseesi",
      added = "~r~{1}$ ~s~pää omaa lisätyy yritykseen."
    },
    launder = {
      title = "Rahan pesu",
      description = "Käytä yritystäsi rahanpesuun.",
      prompt = "Määrä likaista rahaa pestävänä (max {1} $): ",
      laundered = "~g~{1}$ ~s~pestynä.",
      not_enough = "~r~Ei tarpeeksi likaistarahaa."
    },
    open = {
      title = "Avaa yritys",
      description = "Avaa yrityksesi, minimi pääoma on {1} $.",
      prompt_name = "Yrityksen nimi (ei voi vaihtaa myöhemmin, max {1} merkkiä):",
      prompt_pääoma = "Alku pääoma (min {1})",
      created = "~g~yritys luotu."
      
    }
  },
  cityhall = {
    title = "Kaupungin talo",
    identity = {
      title = "Uusi identiteetti",
      description = "Luo uusi identiteetti, maksaa = {1} $.",
      prompt_firstname = "Anna etunimi:",
      prompt_name = "Anna sukunimi:",
      prompt_age = "Anna ikäsi:",
    },
    menu = {
      title = "Identiteetti",
      info = "<em>Etunimi: </em>{2}<br /><em>Sukunimi: </em>{1}<br /><em>Ikä: </em>{3}<br /><em>Rekisteröintuí n°: </em>{4}<br /><em>Puhelin: </em>{5}<br /><em>Osoite: </em>{7}, {6}"
    }
  },
  police = {
    title = "Poliisi",
    wanted = "Haluttu sijoitus {1}",
    not_handcuffed = "~r~EI ole käsiraudoitettu",
    cloakroom = {
      title = "Vaatehuone",
      uniform = {
        title = "Työvaate",
        description = "Laita työvaate."
      }
    },
    pc = {
      title = "PC",
      searchreg = {
        title = "Rekisteri haku",
        description = "Etsi identiteettiä rekisteristä.",
        prompt = "Anna rekisterinumero:"
      },
      closebusiness = {
        title = "Sulje yritys",
        description = "Sulje lähimmän pelaajan yritys.",
        request = "Oletko varma että haluat poistaa yrityksen. {3} Omistaja {1} {2} ?",
        closed = "~g~yritys suljettu."
      },
      trackveh = {
        title = "Jäljitä kulkuneuvo",
        description = "Jäljitä kulkuneuvo sen rekisterinumerolla.",
        prompt_reg = "Anna rekisterinumero:",
        prompt_note = "Anna jäljitys merkintä/syy:",
        tracking = "~b~Jäljitys aloitettu.",
        track_failed = "~b~Jäljitys {1}~s~ ({2}) ~n~~r~Epäonnistui.",
        tracked = "Jäljitetty {1} ({2})"
      },
      records = {
        show = {
          title = "Näytä kirjaukset",
          description = "Näytä poliisin kirjaukset rekisteröintinumeron mukaan."
        },
        delete = {
          title = "Siivoa kirjaukset",
          description = "Siivoa poliisi rekisteröinnit rekisterinumeron mukaan.",
          deleted = "~b~Poliisi kirjaukset poistettu"
        }
      }
    },
    menu = {
      handcuff = {
        title = "Käsiraudat",
        description = "Käsiraudoita lähin pelaaja."
      },
      putinveh = {
        title = "Laita kulkuneuvoon",
        description = "Laita lähin käsirautoitettu ajoneuvvoosi matkustajaksi."
      },
      getoutveh = {
        title = "poista kulkuneuvosta",
        description = "Poista lähin käsiraudoitettu pelaaja autosta."
      },
      askid = {
        title = "Kysy ID",
        description = "Ksy ID korttia lähiimältä pelaajalta.",
        request = "Haluatko antaa minulle ID korttisi?",
        request_hide = "Piilota ID kortti.",
        asked = "Kysytään ID..."
      },
      check = {
        title = "Tarkista pelaaja",
        description = "Kysy rahaa, reppua ja asetta lähiimältä pelaajalta.",
        request_hide = "Piiloita tarkistus raportti.",
        info = "<em>raha: </em>{1} $<br /><br /><em>reppu: </em>{2}<br /><br /><em>aseet: </em>{3}",
        checked = "Sinut on tarkistettu."
      },
      seize = {
        seized = "Takavarikoitu {2} ~r~{1}",
        weapons = {
          title = "takavarikoi aseita",
          description = "Takavarikoi lähimmän pelaajan ase",
          seized = "~b~Aseesi on takavarikoitu."
        },
        items = {
          title = "Takavarkoi laittomat",
          description = "Takavarikoi laittomat esineet",
          seized = "~b~Sinun laittomat tavarasi on takavarikoitu."
        }
      },
      jail = {
        title = "Vankila",
        description = "Vankiloi/Poista vankilasta lähinpelaaja vankilasta/lähiimästä vankilasta.",
        not_found = "~r~Vankilaa ei löydetty.",
        jailed = "~b~Vankiloitu.",
        unjailed = "~b~Poistettu vankilasta.",
        notify_jailed = "~b~Sinut on vankiloitu.",
        notify_unjailed = "~b~Sinut on poistettu vankilasta."
      },
      fine = {
        title = "Sakko",
        description = "Sakota lähintä pelaajaa.",
        fined = "~b~Sakotettu  ~s~{2} $  ~b~{1}.",
        notify_fined = "~b~Sinua on sakotettu ~s~ {2} $  ~b~{1}.",
        record = "[Sakko] {2} $  {1}"
      },
      store_weapons = {
        title = "Säilytä aseita",
        description = "Säilytä aseesi reppuun."
      }
    },
    identity = {
      info = "<em>Nimi: </em>{1}<br /><em>Etunimi: </em>{2}<br /><em>Ikä: </em>{3}<br /><em>Rekisteröinti n°: </em>{4}<br /><em>Puhelin: </em>{5}<br /><em>Yritys: </em>{6}<br /><em>Yrityksen pääoma: </em>{7} $<br /><em>Osoite: </em>{9}, {8}"
    }
  },
  emergency = {
    menu = {
      revive = {
        title = "Elvytä",
        description = "Elvytä lähin pelaaja henkiin.",
        not_in_coma = "~r~Ei ole koomassa."
      }
    }
  },
  phone = {
    title = "Puhelin",
    directory = {
      title = "Luettelo",
      description = "Avaa puhelinluettelo.",
      add = {
        title = "➕ LIsää",
        prompt_number = "Anna lisättävä puhelinnumero:",
        prompt_name = "Anna merkinnän nimi:",
        added = "~g~Merkintä lisätty."
      },
      sendsms = {
        title = "Lähetä SMS",
        prompt = "Lähetä viesti (max {1} merkkiä):",
        sent = "~g~ Lähetä n°{1}.",
        not_sent = "~r~ n°{1} ei saatavilla."
      },
      sendpos = {
        title = "Lähetä sijainti",
      },
      remove = {
        title = "Poista"
      }
    },
    sms = {
      title = "SMS historia",
      description = "Vastaan otettu SMS historia.",
      info = "<em>{1}</em><br /><br />{2}",
      notify = "SMS~b~ {1}:~s~ ~n~{2}"
    },
    smspos = {
      notify = "SMS-Sijainti ~b~ {1}"
    },
    service = {
      title = "Palavelu",
      description = "Soita palvelulle tai hätänumeroon.",
      prompt = "Jos tarvitaan anna palvelulle viesti:",
      ask_call = "Vastaanotettu {1} puhelu, otatko sen ? <em>{2}</em>",
      taken = "~r~Tämä puhelu on jo otettu."
    },
    announce = {
      title = "Ilmoita",
      description = "Julkaise ilmoitus, näkyvissä kaikille muutama sekunttia.",
      item_desc = "{1} $<br /><br/>{2}",
      prompt = "Ilmoita sisältöä (10-1000 chars): "
    }
  },
  emotes = {
    title = "Näyttely jutut",
    clear = {
      title = "> Siivoa",
      description = "Siivoa kaikki päälläolevat näytös jutut :D."
    }
  },
  home = {
    buy = {
      title = "Osta",
      description = "Osta täältä talo, hinta {1} $.",
      bought = "~g~Ostettu.",
      full = "~r~Tämä paikka on täynnä.",
      have_home = "~r~Sinulla on jo koti."
    },
    sell = {
      title = "Myy",
      description = "Myy kotisi hintaan {1} $",
      sold = "~g~Myyty.",
      no_home = "~r~Sinulla ei ole kotia täällä."
    },
    intercom = {
      title = "Ovipuhelin",
      description = "Käytä ovipuhelinta mennäksesi taloon.",
      prompt = "Numero:",
      not_available = "~r~Ei saatavilla.",
      refused = "~r~Kieltäytyi tulemasta.",
      prompt_who = "Sano kuka olet:",
      asked = "Kysyy...",
      request = "Joku haluaa avata kotisi oven: <em>{1}</em>"
    },
    slot = {
      leave = {
        title = "Poistu"
      },
      ejectall = {
        title = "Poista kaikki",
        description = "Poista kaikki vierailijat talosta sinut mukaanlukien, lukitset myös talon."
      }
    },
    wardrobe = {
      title = "Vaatekaappi",
      save = {
        title = "> tallenna",
        prompt = "Tallenna nimi:"
      }
    },
    gametable = {
      title = "pelipöytä",
      bet = {
        title = "Aloitus panos",
        description = "Aloita uhkapeli lähelläolevien pelaajien kanssa, voittaja valitaan satunnaisesti.",
        prompt = "Panoksen määrä:",
        request = "[BET] Haluatko uhkapelata {1} $ ?",
        started = "~g~Uhkapeli aloitettu."
      }
    }
  },
  garage = {
    title = "Autotalli ({1})",
    owned = {
      title = "Omistaja",
      description = "Omistajan kulkuneuvot."
    },
    buy = {
      title = "Osta",
      description = "Osta kulkuneuvoja.",
      info = "{1} $<br /><br />{2}"
    },
    sell = {
      title = "Myy",
      description = "Myy kulkuneuvoja."
    },
    rent = {
      title = "Vuokraa",
      description = "Vuokraa kulkuneuvo tälle pelikerralle (poistuu kun lähdet servulta)."
    },
    store = {
      title = "Säilö",
      description = "laita nykyinen kulkuneuvosi autotalliin."
    }
  },
  ajoneuvo = {
    title = "Kulkuneuvo",
    no_owned_near = "~r~Et omista kulkuneuvoja lähellä.",
    trunk = {
      title = "Takakontti",
      description = "Avaa kulkuneuvon takakontti."
    },
    detach_trailer = {
      title = "Irroita perävaunu",
      description = "Irroita perävaunu."
    },
    detach_towtruck = {
      title = "Irroita hinausauto",
      description = "Irroita hinausauto."
    },
    detach_cargobob = {
      title = "irroita cargobob",
      description = "irroita cargobob."
    },
    lock = {
      title = "Lukitse/Avaa",
      description = "Lukitse tai avaa kulkuneuvo."
    },
    engine = {
      title = "Moottori on/off",
      description = "Käynnistä tai sammuta moottori."
    },
    asktrunk = {
      title = "Kysy takakontin avausta",
      asked = "~g~Kysytään...",
      request = "Haluatko avata takakontin ?"
    },
    replace = {
      title = "Vaihda ajoneuvo",
      description = "Vaihda maassaoleva lähin ajoneuvo."
    },
    repair = {
      title = "Korjaa ajoneuvo",
      description = "Korjaa lähin ajoneuvo."
    }
  },
  gunshop = {
    title = "Asekauppa ({1})",
    prompt_ammo = "Ostettavien patruunoiden määrä {1}:",
    info = "<em>body: </em> {1} $<br /><em>ammo: </em> {2} $/u<br /><br />{3}"
  },
  market = {
    title = "Marketti ({1})",
    prompt = "ostettavan tavaran määrä {1}:",
    info = "{1} $<br /><br />{2}"
  },
  skinshop = {
    title = "Nahkakauppa xD"
  },
  cloakroom = {
    title = "Vaatekaappi ({1})",
    undress = {
      title = "> Riisu"
    }
  },
  itemtr = {
    informer = {
      title = "laiton tiedoittaja",
      description = "{1} $",
      bought = "~g~Sijainti lähetetty GPS:ssääsi."
    }
  },
  mission = {
    blip = "Tehtävä ({1}) {2}/{3}",
    display = "<span class=\"nimi\">{1}</span> <span class=\"askel\">{2}/{3}</span><br /><br />{4}",
    cancel = {
      title = "peruuta tehtävä"
    }
  },
  aptitude = {
    title = "Kyvyt",
    description = "Näytä kyvyt.",
    lose_exp = "Kyky ~b~{1}/{2} ~r~-{3} ~s~exp.",
    earn_exp = "Kyky ~b~{1}/{2} ~g~+{3} ~s~exp.",
    level_down = "kyky ~b~{1}/{2} ~r~menetä tasoa ({3}).",
    level_up = "kyky ~b~{1}/{2} ~g~taso ylös ({3}).",
    display = {
      group = "{1}: ",
      aptitude = "--- {1} | exp {2} | lvl {3} | edistyminen {4}%"
    }
  }
}

return lang
