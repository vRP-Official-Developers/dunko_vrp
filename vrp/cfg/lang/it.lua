
-- define all language properties

local lang = {
  common = {
    welcome = "Benvenuto nel server. Premi K per usare il menu.~n~",
    no_player_near = "~r~Nessun giocatore vicino a te.",
    invalid_value = "~r~Valore non valido.",
    invalid_name = "~r~Nome non valido.",
    not_found = "~r~Non trovato.",
    request_refused = "~r~Richiesta rifiutata.",
    wearing_uniform = "~r~Fai attenzione, stai indossando un'uniforme.",
    not_allowed = "~r~Non permesso."
  },
  weapon = {
    pistol = "Pistola"
  },  
  survival = {
    starving = "affamato",
    thirsty = "assetato"
  },
  money = {
    display = "<span class=\"symbol\">€</span> {1}",
    bdisplay = "<span class=\"symbol\">€</span> {1}",
    given = "Dato ~r~{1}€.",
    received = "Ricevuto ~g~{1}€.",
    not_enough = "~r~Soldi insufficienti.",
    paid = "Pagato ~r~{1}€.",
    give = {
      title = "Dai soldi",
      description = "Dai soldi al giocatore più vicino.",
      prompt = "Soldi da dare:"
    }
  },
  inventory = {
    title = "Inventario",
    description = "Apri l'inventario.",
    iteminfo = "({1})<br /><br />{2}<br /><em>{3} kg</em>",
    info_weight = "peso {1}/{2} kg",
    give = {
      title = "Dai",
      description = "Dai oggetti al giocatore più vicino.",
      prompt = "Quantità da dare (max {1}):",
      given = "Dati ~r~{1} ~s~{2}.",
      received = "Ricevuti ~g~{1} ~s~{2}.",
    },
    trash = {
      title = "Butta",
      description = "Distrugge oggetti.",
      prompt = "Elementi da buttare (max {1}):",
      done = "Buttati ~r~{1} ~s~{2}."
    },
    missing = "~r~Mancanti {2} {1}.",
    full = "~r~Inventario pieno.",
    chest = {
      title = "Bagagliaio",
      already_opened = "~r~Questo bagagliaio è già stato aperto da qualcun altro.",
      full = "~r~Bagagliaio pieno.",
      take = {
        title = "Prendi",
        prompt = "Quantità da prendere (max {1}):"
      },
      put = {
        title = "Metti",
        prompt = "Quantità da mettere (max {1}):"
      }
    }
  },
  atm = {
    title = "ATM",
    info = {
      title = "Saldo",
      bank = "banca: {1} €"
    },
    deposit = {
      title = "Deposita",
      description = "da portafoglio a banca",
      prompt = "Inserisci quantità di denaro da depositare:",
      deposited = "~r~{1}€~s~ depositati."
    },
    withdraw = {
      title = "Preleva",
      description = "da banca a portafoglio",
      prompt = "Inserisci quantità di denaro da prelevare:",
      withdrawn = "~g~{1}€ ~s~ prelevati.",
      not_enough = "~r~Non hai abbastanza denaro in banca."
    }
  },
  business = {
    title = "Camera di Commercio",
    directory = {
      title = "Lista",
      description = "Lista di società.",
      dprev = "> Precedente",
      dnext = "> Prossimo",
      info = "<em>capitale: </em>{1} €<br /><em>proprietario: </em>{2} {3}<br /><em>registrazione n°: </em>{4}<br /><em>telefono: </em>{5}"
    },
    info = {
      title = "Info società",
      info = "<em>Nome: </em>{1}<br /><em>capitale: </em>{2} €<br /><em>trasferimento capitale: </em>{3} €<br /><br/>Il trasferimento capitale è la quantità di soldi trasferiti per un periodo commerciale, il valore massimo è il capitale della società."
    },
    addcapital = {
      title = "Aggiungi capitale",
      description = "Aggiungi capitale alla tua società.",
      prompt = "Quantità da aggiungere al capitale della società:",
      added = "~r~{1}€ ~s~aggiungi al capitale della società."
    },
    launder = {
      title = "Riciclaggio di denaro",
      description = "Usa la tua società per riciclare denaro sporco.",
      prompt = "Quantità di denaro sporco da riciclare (max {1} €): ",
      laundered = "~g~{1}€ ~s~ riciclati.",
      not_enough = "~r~Non hai abbastanza denaro sporco."
    },
    open = {
      title = "Avvia società",
      description = "Avvia la tua società, il capitale minimo è di {1} €.",
      prompt_name = "Nome società (non puoi cambiarlo in futuro, max {1} caratteri):",
      prompt_capital = "Capitale iniziale (min {1})",
      created = "~g~Società creata."
      
    }
  },
  cityhall = {
    title = "Municipio",
    identity = {
      title = "Nuova identità",
      description = "Crea una nuova identità, prezzo = {1} €.",
      prompt_firstname = "Inserisci il tuo Nome:",
      prompt_name = "Inserisci il tuo Cognome:",
      prompt_age = "Inserisci la tua età:",
    },
    menu = {
      title = "Identità",
      info = "<em>Nome: </em>{2}<br /><em>Cognome: </em>{1}<br /><em>Età: </em>{3}<br /><em>Registrazione n°: </em>{4}<br /><em>Telefono: </em>{5}<br /><em>Indirizzo: </em>{7}, {6}"
    }
  },
  police = {
    title = "Polizia",
    wanted = "Livello ricercato {1}",
    not_handcuffed = "~r~Non ammanettato",
    cloakroom = {
      title = "Guardaroba",
      uniform = {
        title = "Uniforme",
        description = "Indossa uniforme."
      }
    },
    pc = {
      title = "PC",
      searchreg = {
        title = "Ricerca per registrazione",
        description = "Ricerca identità con numero registrazione.",
        prompt = "Inserisci numero registrazione:"
      },
      closebusiness = {
        title = "Chiudi società",
        description = "Chiudi la società del giocatore più vicino.",
        request = "Sei sicuro di voler chiudere la società {3} di proprietà di {1} {2} ?",
        closed = "~g~Società chiusa."
      },
      trackveh = {
        title = "Traccia veicolo",
        description = "Traccia un veicolo dal suo numero di registrazione.",
        prompt_reg = "Inserisci numero registrazione:",
        prompt_note = "Inserisci una nota/motivo di tracciamento:",
        tracking = "~b~Tracciamento iniziato.",
        track_failed = "~b~Tracciamento di {1}~s~ ({2}) ~n~~r~Fallito.",
        tracked = "Tracciato {1} ({2})"
      },
      records = {
        show = {
          title = "Mostra registri",
          description = "Mostra registri di polizia da numero di registrazione."
        },
        delete = {
          title = "Pulisci registri",
          description = "Pulisce i registri di polizia da numero di registrazione.",
          deleted = "~b~Registri di polizia cancellati."
        }
      }
    },
    menu = {
      handcuff = {
        title = "Ammanetta",
        description = "Metti/togli manette al giocatore più vicino."
      },
      putinveh = {
        title = "Metti nel veicolo",
        description = "Metti il giocatore ammanettato più vicino nel veicolo come passeggero."
      },
	  freeze = {
        title = "Bloccare",
        description = "Bloccare il giocatore più vicino."
      },
      getoutveh = {
        title = "Tira fuori da veicolo",
        description = "Tira fuori dal veicolo il giocatore ammanettato più vicino."
      },
      askid = {
        title = "Chiedi identità",
        description = "Chiedi identità al giocatore più vicino.",
        request = "Vuoi dare la tua identità?",
        request_hide = "Nascondi l'identità.",
        asked = "Richiedendo identità..."
      },
      check = {
        title = "Controlla giocatore",
        description = "Controlla denaro, inventario e armi del giocatore più vicino.",
        request_hide = "Nascondi il rapporto del controllo.",
        info = "<em>denaro: </em>{1} €<br /><br /><em>inventario: </em>{2}<br /><br /><em>armi: </em>{3}",
        checked = "Sei stato controllato."
      },
      seize = {
        seized = "Sequestrati {2} ~r~{1}",
        weapons = {
          title = "Sequestra armi",
          description = "Perquisisci il giocatore più vicino",
          seized = "~b~Le tue armi sono state sequestrate."
        },
        items = {
          title = "Sequestra oggetti illegali",
          description = "Sequestra gli oggetti illegali",
          seized = "~b~La tua roba illegale è stata sequestrata."
        }
      },
      jail = {
        title = "Galera",
        description = "Carcera/scarcera il giocatore più vicino nella/dalla cella più vicina.",
        not_found = "~r~nessuna cella trovata.",
        jailed = "~b~Carcerato.",
        unjailed = "~b~Scarcerato.",
        notify_jailed = "~b~Sei stato incarcerato.",
        notify_unjailed = "~b~Sei stato scarcerato."
      },
      fine = {
        title = "Multa",
        description = "Multa il giocatore più vicino.",
        fined = "~b~Multato di ~s~{2} € per ~b~{1}.",
        notify_fined = "~b~Sei stato multato di ~s~ {2} € per ~b~{1}.",
        record = "[Multa] di {2} € per {1}"
      },
      store_weapons = {
        title = "Immagazzina armi",
        description = "Immagazzina le tue armi nel tuo inventario."
      }
    },
    identity = {
      info = "<em>Cognome: </em>{1}<br /><em>Nome: </em>{2}<br /><em>Età: </em>{3}<br /><em>Registrazione n°: </em>{4}<br /><em>Telefono: </em>{5}<br /><em>Società: </em>{6}<br /><em>Capitale società: </em>{7} €<br /><em>Indirizzo: </em>{9}, {8}"
    }
  },
  emergency = {
    menu = {
      revive = {
        title = "Rianima",
        description = "Rianima il giocatore più vicino.",
        not_in_coma = "~r~Non in coma."
      }
    }
  },
  phone = {
    title = "Telefono",
    directory = {
      title = "Rubrica",
      description = "Apri la rubrica telefonica.",
      add = {
        title = "> Aggiungi",
        prompt_number = "Inserisci il numero da aggiungere:",
        prompt_name = "Inserisci il nome salvato:",
        added = "~g~Inserito."
      },
      sendsms = {
        title = "Invia SMS",
        prompt = "Inserisci il messaggio (max {1} chars):",
        sent = "~g~ Inviato a n°{1}.",
        not_sent = "~r~ n°{1} non disponibile."
      },
      sendpos = {
        title = "Invia posizione",
      },
      remove = {
        title = "Rimuovi"
      }
    },
    sms = {
      title = "Cronologia SMS",
      description = "Cronologia SMS ricevuti.",
      info = "<em>{1}</em><br /><br />{2}",
      notify = "SMS~b~ {1}:~s~ ~n~{2}"
    },
    smspos = {
      notify = "Posizione-SMS ~b~ {1}"
    },
    service = {
      title = "Servizi",
      description = "Chiama un servizio o un numero di emergenza.",
      prompt = "Se necessario, inserisci un messaggio per la chiamata:",
      ask_call = "Ricevuta chiamata {1}, la prendi? <em>{2}</em>",
      taken = "~r~Questa chiamata e' già stata presa."
    },
    announce = {
      title = "Annuncio",
      description = "Posta un annuncio visibile a tutti per qualche secondo.",
      item_desc = "{1} €<br /><br/>{2}",
      prompt = "Contenuto annuncio (10-1000 chars): "
    }
  },
  emotes = {
    title = "Animazioni",
    clear = {
      title = "> Ferma",
      description = "Interrompe qualsiasi animazione in atto."
    }
  },
  home = {
    buy = {
      title = "Compra",
      description = "Compra una casa qui, il prezzo e' {1} €.",
      bought = "~g~Comprato.",
      full = "~r~Il posto è pieno.",
      have_home = "~r~Possiedi già una casa."
    },
    sell = {
      title = "Vendi",
      description = "Vendi casa tua per {1} €",
      sold = "~g~Venduto.",
      no_home = "~r~Non hai una casa qui."
    },
    intercom = {
      title = "Citofono",
      description = "Usa il citofono per entrare in una casa.",
      prompt = "Numero:",
      not_available = "~r~Non disponibile.",
      refused = "~r~Ha rifiutato la tua richiesta.",
      prompt_who = "Dì chi sei:",
      asked = "Chiedendo...",
      request = "Qualcuno vuole aprire la porta di casa tua: <em>{1}</em>"
    },
    slot = {
      leave = {
        title = "Esci"
      },
      ejectall = {
        title = "Butta tutti fuori",
        description = "Butta fuori tutti gli ospiti, compreso te e chiudi casa."
      }
    },
    wardrobe = {
      title = "Guardaroba",
      save = {
        title = "> Salva",
        prompt = "Salva come:"
      }
    },
    gametable = {
      title = "Tavolo da gioco",
      bet = {
        title = "Inizia scommessa",
        description = "Inizia una scommessa con giocatori vicino a te, il vincitore viene scelto casualmente.",
        prompt = "Valore scommessa:",
        request = "[BET] Vuoi scommettere {1} € ?",
        started = "~g~Scommessa iniziata."
      }
    }
  },
  garage = {
    title = "Garage ({1})",
    owned = {
      title = "Posseduti",
      description = "Veicoli posseduti."
    },
    buy = {
      title = "Compra",
      description = "Compra veicoli.",
      info = "{1} €<br /><br />{2}"
    },
    sell = {
      title = "Vendi",
      description = "Vendi veicoli."
    },
    rent = {
      title = "Affitta",
      description = "Affitta un veicolo per questa sessione (fino alla disconnessione)."
    },
    store = {
      title = "Parcheggia",
      description = "Metti il tuo attuale veicolo in garage."
    }
  },
  vehicle = {
    title = "Veicolo",
    no_owned_near = "~r~Nessun veicolo posseduto vicino.",
    trunk = {
      title = "Bagagliaio",
      description = "Apri il bagagliaio del veicolo."
    },
    detach_trailer = {
      title = "Stacca gancio",
      description = "Stacca gancio."
    },
    detach_towtruck = {
      title = "Stacca carroattrezzi",
      description = "Stacca carroattrezzi."
    },
    detach_cargobob = {
      title = "Stacca cargobob",
      description = "Stacca cargobob."
    },
    lock = {
      title = "Chiudi/Apri",
      description = "Chiudi o apri il veicolo."
    },
    engine = {
      title = "Motore on/off",
      description = "Accendi o spegni il motore."
    },
    asktrunk = {
      title = "Chiedi di aprire bagagliaio",
      asked = "~g~Chiedendo...",
      request = "Vuoi aprire il bagagliaio?"
    },
    replace = {
      title = "Rimpiazza veicolo",
      description = "Riposiziona il veicolo più vicino."
    },
    repair = {
      title = "Ripara veicolo",
      description = "Ripara il veicolo più vicino."
    }
  },
  gunshop = {
    title = "Negozio d'armi ({1})",
    prompt_ammo = "Quante munizioni vuoi comprare per {1}?:",
    info = "<em>corpo: </em> {1} €<br /><em>munizioni: </em> {2} €/u<br /><br />{3}"
  },
  market = {
    title = "Negozio ({1})",
    prompt = "Quanti {1} compri?:",
    info = "{1} €<br /><br />{2}"
  },
  skinshop = {
    title = "Skinshop"
  },
  skinshop = {
    title = "Negozio d'abbigliamento"
  },
  cloakroom = {
    title = "Guardaroba ({1})",
    undress = {
      title = "> Spoglia"
    }
  },
  itemtr = {
    informer = {
      title = "Informatore illegale",
      description = "{1} €",
      bought = "~g~Posizione inviata al tuo GPS."
    }
  },
  mission = {
    blip = "Missione ({1}) {2}/{3}",
    display = "<span class=\"name\">{1}</span> <span class=\"step\">{2}/{3}</span><br /><br />{4}",
    cancel = {
      title = "Cancella missione"
    }
  },
  aptitude = {
    title = "Attitudini",
    description = "Mostra attitudini.",
    lose_exp = "Attitudine ~b~{1}/{2} ~r~-{3} ~s~exp.",
    earn_exp = "Attitudine ~b~{1}/{2} ~g~+{3} ~s~exp.",
    level_down = "Attitudine ~b~{1}/{2} ~r~lose level ({3}).",
    level_up = "Attitudine ~b~{1}/{2} ~g~level up ({3}).",
    display = {
      group = "{1}: ",
      aptitude = "--- {1} | exp {2} | lvl {3} | progresso {4}%"
    }
  }
}

return lang
