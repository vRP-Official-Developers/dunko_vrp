
-- define all language properties

local lang = {
  common = {
    welcome = "Bem-vindo ao server. Pressione K para usar o menu.~n~",
    no_player_near = "~r~Nenhum jogador perto de você.",
    invalid_value = "~r~Valor inválido.",
    invalid_name = "~r~Nome inválido.",
    not_found = "~r~Não encontrado.",
    request_refused = "~r~Pedido negado.",
    wearing_uniform = "~r~Cuidado você está usando um uniforme.",
    not_allowed = "~r~Não permitido."
  },
  weapon = {
    pistol = "Pistola"
  },  
  survival = {
    starving = "morrendo de fome",
    thirsty = "com sede"
  },
  money = {
    display = "<span class=\"symbol\">€</span> {1}",
    bdisplay = "<span class=\"symbol\">€</span> {1}",
    given = "Enviado ~r~{1}€.",
    received = "Recebido ~g~{1}€.",
    not_enough = "~r~Dinheiro insuficiente.",
    paid = "Pago ~r~{1}€.",
    give = {
      title = "enviar dinheiro",
      description = "Enviar dinheiro para o jogador mais proxímo.",
      prompt = "Quantidade que deseja enviar:"
    }
  },
  inventory = {
    title = "Inventário",
    description = "Abrir inventário.",
    iteminfo = "({1})<br /><br />{2}<br /><em>{3} kg</em>",
    info_weight = "peso {1}/{2} kg",
    give = {
      title = "Enviar",
      description = "Enviar item para o jogador mais proxímo.",
      prompt = "Quantidade que deseja enviar (max {1}):",
      given = "Enviado ~r~{1} ~s~{2}.",
      received = "Recebido ~g~{1} ~s~{2}.",
    },
    trash = {
      title = "Destruír",
      description = "Destruír itens.",
      prompt = "Quantidade que deseja destruír (max {1}):",
      done = "Destruído ~r~{1} ~s~{2}."
    },
    missing = "~r~Perdido {2} {1}.",
    full = "~r~Inventário cheio.",
    chest = {
      title = "Baú",
      already_opened = "~r~Esse baú já foi aberto por outra pessoa.",
      full = "~r~Baú cheio.",
      take = {
        title = "Pegar",
        prompt = "Quantidade que deseja pegar (max {1}):"
      },
      put = {
        title = "Colocar",
        prompt = "Quantidade que deseja colocar (max {1}):"
      }
    }
  },
  atm = {
    title = "Caíxa eletrônico",
    info = {
      title = "Informação",
      bank = "banco: {1} €"
    },
    deposit = {
      title = "Depositar",
      description = "enviar dinheiro da carteira para o banco",
      prompt = "Coloque a quantidade que deseja depositar:",
      deposited = "~r~{1}€~s~ depositado."
    },
    withdraw = {
      title = "Carteira",
      description = "enviar dinheiro da banco para o carteira",
      prompt = "Coloque a quantidade que deseja retirar:",
      withdrawn = "~g~{1}€ ~s~retirado.",
      not_enough = "~r~Você não tem dinheiro no banco."
    }
  },
  business = {
    title = "Câmara de comércio",
    directory = {
      title = "Directorio",
      description = "Diretório de negócios.",
      dprev = "> Voltar",
      dnext = "> Proxímo",
      info = "<em>capital: </em>{1} €<br /><em>dono: </em>{2} {3}<br /><em>N° de registro: </em>{4}<br /><em>telefone: </em>{5}"
    },
    info = {
      title = "Informações comerciais",
      info = "<em>nome: </em>{1}<br /><em>capital: </em>{2} €<br /><em>capital transferido: </em>{3} €<br /><br/>A transferência de capital é a quantia de dinheiro transferida para um período econômico comercial, o máximo é o capital da empresa."
    },
    addcapital = {
      title = "Adicionar capital",
      description = "Adicionar capital para sua empresa.",
      prompt = "Quantidade que deseja adicionar de capital na sua empresa:",
      added = "~r~{1}€ ~s~Adicionado capital a sua empresa."
    },
    launder = {
      title = "Lavagem de dinheiro",
      description = "Usar sua empresa para lavar dinheiro sujo.",
      prompt = "Quantidade que deseja lavar de dinheiro (max {1} €): ",
      laundered = "~g~{1}€ ~s~lavado.",
      not_enough = "~r~Não dinheiro sujo para lavar."
    },
    open = {
      title = "Abrir empresa",
      description = "Abra seu negócio, o capital mínimo é {1} €.",
      prompt_name = "Nome da empresa (Não é possível mudar depois, max {1} chars):",
      prompt_capital = "Capital Inicial (min {1})",
      created = "~g~Negócios criados."
      
    }
  },
  cityhall = {
    title = "Prefeitura",
    identity = {
      title = "Nova identidade",
      description = "Criar nova identiadde, custo = {1} €.",
      prompt_firstname = "Coloque seu primeiro nome:",
      prompt_name = "Coloque seu último nome:",
      prompt_age = "Coloque sua idade:",
    },
    menu = {
      title = "Identidade",
      info = "<em>Primeiro nome: </em>{2}<br /><em>Último nome: </em>{1}<br /><em>Idade: </em>{3}<br /><em>N° de registro: </em>{4}<br /><em>telefone: </em>{5}<br /><em>Endereço: </em>{7}, {6}"
    }
  },
  police = {
    title = "Policia",
    wanted = "Nível de procurado {1}",
    not_handcuffed = "~r~Não algemado",
    cloakroom = {
      title = "Véstiario",
      uniform = {
        title = "Uniforme",
        description = "Colocar uniforme."
      }
    },
    pc = {
      title = "PC",
      searchreg = {
        title = "Procurando registro",
        description = "Procurar identidade por registro.",
        prompt = "Coloque o número de registro:"
      },
      closebusiness = {
        title = "Fechar empresa",
        description = "Fechar o negócio do jogador mais próximo.",
        request = "Você tem certeza de fechar o negócio? {3} comprado por {1} {2} ?",
        closed = "~g~Empresa fechada."
      },
      trackveh = {
        title = "Rastrear",
        description = "Acompanhe um veículo pelo seu número de registro.",
        prompt_reg = "Insira o número de registro:",
        prompt_note = "Insira uma nota de rastreamento / motivo:",
        tracking = "~b~O rastreamento começou.",
        track_failed = "~b~Rastreamento de {1}~s~ ({2}) ~n~~r~Falhou.",
        tracked = "Monitorados {1} ({2})"
      },
      records = {
        show = {
          title = "Mostrar registros",
          description = "Mostrar registros policiais por número de registro."
        },
        delete = {
          title = "Limpar registros",
          description = "Registros policiais claros por número de registo.",
          deleted = "~b~Registros policiais eliminados"
        }
      }
    },
    menu = {
      handcuff = {
        title = "Algemar",
        description = "Algemar/tirar algemas do jogador mais próximo."
      },
      putinveh = {
        title = "Colocar no veículo",
        description = "Coloque o jogador algemado mais próximo no veículo mais próximo, como passageiro."
      },
      getoutveh = {
        title = "Tirar do veículo",
        description = "Tirar do veículo o jogador algemado mais próximo."
      },
      askid = {
        title = "Peça ID",
        description = "Peça o cartão de identificação do jogador mais próximo.",
        request = "Você quer dar seu cartão de identificação ?",
        request_hide = "Ocultar o cartão de identificação.",
        asked = "Pedindo ID..."
      },
      check = {
        title = "Verifique o jogador",
        description = "Verifique dinheiro, estoque e armas do jogador mais próximo.",
        request_hide = "Ocultar o relatório de cheques.",
        info = "<em>dinheiro: </em>{1} €<br /><br /><em>inventario: </em>{2}<br /><br /><em>armas: </em>{3}",
        checked = "Você está sendo verificado."
      },
      seize = {
        seized = "Apreendido {2} ~r~{1}",
        weapons = {
          title = "Apreender armas",
          description = "Apreender as armas de jogador mais próximas",
          seized = "~b~Suas armas foram apreendidas."
        },
        items = {
          title = "Apreender os ilegais",
          description = "Apreender itens ilegais",
          seized = "~b~Seu material ilegal foi apreendido."
        }
      },
      jail = {
        title = "Cadeia",
        description = "Cadeia / Soltar para o jogador mais próximo dentro / da prisão mais próxima.",
        not_found = "~r~Sem cadeias por perto.",
        jailed = "~b~Preso.",
        unjailed = "~b~Solto.",
        notify_jailed = "~b~Você está sendo preso.",
        notify_unjailed = "~b~Você está sendo solto."
      },
      fine = {
        title = "Multar",
        description = "Multar jogador maís proxímo.",
        fined = "~b~Multar ~s~{2} € por ~b~{1}.",
        notify_fined = "~b~Você está sendo multado ~s~ {2} € por ~b~{1}.",
        record = "[Multa] {2} € por {1}"
      },
      store_weapons = {
        title = "Guardar armas",
        description = "Guardar armas no iventário."
      }
    },
    identity = {
      info = "<em>Nome: </em>{1}<br /><em>Primeiro nome: </em>{2}<br /><em>Idade: </em>{3}<br /><em>N° de registro: </em>{4}<br /><em>Telefone: </em>{5}<br /><em>Empresa: </em>{6}<br /><em>Capital da empresa: </em>{7} €<br /><em>Endereço: </em>{9}, {8}"
    }
  },
  emergency = {
    menu = {
      revive = {
        title = "Reviver",
        description = "Reanimar jogador mais proxímo.",
        not_in_coma = "~r~Não está em coma."
      }
    }
  },
  phone = {
    title = "Telefone",
    directory = {
      title = "Diretório",
      description = "Abrir diretório do telefone.",
      add = {
        title = "➕ Adicionar",
        prompt_number = "Digite o número de telefone para adicionar:",
        prompt_name = "Digite o nome da entrada:",
        added = "~g~Entrada adicionada."
      },
      sendsms = {
        title = "Enviar SMS",
        prompt = "Coloque a mensagem (max {1} chars):",
        sent = "~g~ Enviar para n°{1}.",
        not_sent = "~r~ n°{1} indisponível."
      },
      sendpos = {
        title = "Enviar posição",
      },
      remove = {
        title = "Remover"
      }
    },
    sms = {
      title = "Histórico SMS",
      description = "Histórico de SMS recebido.",
      info = "<em>{1}</em><br /><br />{2}",
      notify = "SMS~b~ {1}:~s~ ~n~{2}"
    },
    smspos = {
      notify = "SMS-Posição ~b~ {1}"
    },
    service = {
      title = "Serviço",
      description = "Ligue para um serviço ou um número de emergência.",
      prompt = "Se necessário, insira uma mensagem para o serviço:",
      ask_call = "Recebendo {1} chamado, você deseja aceitar ? <em>{2}</em>",
      taken = "~r~Essa chamada já foi aceita."
    },
    announce = {
      title = "Anunciar",
      description = "Publique um anúncio visível a todos por alguns segundos.",
      item_desc = "{1} €<br /><br/>{2}",
      prompt = "Anuncie conteúdo (10-1000 chars): "
    }
  },
  emotes = {
    title = "Animações",
    clear = {
      title = "> Limpar",
      description = "Limpe todos as animações em execução."
    }
  },
  home = {
    buy = {
      title = "Comprar",
      description = "Compre uma casa aqui, o preço é {1} €.",
      bought = "~g~Comprou.",
      full = "~r~O lugar está cheio.",
      have_home = "~r~Você já tem uma casa."
    },
    sell = {
      title = "Vender",
      description = "Vender sua casa para {1} €",
      sold = "~g~Vendido.",
      no_home = "~r~Você não tem uma casa aqui."
    },
    intercom = {
      title = "Interfone",
      description = "Use o interfone para entrar em uma casa.",
      prompt = "Número:",
      not_available = "~r~Não disponível.",
      refused = "~r~Entrada negada.",
      prompt_who = "Diga quem é você:",
      asked = "Perguntando...",
      request = "Alguém quer abrir sua porta de casa: <em>{1}</em>"
    },
    slot = {
      leave = {
        title = "Sair"
      },
      ejectall = {
        title = "Todos saem",
        description = "Ejetar todos os visitantes domésticos, incluindo você, e fechar a casa."
      }
    },
    wardrobe = {
      title = "Guarda roupa",
      save = {
        title = "> Salvar",
        prompt = "Salvar com nome:"
      }
    },
    gametable = {
      title = "Mesa de jogo",
      bet = {
        title = "Aposta inicial",
        description = "Comece uma aposta com os jogadores perto de você, o vencedor será selecionado aleatoriamente.",
        prompt = "Valor da aposta:",
        request = "[BET] Você quer apostar {1} € ?",
        started = "~g~Aposta iniciada."
      }
    }
  },
  garage = {
    title = "Garagem ({1})",
    owned = {
      title = "Possuído",
      description = "Veículos próprios."
    },
    buy = {
      title = "Comprar",
      description = "Comprar veículos.",
      info = "{1} €<br /><br />{2}"
    },
    sell = {
      title = "Vender",
      description = "Vender veículo."
    },
    rent = {
      title = "Alugar",
      description = "Alugue um veículo para a sessão (até você se desconectar)."
    },
    store = {
      title = "Guardar",
      description = "Coloque seu veículo atual na garagem."
    }
  },
  vehicle = {
    title = "Veículo",
    no_owned_near = "~r~Nenhum veículo de propriedade perto.",
    trunk = {
      title = "Porta malas",
      description = "Abra o porta-malas do veículo."
    },
    detach_trailer = {
      title = "Retirar trailer",
      description = "Retirar trailer."
    },
    detach_towtruck = {
      title = "Descarte caminhão de reboque",
      description = "Descarte caminhão de reboque."
    },
    detach_cargobob = {
      title = "Desanexar carga",
      description = "Desanexar carga."
    },
    lock = {
      title = "Tracar/destrancar",
      description = "Bloquear ou desbloquear o veículo."
    },
    engine = {
      title = "Ligar/desligar motor",
      description = "Comece ou pare o motor."
    },
    asktrunk = {
      title = "Peça para abrir o porta malas",
      asked = "~g~Perguntado...",
      request = "Você quer abrir o porta-malas ?"
    },
    replace = {
      title = "Substitua o veículo",
      description = "Substitua no solo o veículo mais próximo."
    },
    repair = {
      title = "Veículo de reparação",
      description = "Repare o veículo mais próximo."
    }
  },
  gunshop = {
    title = "Loja de armas ({1})",
    prompt_ammo = "Quantidade de munição a comprar para o {1}:",
    info = "<em>corpo da arma: </em> {1} €<br /><em>munição: </em> {2} €/u<br /><br />{3}"
  },
  market = {
    title = "Mercado ({1})",
    prompt = "Quantidade de {1} para comprar:",
    info = "{1} €<br /><br />{2}"
  },
  skinshop = {
    title = "Loja de roupas"
  },
  cloakroom = {
    title = "Vestuário ({1})",
    undress = {
      title = "> Despir"
    }
  },
  itemtr = {
    informer = {
      title = "Informante ilegal",
      description = "{1} €",
      bought = "~g~Posição enviada ao seu GPS."
    }
  },
  mission = {
    blip = "Missão ({1}) {2}/{3}",
    display = "<span class=\"name\">{1}</span> <span class=\"step\">{2}/{3}</span><br /><br />{4}",
    cancel = {
      title = "Cancelar missão"
    }
  },
  aptitude = {
    title = "Aptidões",
    description = "Mostrar aptidões.",
    lose_exp = "Aptidão ~b~{1}/{2} ~r~-{3} ~s~exp.",
    earn_exp = "Aptidão ~b~{1}/{2} ~g~+{3} ~s~exp.",
    level_down = "Aptidão ~b~{1}/{2} ~r~level perdido ({3}).",
    level_up = "Aptidão ~b~{1}/{2} ~g~level aumentado ({3}).",
    display = {
      group = "{1}: ",
      aptitude = "--- {1} | exp {2} | lvl {3} | progresso {4}%"
    }
  }
}

return lang
