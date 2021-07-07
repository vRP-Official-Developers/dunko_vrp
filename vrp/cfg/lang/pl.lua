
-- define all language properties

local lang = {
  common = {
    welcome = "Witaj na serwerze. Nacisnij K aby wlaczyc menu. Server aktualnie jest dopracowywany pod wzgledem spolszczenia jak i technicznym. Dolacz do nas na Discord https://discord.gg/7FzYYwK.~n~",
    no_player_near = "~r~Brak graczy obok ciebie.",
    invalid_value = "~r~Bledna wartosc.",
    invalid_name = "~r~Bledna nazwa.",
    not_found = "~r~Nie istnieje.",
    request_refused = "~r~Prozba odrzucona.",
    wearing_uniform = "~r~Ostroznie, ubierasz uniform.",
    not_allowed = "~r~Niedozwolone."
  },
  weapon = {
    pistol = "Pistolet"
  },  
  survival = {
    starving = "Glod",
    thirsty = "Pragnienie"
  },
  money = {
    display = "<span class=\"symbol\">$</span> {1}",
    bdisplay = "<span class=\"symbol\">$</span> {1}",
    given = "Dales ~r~{1}$.",
    received = "Otrzymales ~g~{1}$.",
    not_enough = "~r~Za malo pieniedzy.",
    paid = "Zaplacono ~r~{1}$.",
    give = {
      title = "Daj pieniadze",
      description = "Daj pieniadze osobie w poblizu.",
      prompt = "Kwota do przekazania:"
    }
  },
  inventory = {
    title = "Ekwipunek",
    description = "Otworz ekwipunek.",
    iteminfo = "({1})<br /><br />{2}<br /><em>{3} kg</em>",
    info_weight = "Waga {1}/{2} kg",
    give = {
      title = "Daj",
      description = "Daj przedmiot osobie w poblizu.",
      prompt = "Amount to give (max {1}):",
      given = "Given ~r~{1} ~s~{2}.",
      received = "Received ~g~{1} ~s~{2}.",
    },
    trash = {
      title = "Zniszcz",
      description = "Zniszcz przedmiot.",
      prompt = "Ilosc przedmiotow (max {1}):",
      done = "Zniszczono ~r~{1} ~s~{2}."
    },
    missing = "~r~Brak {2} {1}.",
    full = "~r~Brak miejsca w ekwipunku.",
    chest = {
      title = "Skrzynia",
      already_opened = "~r~Ta skrzynia jest otwarta przez inna osobe.",
      full = "~r~Skrzynia jest pelna.",
      take = {
        title = "Wez",
        prompt = "Ilosc (max {1}):"
      },
      put = {
        title = "Wloz",
        prompt = "Ilosc (max {1}):"
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
      title = "Wplac",
      description = "Saldo",
      prompt = "Wpisz ilosc pieniedzy do wplaty:",
      deposited = "~r~{1}$~s~ Wplacono."
    },
    withdraw = {
      title = "Wyplac",
      description = "Saldo",
      prompt = "Wpisz ilosc pieniedzy do wyplaty:",
      withdrawn = "~g~{1}$ ~s~Wyplacono.",
      not_enough = "~r~Nie masz tyle pieniedzy."
    }
  },
  business = {
    title = "Dzialalnosc",
    directory = {
      title = "Rejestr",
      description = "Rejestr Firm.",
      dprev = "> Prev",
      dnext = "> Next",
      info = "<em>Kapital: </em>{1} $<br /><em>Wlasciciel: </em>{2} {3}<br /><em>NIP n°: </em>{4}<br /><em>Numer Telefonu: </em>{5}"
    },
    info = {
      title = "Informacje o Firmie",
      info = "<em>Nazwa: </em>{1}<br /><em>Kapital: </em>{2} $<br /><em>Kapital przelany: </em>{3} $<br /><br/>Wplacony kapital to kwota pieniedzy przekazana na okres ekonomiczny dzialalnosci gospodarczej, a maksymalna jest kapitalem przedsiebiorstwa. Wymagana do prania brudnych pieniedzy"
    },
    addcapital = {
      title = "Dodaj kapital",
      description = "Dodaj kapital do firmy.",
      prompt = "Kwota do dodania do kapitalu firmy:",
      added = "~r~{1}$ ~s~dodano do kapitalu firmy."
    },
    launder = {
      title = "Pranie brudnej kasy",
      description = "Uzyj swojej firmy do prania brudnej kasy.",
      prompt = "Kwota jaka mozesz wyprac (max {1} $): ",
      laundered = "~g~{1}$ ~s~wyprano.",
      not_enough = "~r~Za malo brudnej kasy."
    },
    open = {
      title = "Otworz Firme",
      description = "Otworz Firme, minimalny kapital wynosi {1} $.",
      prompt_name = "Nazwa Fitmy: ",
      prompt_capital = "Kapital poczatkowy (min {1})",
      created = "~g~Firma zostala zalozona."
      
    }
  },
  cityhall = {
    title = "Ratusz",
    identity = {
      title = "Nowa tozsamosc",
      description = "Wyrob swoj dowod osobisty = {1} $.",
      prompt_firstname = "Wpisz Imie:",
      prompt_name = "Wpisz Nazwisko:",
      prompt_age = "Wpisz wiek:",
    },
    menu = {
      title = "Tozsamosc",
      info = "<em>Imie: </em>{2}<br /><em>Nazwisko: </em>{1}<br /><em>Wiek: </em>{3}<br /><em>Numer dowodu°: </em>{4}<br /><em>Numer Telefonu: </em>{5}<br /><em>Adres: </em>{7}, {6}"
    }
  },
  police = {
    title = "Policja",
    wanted = "Poziom poszukiwania {1}",
    not_handcuffed = "~r~Nie udalo sie skuc",
    cloakroom = {
      title = "Szatnia",
      uniform = {
        title = "Uniform",
        description = "Wloz uniform."
      }
    },
    pc = {
      title = "PC",
      searchreg = {
        title = "Przeszukaj rejestr",
        description = "Szukaj osoby w rejestrze.",
        prompt = "Wpisz numer dowodu:"
      },
      closebusiness = {
        title = "Zamknij Firme",
        description = "Zamknij Firme osoby w poblizu.",
        request = "Jestes pewny czy chcesz zamknac Firme {3} beda wlasnoscia {1} {2} ?",
        closed = "~g~Firma Zamknieta."
      },
      trackveh = {
        title = "Namierz Pojazd",
        description = "Namierz pojazd po numerze rejestracyjnym.",
        prompt_reg = "Wpisz numer rejestracyjny:",
        prompt_note = "Wprowadz notke / Przyczyne sledzenia:",
        tracking = "~b~Namierzanie wlaczone.",
        track_failed = "~b~Namierzanie {1}~s~ ({2}) ~n~~r~ie powiodlo sie.",
        tracked = "Namierzanie {1} ({2})"
      },
      records = {
        show = {
          title = "Pokaz nagranie",
          description = "Pokaz policji nagranie za pomoca numeru rejestracyjnego."
        },
        delete = {
          title = "Usun nagranie",
          description = "Usun nagranie za pomoca numeru rejestracyjnego.",
          deleted = "~b~Nagranie usuniete"
        }
      }
    },
    menu = {
      handcuff = {
        title = "Kajdanki",
        description = "Skuj/Rozkuj osobe w poblizu."
      },
      putinveh = {
        title = "Wsadz do auta",
        description = "Wsadz skuta osobe do auta jako pasazer."
      },
      getoutveh = {
        title = "Wyciagnij z auta",
        description = "Wyciagnij skuta osobe z auta."
      },
      askid = {
        title = "Zapytaj o dowod",
        description = "Zapytaj o dowod osobe w poblizu.",
        request = "Chcesz okazac dowod?",
        request_hide = "Schowaj dowod.",
        asked = "Pytanie o dowod..."
      },
      check = {
        title = "Przeszukaj podejrzanego",
        description = "Pieniadze, ekwipunek i bronie osoby w poblizu.",
        request_hide = "Ukryj raport.",
        info = "<em>Pieniadze: </em>{1} $<br /><br /><em>ekwipunek: </em>{2}<br /><br /><em>bron: </em>{3}",
        checked = "Zostales przeszukany."
      },
      seize = {
        seized = "Zlap {2} ~r~{1}",
        weapons = {
          title = "Zlap bron",
          description = "Zlap osobe w poblizu",
          seized = "~b~Bron zostala skonfiskowana."
        },
        items = {
          title = "Znajdz nielegalne przedmioty",
          description = "Znaleziono nielegalny przedmiot",
          seized = "~b~Skonfiskowano nielegalny przedmiot."
        }
      },
      jail = {
        title = "Wiezienie",
        description = "Wsadz/wyciagnij do/z wiezienia osobe w poblizu.",
        not_found = "~r~Brak celi.",
        jailed = "~b~Osadzony.",
        unjailed = "~b~Zwolniony.",
        notify_jailed = "~b~Zostales osadzony.",
        notify_unjailed = "~b~Zostales zwolniony."
      },
      fine = {
        title = "Mandat",
        description = "Ukaz mandatem osobe w poblizu.",
        fined = "~b~Mandat ~s~{2} $ za ~b~{1}.",
        notify_fined = "~b~Dostales mandat ~s~ {2} $ za ~b~{1}.",
        record = "[Fine] {2} $ za {1}"
      },
      store_weapons = {
        title = "Schowaj bron",
        description = "Schowaj bron do ekwipunku."
      }
    },
    identity = {
      info = "<em>Nazwisko: </em>{1}<br /><em>Imie: </em>{2}<br /><em>Wiek: </em>{3}<br /><em>Numer dowodu°: </em>{4}<br /><em>Numer Telefonu: </em>{5}<br /><em>Firma: </em>{6}<br /><em>Kapital firmy: </em>{7} $<br /><em>Adres: </em>{9}, {8}"
    }
  },
  emergency = {
    menu = {
      revive = {
        title = "Wskrzes",
        description = "Reanimacja osoby w poblizu.",
        not_in_coma = "~r~Zreanimowany."
      }
    }
  },
  phone = {
    title = "Telefon",
    directory = {
      title = "Kontakty",
      description = "Otworz kontakty.",
      add = {
        title = "➕ Dodaj",
        prompt_number = "Wpisz numer telefonu:",
        prompt_name = "Wpisz nazwe:",
        added = "~g~Dodano."
      },
      sendsms = {
        title = "Wyslij SMS",
        prompt = "Wpisz tekst (max {1} chars):",
        sent = "~g~ Wyslano do°{1}.",
        not_sent = "~r~ n°{1} Nie wyslano."
      },
      sendpos = {
        title = "Wyslij pozycje",
      },
      remove = {
        title = "Usun"
      }
    },
    sms = {
      title = "Historia SMS",
      description = "Przychodzace SMS.",
      info = "<em>{1}</em><br /><br />{2}",
      notify = "SMS~b~ {1}:~s~ ~n~{2}"
    },
    smspos = {
      notify = "SMS-Pozycja ~b~ {1}"
    },
    service = {
      title = "Uslugi",
      description = "Zadzwoń do serwisu lub numeru alarmowego.",
      prompt = "Napisz wiadomosc:",
      ask_call = "Otrzymano {1} call, do you take it ? <em>{2}</em>",
      taken = "~r~Polaczenie wykonane."
    },
    announce = {
      title = "Ogloszenie",
      description = "Opublikuj ogloszenie, bedzie widoczne przez pare sekund.",
      item_desc = "{1} $<br /><br/>{2}",
      prompt = "Zawartosc ogloszenia (10-1000 znakow): "
    }
  },
  emotes = {
    title = "Animacje",
    clear = {
      title = "> Wylacz",
      description = "Wylacz animacje."
    }
  },
  home = {
    buy = {
      title = "Kup",
      description = "Cena domu {1} $.",
      bought = "~g~Zakupiono.",
      full = "~r~Brak miejsc.",
      have_home = "~r~Masz juz to miejsce."
    },
    sell = {
      title = "Sprzedaj",
      description = "Sprzedaj za {1} $",
      sold = "~g~Sprzedano.",
      no_home = "~r~Nie masz tutaj domu."
    },
    intercom = {
      title = "Domofon",
      description = "Uzyj domofonu aby dostac sie do domu.",
      prompt = "Numer:",
      not_available = "~r~Brak dostepu.",
      refused = "~r~Odmowa.",
      prompt_who = "Kto to jest:",
      asked = "Zapytaj...",
      request = "Ktos chce wejsc do ciebie: <em>{1}</em>"
    },
    slot = {
      leave = {
        title = "Wyjdz"
      },
      ejectall = {
        title = "Wyrzuc wszystkich",
        description = "Wyrzucono wszystkich w tym ciebie. Zamknieto dom."
      }
    },
    wardrobe = {
      title = "Garderoba",
      save = {
        title = "> Zapisz",
        prompt = "Nazwa stroju:"
      }
    },
    gametable = {
      title = "Stolik do gry",
      bet = {
        title = "Zacznij zaklad",
        description = "Rozpocznij zakład z graczami w pobliżu, zwycięzca zostanie losowo wybrany.",
        prompt = "Kwota zakladu:",
        request = "[BET] Chcesz postawic {1} $ ?",
        started = "~g~Zaklad rozpoczeto."
      }
    }
  },
  garage = {
    title = "Garaz ({1})",
    owned = {
      title = "Wlasne",
      description = "Wlasne pojazdy."
    },
    buy = {
      title = "Kup",
      description = "Kup pojazd.",
      info = "{1} $<br /><br />{2}"
    },
    sell = {
      title = "Sprzedaj",
      description = "Sprzedaj pojazd."
    },
    rent = {
      title = "Wynajmij",
      description = "Wynajmij pojazd (po wyjsciu z serwera samochod znika)."
    },
    store = {
      title = "Zaparkuj",
      description = "Pojazd zaparkowano."
    }
  },
  vehicle = {
    title = "Pojazd",
    no_owned_near = "~r~Brak twojego pojazdu w poblizu.",
    trunk = {
      title = "Bagaznik",
      description = "Otworz bagaznik."
    },
    detach_trailer = {
      title = "Odlacz przyczepe",
      description = "Odlacz przyczepe."
    },
    detach_towtruck = {
      title = "Odlacz holownik",
      description = "Odlacz holownik."
    },
    detach_cargobob = {
      title = "Odlacz cargobob",
      description = "Odlacz cargobob."
    },
    lock = {
      title = "Zamknij/Otworz",
      description = "Zamknij lub otworz pojazd."
    },
    engine = {
      title = "Wlacz/Wylacz silnik",
      description = "Wlacz lub wylacz silnik."
    },
    asktrunk = {
      title = "Czy mozna otworzyc bagaznik?",
      asked = "~g~Pyta...",
      request = "Chcesz otworzyc bagaznik?"
    },
    replace = {
      title = "Wymien pojazd",
      description = "Wymien pojazd w poblizu."
    },
    repair = {
      title = "Napraw pojazd",
      description = "Napraw pojazd w poblizu."
    }
  },
  gunshop = {
    title = "Sklep z bronią ({1})",
    prompt_ammo = "Ilosc amunicji do zakupu {1}:",
    info = "<em>body: </em> {1} $<br /><em>ammo: </em> {2} $/u<br /><br />{3}"
  },
  market = {
    title = "Market ({1})",
    prompt = "Ilosc {1} do zakupu:",
    info = "{1} $<br /><br />{2}"
  },
  skinshop = {
    title = "Skinshop"
  },
  cloakroom = {
    title = "Szatnia ({1})",
    undress = {
      title = "> Sciagnij"
    }
  },
  itemtr = {
    informer = {
      title = "Nielegalny informator",
      description = "{1} $",
      bought = "~g~Pozycja wyslana na GPS."
    }
  },
  mission = {
    blip = "Misja ({1}) {2}/{3}",
    display = "<span class=\"name\">{1}</span> <span class=\"step\">{2}/{3}</span><br /><br />{4}",
    cancel = {
      title = "Anuluj misje"
    }
  },
  aptitude = {
    title = "Statystyki",
    description = "Pokaz statystyki .",
    lose_exp = "Statystyka ~b~{1}/{2} ~r~-{3} ~s~exp.",
    earn_exp = "Statystyka ~b~{1}/{2} ~g~+{3} ~s~exp.",
    level_down = "Statystyka ~b~{1}/{2} ~r~Poziom obnizony ({3}).",
    level_up = "Statystyka ~b~{1}/{2} ~g~Poziom podniesiony ({3}).",
    display = {
      group = "{1}: ",
      aptitude = "--- {1} | exp {2} | lvl {3} | progress {4}%"
    }
  }
}

return lang
