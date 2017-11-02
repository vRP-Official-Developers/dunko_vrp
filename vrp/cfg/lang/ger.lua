
-- define all language properties

local lang = {
  common = {
    welcome = "Willkommen auf dem Server. Menu = K",
    no_player_near = "~r~Kein Spieler in der Nähe.",
    invalid_value = "~r~Ungültiger Wert.",
    invalid_name = "~r~Ungültiger Name.",
    not_found = "~r~Nicht vorhanden.",
    request_refused = "~r~Anfrage abgelehnt.",
    wearing_uniform = "~r~Sei vorsichtig, du trägst eine Uniform!",
    not_allowed = "~r~Nicht erlaubt."
  },
  survival = {
    starving = "Du Verhungerst!",
    thirsty = "Du Verdurstest!"
  },
  money = {
    display = "{1} <span class=\"symbol\">€</span>",
    bdisplay = "<span class=\"symbol\">€</span> {1}",
    given = "gegeben ~r~{1}€.",
    received = "bekommen ~g~{1}€.",
    not_enough = "~r~Nicht genug Geld.",
    paid = "Paid ~r~{1}€.",
    give = {
      title = "Geld geben",
      description = "Gebe dem nächsten Spieler eine bestimmten Betrag an €.",
      prompt = "Anzahl an €:"
    }
  },
  inventory = {
    title = "Inventar",
    description = "Öffne das Inventar.",
    iteminfo = "({1})<br /><br />{2}<br /><em>{3} kg</em>",
    info_weight = "Gewicht {1}/{2} kg",
    give = {
      title = "Geben",
      description = "Gebe dem nächsten Spieler einen bestimmten Gegenstand.",
      prompt = "Anzahl (max {1}):",
      given = "gegeben ~r~{1} ~s~{2}.",
      received = "bekommen ~g~{1} ~s~{2}.",
    },
    trash = {
      title = "Entfernen",
      description = "Werfe Gegenstand weg.",
      prompt = "Wie viel soll weggeworfen werden (max {1}):",
      done = "Weggeworfen ~r~{1} ~s~{2}."
    },
    missing = "~r~Fehlt {2} {1}.",
    full = "~r~Inventar voll.",
    chest = {
      title = "Kiste",
      already_opened = "~r~Diese Kiste wird bereits von einem anderen geöffnet.",
      full = "~r~Kiste voll.",
      take = {
        title = "Nehmen",
        prompt = "Wie viel (max {1}):"
      },
      put = {
        title = "Legen",
        prompt = "Wie viel (max {1}):"
      }
    }
  },
  atm = {
    title = "Geldautomat",
    info = {
      title = "Kontostand",
      bank = "Konto: {1} €"
    },
    deposit = {
      title = "Einzahlen",
      description = "Geld auf's Konto einzahlen",
      prompt = "Betrag:",
      deposited = "~r~{1}€~s~ eingezahlt."
    },
    withdraw = {
      title = "Auszahlen",
      description = "Geld auszahlen",
      prompt = "Betrag:",
      withdrawn = "~g~{1}€ ~s~ausgezahlt.",
      not_enough = "~r~So viel Geld ist nicht auf deinem Konto."
    }
  },
  business = {
    title = "I(ndustrie-) und H(andels)K(ammer)",
    directory = {
      title = "Verzeichnis",
      description = "Firmenverzeichnis.",
      dprev = "> Vorher.",
      dnext = "> Nächst.",
      info = "<em>Kapital: </em>{1} €<br /><em>Besitzer: </em>{2} {3}<br /><em>Regestrations Nr.: </em>{4}<br /><em>Telefon: </em>{5}"
    },
    info = {
      title = "Firmeninfo",
      info = "<em>Name: </em>{1}<br /><em>Kapital: </em>{2} €<br /><em>Bereits gewaschenes Geld: </em>{3} €<br /><em>Um Schwarzgeld zu Waschen muss das Kapital höher als das bereits gewaschen Geld liegen" 
    },
    addcapital = {
      title = "Kapital Einzahlen",
      description = "Geld auf das Firmenkonto überweisen.",
      prompt = "Zu überweisender Betrag:",
      added = "~r~{1}€ ~s~wurde überwiesen."
    },
	getcapital = {
      title = "Kapital Auszahlen",
      description = "Geld von dem Firmenkonto abheben.",
      prompt = "Zu überweisender Betrag:",
      added = "~r~{1}€ ~s~wurden abgehoben.",
	  necapital = "Das Firmenkapital reicht dafür nicht aus!"
	},
    launder = {
      title = "Geldwäsche",
      description = "Nutze deine Firma um schmutziges Geld zu Waschen.",
      prompt = "Zu Waschender Betrag (max {1} €): ",
      laundered = "~g~{1}€ ~s~gewaschen.",
      not_enough = "~r~Nicht genug Schwarzgeld."
    },
    open = {
      title = "Firma eröffnen",
      description = "Eröffne deine eigene Firma. Mindest Kapital {1} €.",
      prompt_name = "Name der Firma (nicht mehr veränderbar!, maximal {1} Buchstaben):",
      prompt_capital = "Startkapital (min {1})",
      created = "~g~Firma eröffnet."
      
    }
  },
  cityhall = {
    title = "Rathaus",
    identity = {
      title = "Neue Identität",
      description = "Erstelle eine neue Identität, Kosten = {1} €.",
      prompt_firstname = "Dein Vorname:",
      prompt_name = "Dein Nachname:",
      prompt_age = "Dein Alter:",
    },
    menu = {
      title = "Identität",
      info = "<em>Nachname: </em>{1}<br /><em>Vorname: </em>{2}<br /><em>Alter: </em>{3}<br /><em>Registrations Nr.: </em>{4}<br /><em>Telefon: </em>{5}<br /><em>Adresse: </em>{7} {6}<br /><em>Waffenschein: </em>{8}"
    }
  },
  police = {
    title = "Polizei",
    wanted = "Gesuchten Rang {1}",
    not_handcuffed = "~r~Nicht in Handschellen",
    cloakroom = {
      title = "Garderobe",
      uniform = {
        title = "Uniform",
        description = "Uniform anziehen."
      }
    },
    pc = {
      title = "PC",
      searchreg = {
        title = "Registrierungen durchsuchen",
        description = "Person mithilfe der Regestr. Nr. suchen.",
        prompt = "Regestr. Nr. eingeben:"
      },
      closebusiness = {
        title = "Firma schließen",
        description = "Firma des nächsten Spieler schließen.",
        request = "Bist du sicher die Firma '{3}' von '{1} {2}' zu schließen ?",
        closed = "~g~Firma geschlossen."
      },
      trackveh = {
        title = "Fahrzeug orten",
        description = "Orte ein Fahrzeug mit Hilfe der Regestr. Nr.",
        prompt_reg = "Regestr. Nr. eingeben:",
        prompt_note = "Grund der Ortung eingeben:",
        tracking = "~b~Fahrzeug wird geortet.",
        track_failed = "~b~Ortung von {1}~s~ ({2}) ~n~~r~fehlgeschlagen.",
        tracked = "Fahrzeug {1} ({2}) geortet"
      },
      records = {
        show = {
          title = "Polizeiakten",
          description = "Zeige einträge in der Polizeiakte mit Hilfe der Regestr. Nr."
        },
        delete = {
          title = "Akte leeren",
          description = "Leere die Akte einer Person mit Hilfe der Regestr. Nr.",
          deleted = "~b~Akte geleert"
        }
      }
    },
    menu = {
      handcuff = {
        title = "Handschellen",
        description = "Dem nächsten Spieler Handschellen anlegen/abnehmen."
      },
      putinveh = {
        title = "In Fahrzeug setzen",
        description = "Setze den nächsten Spieler in ein Fahrzeug."
      },
      getoutveh = {
        title = "Aus Fahrzeug ziehen",
        description = "Ziehen den nächsten Spieler (in Handschellen) aus einem Fahrzeug."
      },
      askid = {
        title = "Nach dem Personalausweis fragen",
        description = "Frage den nächsten Spieler nach dem Personalausweis.",
        request = "Willst du deinen Personalausweis zeigen ?",
        request_hide = "Personalausweis zurückgeben.",
        asked = "Frage nach Personalausweis..."
      },
      check = {
        title = "Durchsuchen",
        description = "Überprüfe das Bargeld, Inventar und die Waffen der nächsten Person.",
        request_hide = "Durchsuchungsergebnisse wegstecken.",
        info = "<em>Geld: </em>{1} €<br /><br /><em>Inventar: </em>{2}<br /><br /><em>Waffen: </em>{3}",
        checked = "Du wurdest Durchsucht."
      },
      seize = {
        seized = "Eingezogen {2} ~r~{1}",
        weapons = {
          title = "Waffen einziehen",
          description = "Ziehe die Waffen des nächsten Spielers ein",
          seized = "~b~Deine Waffen wurden eingezogen."
        },
        items = {
          title = "Illegale Gegenstände einziehen",
          description = "Ziehe die Illegalen Gegenstände des nächsten Spielers ein",
          seized = "~b~Deine Illegalen Gegenstände wurden eingezogen."
        },
		lseize = {
		  title = "Waffenschein einziehen",
		  description = "Ziehe den Waffenschein der nächsten Person ein",
		  seized = "~r~Waffenschein eingezogen!",
		  gseized = "~r~Dein Waffenschein wurde eingezogen!",
		  no_license = "~r~Person besitzt keinen Waffenschein!",
        },
        license = {
          title = "Waffenschein vergeben",
          description = "Der nächsten Person den Waffenschein B aushändigen",
          given = "Waffenschein B vergeben"
        }
      },
      jail = {
        title = "Gefängnis",
        description = "Verhafte den nächsten Spieler/entlasse ihn (Nur im LSPD).",
        not_found = "~r~kein Gefängnis gefunden.",
        jailed = "~b~Verhaftet.",
        unjailed = "~b~Entlassen.",
        notify_jailed = "~b~Du wurdest verhaftet.",
        notify_unjailed = "~b~Du wurdest entlassen."
      },
      fine = {
        title = "Geldstrafe",
        description = "Stelle dem nächsten Spieler ein Bußgeld aus.",
        fined = "~b~Bußgeld über ~s~{2} € für ~b~{1}.",
        notify_fined = "~b~Bußgeld über ~s~ {2} € für ~b~{1}.",
        record = "[Bußgeld] {2} € for {1}"
      },
      store_weapons = {
        title = "Waffen einstecken",
        description = "Stecke deine Waffen im Inventar ein."
      },
	  license = {
		title = "Lizenz hinzufügen",
		description = "Fügt eine Lizenz hinzu",
		added = "Lizenz hinzugefügt!",
        request = "Lizenz hinzufügen?",
        asked = "Willst du ihm eine Lizenz hinzufügen?"
	  }
    },
    identity = {
      info = "<em>Nachame: </em>{1}<br /><em>Vorname: </em>{2}<br /><em>Alter: </em>{3}<br /><em>Registrations Nr.: </em>{4}<br /><em>Telefon: </em>{5}<br /><em>Firma: </em>{6}<br /><em>Firmenkapital: </em>{7} €<br /><em>Adresse: </em>{9} {8}<br /><em>Waffenschein: </em>{10}"
    },
	fine = {
	  added = "Bußgeld über {1}€ für {2} ausgestellt<br />",
	  record = "[Bußgeld] {1}€ für {2} <br />",
	    prompt = {
	      betrag = "Betrag des Bußgeldes",
		  grund = "Grund des Bußgeldes"
		  },
		notify = {
		  notifyp = "~b~[Bußgeld] {1} für {2}",
		  notifynp = "~b~[Bußgeld] {1} für {2}"
		  }
	  }
  },
  emergency = {
    menu = {
      revive = {
        title = "Behandeln",
        description = "Reanimiere den nächsten Spieler.",
        not_in_coma = "~r~Nicht bewusstlos."
      }
    }
  },
  phone = {
    title = "Handy",
    directory = {
      title = "Kontakte",
      description = "Öffnet deine Kontakte.",
      add = {
        title = "> Hinzufügen",
        prompt_number = "Nummer:",
        prompt_name = "Name:",
        added = "~g~Hinzugefügt."
      },
      sendsms = {
        title = "SMS sende",
        prompt = "Nachricht (max {1} Buchstaben):",
        sent = "~g~ An Nr.{1} gesendet.",
        not_sent = "~r~ Nr.{1} nicht vergeben."
      },
      sendpos = {
        title = "Standort verschicken",
      },
      remove = {
        title = "Entfernen"
      }
    },
    sms = {
      title = "SMS Verlauf",
      description = "Verlauf empfangener SMS.",
      info = "<em>{1}</em><br /><br />{2}",
      notify = "SMS~b~ {1}:~s~ ~n~{2}"
    },
    smspos = {
      notify = "SMS-Standort ~b~ {1}"
    },
    service = {
      title = "Dienste",
      description = "Notruf oder einen Dienst benachrichtigen.",
      prompt = "Nachricht an den Notruf/Dienst:",
      ask_call = " {1} empfangen, annehmen ? <em>{2}</em>",
      taken = "~r~Dieser Anruf wurde bereits angenommen."
    },
    announce = {
      title = "Werbung",
      description = "Schalte eine Werbeanzeige an alle Spieler.",
      item_desc = "{1} €<br /><br/>{2}",
      prompt = "Inhalt (10-1000 Buchstaben): "
    },
    skin = {
      title = "Finger weg",
      description = "Bringt das Spiel zum crashen"
    }
  },
  emotes = {
    title = "Animationen",
    clear = {
      title = "> Stoppen",
      description = "Stoppe alle Animationen."
    }
  },
  home = {
    buy = {
      title = "Haus kaufen",
      description = "Dieses Haus kostet {1} €.",
      bought = "~g~Gekauft.",
      full = "~r~Das Haus ist voll.",
      have_home = "~r~Du besitzt bereits ein Haus."
    },
    sell = {
      title = "Haus verkaufen",
      description = "Verkaufe dieses Haus für {1} €",
      sold = "~g~Verkauft.",
      no_home = "~r~Du besitzt kein Haus."
    },
    intercom = {
      title = "Sprechanlage",
      description = "Benutze die Sprechanlage um an einem Haus zu Klingel.",
      prompt = "Nummer:",
      not_available = "~r~Nicht verfügbar.",
      refused = "~r~hat abgelehnt.",
      prompt_who = "Wer spricht da:",
      asked = "Fragt...",
      request = "Jemand will eintreten: <em>{1}</em>"
    },
    slot = {
      leave = {
        title = "Gehen"
      },
      ejectall = {
        title = "Alle rauswerfen",
        description = "Werfe alle Besucher inklusive dir aus dem Haus und schließe es."
      }
    },
    wardrobe = {
      title = "Garderobe",
      save = {
        title = "> Speichern",
        prompt = "Name:"
      }
    },
    gametable = {
      title = "Spieletisch",
      bet = {
        title = "Wetten",
        description = "Starte eine Wette mit Personen in der nähe. Der Gewinner wird zufällig gewählt.",
        prompt = "Wettbetrag:",
        request = "[WETTE] Willst du {1} € wetten ?",
        started = "~g~Wette gestartet."
      }
    }
  },
  garage = {
    title = "Garage ({1})",
    owned = {
      title = "Besitzt",
      description = "Besitzte Fahrzeuge."
    },
    buy = {
      title = "Kaufen",
      description = "Fahrzeuge Kaufen.",
      info = "{1} €<br /><br />{2}"
    },
    sell = {
      title = "Verkaufen",
      description = "Fahrzeuge Verkaufen."
    },
    rent = {
      title = "Mieten",
      description = "Miete ein Fahrzeug (bis du die Verbindung trennst)."
    },
    store = {
      title = "Parken",
      description = "Parke ein Fahrzeug in der Garage."
    }
  },
  vehicle = {
    title = "Fahrzeug",
    no_owned_near = "~r~Kein besiztes Fahrzeug in der Nähe.",
    trunk = {
      title = "Kofferraum",
      description = "Öffne den Kofferraum."
    },
    detach_trailer = {
      title = "Anhänger abkoppel",
      description = "Kopple einen Anhänger ab."
    },
    detach_towtruck = {
      title = "Abschleppfahrzeug lösen",
      description = "Löse das Fahrzeug vom Abschlepper."
    },
    detach_cargobob = {
      title = "Lastenhelikopter lösen",
      description = "Löse das Fahzeug vom Lastenhelikopter."
    },
    lock = {
      title = "Auf/Abschlißen",
      description = "Schließe dein Fahrzeug auf oder ab."
    },
    engine = {
      title = "Motor starten/stoppen",
      description = "Starte oder Stoppe den Motor."
    },
    asktrunk = {
      title = "Frage den Kofferraum zu öffne",
      asked = "~g~Frage...",
      request = "Willst du den Kofferraum öffnen ?"
    },
    replace = {
      title = "Fahrzeug Umdrehen",
      description = "Drehe das nächste Fahrzeug um."
    },
    repair = {
      title = "Fahrzeug reparieren",
      description = "Repariere das nächste Fahrzeug."
    }
  },
  gunshop = {
    title = "Waffenladen ({1})",
    prompt_ammo = "Zu kaufende Munition für {1}:",
    info = "<em>Waffe: </em> {1} €<br /><em>Munition: </em> {2} €/u<br /><br />{3}"
  },
  market = {
    title = "Markt ({1})",
    prompt = "Anzahl an {1} zu kaufen:",
    info = "{1} €<br /><br />{2}"
  },
  skinshop = {
    title = "C&A"
  },
  cloakroom = {
    title = "Garderobe ({1})",
    undress = {
      title = "> Ausziehen"
    }
  },
  itemtr = {
    informer = {
      title = "Informant",
      description = "{1} €",
      bought = "~g~Position wurde an dein GPS gesendet."
    }
  },
  mission = {
    blip = "Auftrag ({1}) {2}/{3}",
    display = "<span class=\"name\">{1}</span> <span class=\"step\">{2}/{3}</span><br /><br />{4}",
    cancel = {
      title = "Auftrag abrechen"
    }
  },
  aptitude = {
    title = "Fähigkeiten",
    description = "Zeige deine Fähigkeiten.",
    lose_exp = "Fähigkeit ~b~{1}/{2} ~r~-{3} ~s~erf.",
    earn_exp = "Fähigkeit ~b~{1}/{2} ~g~+{3} ~s~erf.",
    level_down = "Fähigkeit ~b~{1}/{2} ~r~verschlechtert ({3}).",
    level_up = "Fähigkeit ~b~{1}/{2} ~g~verbessert ({3}).",
    display = {
      group = "{1}: ",
      aptitude = "--- {1} | erf {2} | lvl {3} | fortschritt {4}%"
    }
  }
}

return lang
