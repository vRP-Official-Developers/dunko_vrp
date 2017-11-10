
-- define all language properties

local lang = {
  common = {
    welcome = "Bienvenido, utiliza K para abrir el menu.~n~",
    no_player_near = "~r~No hay ningun jugador cerca.",
    invalid_value = "~r~Valor no válido..",
    invalid_name = "~r~Nombre no válido..",
    not_found = "~r~No encontrado.",
    request_refused = "~r~Peticion rechazada.",
    wearing_uniform = "~r~Estas llevando un uniforme.",
    not_allowed = "~r~No permitido."
  },
  weapon = {
    pistol = "Pistola"
  },  
  survival = {
    starving = "Hambriento",
    thirsty = "Sediento"
  },
  money = {
    display = "<span class=\"symbol\">$</span> {1}",
    bdisplay = "<span class=\"symbol\">$</span> {1}",
    given = "Has dado ~r~{1}$.",
    received = "Has recibido ~g~{1}$.",
    not_enough = "~r~No tienes dinero suficiente.",
    paid = "Pagado ~r~{1}$.",
    give = {
      title = "Dar dinero",
      description = "Da dinero al jugador mas cercano.",
      prompt = "Cantidad:"
    }
  },
  inventory = {
    title = "Inventario",
    description = "Abre el inventario.",
    iteminfo = "({1})<br /><br />{2}<br /><em>{3} kg</em>",
    info_weight = "peso {1}/{2} kg",
    give = {
      title = "Dar",
      description = "Dar objeto al jugador mas cercano.",
      prompt = "Cantidad a dar (max {1}):",
      given = "Has dado ~r~{1} ~s~{2}.",
      received = "Has recibido ~g~{1} ~s~{2}.",
    },
    trash = {
      title = "Tirar",
      description = "Tirar objeto",
      prompt = "Cuanto quieres tirar (max {1}):",
      done = "Has tirado ~r~{1} ~s~{2}."
    },
    missing = "~r~Te falta {2} {1}.",
    full = "~r~Inventario lleno.",
    chest = {
      title = "Armario",
      already_opened = "~r~Este armario ya esta abierto por otra persona.",
      full = "~r~Armario lleno.",
      take = {
        title = "Retirar",
        prompt = "Cuanto retirar (max {1}):"
      },
      put = {
        title = "Depositar",
        prompt = "Cantidad a depositar (max {1}):"
      }
    }
  },
  atm = {
    title = "Cajero",
    info = {
      title = "Info",
      bank = "Saldo: {1} $"
    },
    deposit = {
      title = "Depositar",
      description = "Ingresar al banco.",
      prompt = "Introduce la cantidad a ingresar:",
      deposited = "~r~{1}$~s~ ingresado."
    },
    withdraw = {
      title = "Retirar",
      description = "Retirar del banco.",
      prompt = "Introduce la cantidad a retirar:",
      withdrawn = "~g~{1}$ ~s~retirado.",
      not_enough = "~r~No tienes suficiente para retirar."
    }
  },
  business = {
    title = "Cámara de Comercio",
    directory = {
      title = "Listado de empresas.",
      description = "Empresas.",
      dprev = "> ant",
      dnext = "> sig",
      info = "<em>Capital: </em>{1} $<br /><em>Dueño: </em>{2} {3}<br /><em>Registro mercantil: </em>{4}<br /><em>Teléfono: </em>{5}"
    },
    info = {
      title = "Información del negocio.",
      info = "<em>Nombre: </em>{1}<br /><em>Capital: </em>{2} $<br /><em>Capital transferido: </em>{3} $<br /><br/>El capital transferido es el capital que se ha transferido durante un periodo de una hora en un negocio."
    },
    addcapital = {
      title = "Añadir capital.",
      description = "Añade capital a tu empresa.",
      prompt = "Cantidad a añadir:",
      added = "~r~{1}$ ~s~añadidos al capital de la empresa."
    },
    launder = {
      title = "Lavado de dinero.",
      description = "Utiliza tu empresa para limpiar el dinero.",
      prompt = "Cantidad de dinero negro a limpiar (max {1} $): ",
      laundered = "~g~{1}$ ~s~limpiado.",
      not_enough = "~r~No tienes suficiente dinero negro."
    },
    open = {
      title = "Abrir negocio.",
      description = "Abre un nuevo negocio, capital mínimo {1} $.",
      prompt_name = "Nombre del negocio, (no se puede cambiar más adelante, max {1} chars):",
      prompt_capital = "Capital inicial (min {1})",
      created = "~g~Negocio creado."
      
    }
  },
  cityhall = {
    title = "Ayuntamiento",
    identity = {
      title = "Nueva identidad.",
      description = "Adquire una nueva identidad, coste = {1} $.",
      prompt_firstname = "Introduce tu nombre:",
      prompt_name = "Introduce tu apellido: ",
      prompt_age = "Introduce tu edad:",
    },
    menu = {
      title = "Identidad",
      info = "<em>Nombre: </em>{2}<br /><em>Apellido: </em>{1}<br /><em>Edad: </em>{3}<br /><em>DNI: </em>{4}<br /><em>Teléfono: </em>{5}<br /><em>Dirección: </em>{7}, {6}"
    }
  },
  police = {
    title = "Policia",
    wanted = "Búsqueda {1}",
    not_handcuffed = "~r~No esposado.",
    cloakroom = {
      title = "Taquillas",
      uniform = {
        title = "Uniforme",
        description = "Ponte el uniforme."
      }
    },
    pc = {
      title = "Superordenador",
      searchreg = {
        title = "Buscar DNI:",
        description = "Recoje información por DNI.",
        prompt = "Introduce el DNI:"
      },
      closebusiness = {
        title = "Cerrar empresa.",
        description = "Cierra la empresa del jugador mas cercano..",
        request = "Estas seguro de que quieres cerrar la empresa {3} de {1} {2} ?",
        closed = "~g~Empresa clausurada."
      },
      trackveh = {
        title = "Rastrear vehículo.",
        description = "Registra un vehículo por matrícula.",
        prompt_reg = "Introduce matrícula:",
        prompt_note = "Introduce motivo de rastreo:",
        tracking = "~b~Rastreo en progreso..",
        track_failed = "~b~Rastreo de {1}~s~ ({2}) ~n~~r~fallido.",
        tracked = "Rastreado {1} ({2})"
      },
      records = {
        show = {
          title = "Mostrar antecedentes.",
          description = "Mostrar antecedentes."
        },
        delete = {
          title = "Limpiar antecedentes.",
          description = "Limpiar los antecedentes..",
          deleted = "~b~Antecedentes limpios."
        }
      }
    },
    menu = {
      handcuff = {
        title = "Esposar.",
        description = "Esposa/Desesposa al jugador mas cercano.."
      },
      putinveh = {
        title = "Meter en vehiculo.",
        description = "Mete al jugador esposado mas cercano en el vehículo."
      },
      getoutveh = {
        title = "Sacar del vehículo.",
        description = "Saca al jugador esposado mas cercano del vehículo."
      },
      askid = {
        title = "Perdir DNI",
        description = "Pedir DNI al jugador mas cercano.",
        request = "¿Quieres enseñar tu DNI?",
        request_hide = "Ocultar DNI..",
        asked = "Pidiendo DNI..."
      },
      check = {
        title = "Cachear jugador.",
        description = "Cachea al jugador mas cercano, muestra armas, dinero y objetos.",
        request_hide = "Ocultar reporte..",
        info = "<em>Dinero: </em>{1} $<br /><br /><em>Inventario: </em>{2}<br /><br /><em>Armas: </em>{3}",
        checked = "Has sido cacheado."
      },
      seize = {
        seized = "Confiscado {2} ~r~{1}",
        weapons = {
          title = "Confiscar armas.",
          description = "Confisca las armas del jugador más cercano.",
          seized = "~b~Tus armas han sido confiscados."
        },
        items = {
          title = "Confiscar objetos ilegales.",
          description = "Confisca los objetos ilegales del jugador mas cercano.",
          seized = "~b~Tus objetos ilegales han sido confiscados.."
        }
      },
      jail = {
        title = "Encarcelar",
        description = "Encarcela/Suelta al jugador mas cercano en/de la carcel..",
        not_found = "~r~Ninguna prisión cerca.",
        jailed = "~b~Encarcela.",
        unjailed = "~b~Soltado..",
        notify_jailed = "~b~Te han encarcelado..",
        notify_unjailed = "~b~Te han soltado."
      },
      fine = {
        title = "Multar",
        description = "Multa al jugador mas cercano.",
        fined = "~b~Multado ~s~{2} $ por ~b~{1}.",
        notify_fined = "~b~Te han multado ~s~ {2} $ por ~b~{1}.",
        record = "[Multar] {2} $ por {1}"
      },
      store_weapons = {
        title = "Guardar armas",
        description = "Guarda tus armas en el inventario."
      }
    },
    identity = {
      info = "<em>Nombre: </em>{1}<br /><em>Apellidos: </em>{2}<br /><em>Edad: </em>{3}<br /><em>DNI: </em>{4}<br /><em>Teléfono: </em>{5}<br /><em>Empresa: </em>{6}<br /><em>Capital de empresa: </em>{7} $<br /><em>Direcciòn: </em>{9}, {8}"
    }
  },
  emergency = {
    menu = {
      revive = {
        title = "Reanimar",
        description = "Reanima al jugador mas cercano.",
        not_in_coma = "~r~El jugador no esta en coma."
      }
    }
  },
  phone = {
    title = "Móvil",
    directory = {
      title = "Agenda",
      description = "Abre la agenda de tu móvil.",
      add = {
        title = "➕ Añadir",
        prompt_number = "Introduce el número a añadir:",
        prompt_name = "Introduce el nombre:",
        added = "~g~Contacto añadido."
      },
      sendsms = {
        title = "Manda SMS",
        prompt = "Introduce el mensaje a enviar (max {1} chars):",
        sent = "~g~ Enviado a n°{1}.",
        not_sent = "~r~ n°{1} fuera de cobertura."
      },
      sendpos = {
        title = "Enviar localización",
      },
      remove = {
        title = "Borrar"
      }
    },
    sms = {
      title = "Historial",
      description = "SMS recibidos.",
      info = "<em>{1}</em><br /><br />{2}",
      notify = "SMS~b~ {1}:~s~ ~n~{2}"
    },
    smspos = {
      notify = "Localización SMS ~b~ {1}"
    },
    service = {
      title = "Servicios",
      description = "Pide un servicio público.",
      prompt = "Introduce un mensaje claro y conciso de lo sucedido:",
      ask_call = "Recibida {1} llamada, quieres atenderla ? <em>{2}</em>",
      taken = "~r~Esta llamada ya ha sido atendida."
    },
    announce = {
      title = "Anunciar",
      description = "Anunciate durantes unos instantes en la gran pantalla.",
      item_desc = "{1} $<br /><br/>{2}",
      prompt = "Contenido de anuncio (10-1000 chars): "
    }
  },
  emotes = {
    title = "Animaciones",
    clear = {
      title = "> Parar",
      description = "Para todas las animaciones."
    }
  },
  home = {
    buy = {
      title = "Comprar",
      description = "Compra esta casa, el precio es {1} $.",
      bought = "~g~Comprada.",
      full = "~r~Esta casa ya esta vendida.",
      have_home = "~r~Ya tienes una casa."
    },
    sell = {
      title = "Vender",
      description = "Vende tu casa por {1} $",
      sold = "~g~Vendida.",
      no_home = "~r~No tienes ninguna casa aqui."
    },
    intercom = {
      title = "Timbre",
      description = "Usa el timbre para entrar a la casa.",
      prompt = "Número de casa:",
      not_available = "~r~No disponible.",
      refused = "~r~Rechazado.",
      prompt_who = "Di quien eres:",
      asked = "Tocando el timbre...",
      request = "Alguien quiere entrar, lo dejas? : <em>{1}</em>"
    },
    slot = {
      leave = {
        title = "Salir"
      },
      ejectall = {
        title = "Echar a todos",
        description = "Echa a todos, incluido tu mismo de la casa.."
      }
    },
    wardrobe = {
      title = "Ropero",
      save = {
        title = "> Guardar",
        prompt = "Guarda con nombre:"
      }
    },
    gametable = {
      title = "Apuestas",
      bet = {
        title = "Empieza una apuesta con el jugador mas cercano",
        description = "Empieza una apuesta con el jugador mas cercano, un jugador aleatorio se llevará el dinero",
        prompt = "Dinero:",
        request = "[BET] Quieres apostar {1} $ ?",
        started = "~g~Apuesta empezada."
      }
    }
  },
  garage = {
    title = "Garaje ({1})",
    owned = {
      title = "En propiedad",
      description = "Vehiculos en propiedad."
    },
    buy = {
      title = "Comprar",
      description = "Compra vehículos.",
      info = "{1} $<br /><br />{2}"
    },
    sell = {
      title = "Vende",
      description = "Vende tus vehículos."
    },
    rent = {
      title = "Alquilar",
      description = "Alquila un coche durante tu estancia (hasta que te desconectes)."
    },
    store = {
      title = "Guardar",
      description = "Mete tu vehículo en el garaje."
    }
  },
  vehicle = {
    title = "Vehículo",
    no_owned_near = "~r~Ningún vehículo propio cerca.",
    trunk = {
      title = "Maletero",
      description = "Abre el maletero.."
    },
    detach_trailer = {
      title = "Soltar trailer.",
      description = "Detach trailer."
    },
    detach_towtruck = {
      title = "Soltar grua.",
      description = "Detach tow truck."
    },
    detach_cargobob = {
      title = "Soltar cargobob",
      description = "Detach cargobob."
    },
    lock = {
      title = "Bloquea / Desbloquea",
      description = "Bloquea o desbloquea tu coche."
    },
    engine = {
      title = "Motor ON / OFF",
      description = "Enciende o apaga el motor de tu coche."
    },
    asktrunk = {
      title = "Pedir abrir el maletero.",
      asked = "~g~Petición en curso...",
      request = "Quieres abrir el maletero ?"
    },
    replace = {
      title = "Reemplaza el vehículo.",
      description = "Reemplaza el vehículo mas cercano.."
    },
    repair = {
      title = "Reparar",
      description = "Repara el coche mas cercano."
    }
  },
  gunshop = {
    title = "Armería ({1})",
    prompt_ammo = "Cuantas balas comprar:  {1}:",
    info = "<em>Cuerpo: </em> {1} $<br /><em>Cargador: </em> {2} $/u<br /><br />{3}"
  },
  market = {
    title = "Mercado ({1})",
    prompt = "Cantidad de {1} a comprar:",
    info = "{1} $<br /><br />{2}"
  },
  skinshop = {
    title = "Zara"
  },
  cloakroom = {
    title = "Taquillas ({1})",
    undress = {
      title = "> Quitar uniforme"
    }
  },
  itemtr = {
    informer = {
      title = "Illegal Informer",
      description = "{1} $",
      bought = "~g~Position sent to your GPS."
    }
  },
  mission = {
    blip = "Trabajo ({1}) {2}/{3}",
    display = "<span class=\"name\">{1}</span> <span class=\"step\">{2}/{3}</span><br /><br />{4}",
    cancel = {
      title = "Cancelar trabajo."
    }
  },
  aptitude = {
    title = "Habilidades",
    description = "Mostrar habilidades.",
    lose_exp = "Habilidad ~b~{1}/{2} ~r~-{3} ~s~exp.",
    earn_exp = "Habilidad ~b~{1}/{2} ~g~+{3} ~s~exp.",
    level_down = "Habilidad ~b~{1}/{2} ~r~perdida level ({3}).",
    level_up = "Habilidad ~b~{1}/{2} ~g~level up ({3}).",
    display = {
      group = "{1}: ",
      aptitude = "--- {1} | exp {2} | lvl {3} | progress {4}%"
    }
  }
}

return lang
