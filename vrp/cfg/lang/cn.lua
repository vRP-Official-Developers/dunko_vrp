
--CN汉化Jiao1911、Crazy 

-- define all language properties

local lang = {
  common = {
    welcome = "歡迎來到服務器,按K來使用菜單.~n~",
    no_player_near = "~r~你附近沒有玩家.",
    invalid_value = "~r~無效的值.",
    invalid_name = "~r~無效的名字.",
    not_found = "~r~沒有找到.",
    request_refused = "~r~請求被拒絕.",
    wearing_uniform = "~r~小心, 你穿著制服.",
    not_allowed = "~r~不允許."
  },
  weapon = {
    pistol = "手槍"
  },  
  survival = {
    starving = "飢餓",
    thirsty = "口渴"
  },
  money = {
    display = "<span class=\"symbol\">$</span> {1}",
    bdisplay = "<span class=\"symbol\">$</span> {1}",
    given = "Given ~r~{1}$.",
    received = "Received ~g~{1}$.",
    not_enough = "~r~沒有足夠的金錢",
    paid = "Paid ~r~{1}$.",
    give = {
      title = "給錢",
      description = "給最近的玩家錢.",
      prompt = "給予的金額:"
    }
  },
  inventory = {
    title = "庫存",
    description = "打開庫存.",
    iteminfo = "({1})<br /><br />{2}<br /><em>{3} kg</em>",
    info_weight = "重量 {1}/{2} kg",
    give = {
      title = "給",
      description = "向最近的玩家提供物品.",
      prompt = "要給予的金額 (max {1}):",
      given = "給定 ~r~{1} ~s~{2}.",
      received = "收到 ~g~{1} ~s~{2}.",
    },
    trash = {
      title = "垃圾",
      description = "銷毀專案.",
      prompt = "等於垃圾 (max {1}):",
      done = "丟棄~r~{1} ~s~{2}."
    },
    missing = "~r~失蹤 {2} {1}.",
    full = "~r~庫存已滿.",
    chest = {
      title = "胸",
      already_opened = "~r~這個箱子已經被別人打開了.",
      full = "~r~胸部飽滿.",
      take = {
        title = "需要",
        prompt = "需要的金額 (max {1}):"
      },
      put = {
        title = "把",
        prompt = "要投入的金額 (max {1}):"
      }
    }
  },
  atm = {
    title = "ATM",
    info = {
      title = "資訊",
      bank = "銀行: {1} $"
    },
    deposit = {
      title = "存款",
      description = "存款",
      prompt = "輸入存款金額:",
      deposited = "~r~{1}$~s~ 存."
    },
    withdraw = {
      title = "取款",
      description = "取款",
      prompt = "輸入取款金額:",
      withdrawn = "~g~{1}$ ~s~取出.",
      not_enough = "~r~你沒有足夠的錢在銀行."
    }
  },
  business = {
    title = "商會",
    directory = {
      title = "目錄",
      description = "企業名錄.",
      dprev = "> 上",
      dnext = "> 下",
      info = "<em>capital: </em>{1} $<br /><em>owner: </em>{2} {3}<br /><em>registration n°: </em>{4}<br /><em>phone: </em>{5}"
    },
    info = {
      title = "Business info",
      info = "<em>name: </em>{1}<br /><em>capital: </em>{2} $<br /><em>capital transfer: </em>{3} $<br /><br/>Capital transfer is the amount of money transfered for a business economic period, the maximum is the business capital."
    },
    addcapital = {
      title = "新增資本",
      description = "為你的生意新增資本.",
      prompt = "添加到業務資金的金額:",
      added = "~r~{1}$ ~s~添加到業務資金."
    },
    launder = {
      title = "洗錢",
      description = "用你的生意洗黑錢.",
      prompt = "洗黑錢金額 (max {1} $): ",
      laundered = "~g~{1}$ ~s~清洗.",
      not_enough = "~r~沒有足够的錢."
    },
    open = {
      title = "開放業務",
      description = "打開您的業務, 最低資本是 {1} $.",
      prompt_name = "業務名稱 (can't change after, max {1} chars):",
      prompt_capital = "初始資本 (min {1})",
      created = "~g~業務創建."
      
    }
  },
  cityhall = {
    title = "市政廳",
    identity = {
      title = "新身份",
      description = "創建新身份,成本 = {1} $.",
      prompt_firstname = "輸入您的名字:",
      prompt_name = "輸入您的姓氏:",
      prompt_age = "進入你的年齡:",
    },
    menu = {
      title = "身份",
      info = "<em>First name: </em>{2}<br /><em>Last name: </em>{1}<br /><em>Age: </em>{3}<br /><em>Registration n°: </em>{4}<br /><em>Phone: </em>{5}<br /><em>Address: </em>{7}, {6}"
    }
  },
  police = {
    title = "警員",
    wanted = "想要的等級 {1}",
    not_handcuffed = "~r~沒有戴上手銬",
    cloakroom = {
      title = "服裝",
      uniform = {
        title = "統一",
        description = "穿上制服."
      }
    },
    pc = {
      title = "PC",
      searchreg = {
        title = "註冊搜索",
        description = "通過註冊搜索標識.",
        prompt = "輸入註冊號:"
      },
      closebusiness = {
        title = "關閉業務",
        description = "關閉最近的玩家的業務.",
        request = "是否確實要關閉 {3}  擁有的業務 {1} {2} ?",
        closed = "~g~業務關閉."
      },
      trackveh = {
        title = "履帶車輛",
        description = "用車牌號追蹤車輛.",
        prompt_reg = "輸入註冊號:",
        prompt_note = "輸入跟蹤說明/原因:",
        tracking = "~b~開始跟蹤.",
        track_failed = "~b~跟蹤 {1}~s~ ({2}) ~n~~r~失敗.",
        tracked = "跟蹤 {1} ({2})"
      },
      records = {
        show = {
          title = "顯示記錄",
          description = "按登記號碼顯示警方紀錄."
        },
        delete = {
          title = "清除記錄",
          description = "按登記號碼清除警方紀錄.",
          deleted = "~b~警方記錄已刪除"
        }
      }
    },
    menu = {
      handcuff = {
        title = "手銬",
        description = "手銬/unhandcuff 最近的球員."
      },
      putinveh = {
        title = "把車輛",
        description = "把最近的手銬的球員在最近的車輛，乘客。"
      },
      getoutveh = {
        title = "離開車輛",
        description = "走出汽車最近上手的球員."
      },
      askid = {
        title = "詢問 ID",
        description = "從最近的玩家那裡詢問身份證",
        request = "你想給我你的身份證嗎？",
        request_hide = "把身份證藏起來.",
        asked = "詢問 ID..."
      },
      check = {
        title = "檢查玩家",
        description = "檢查最近玩家的錢、庫存和武器.",
        request_hide = "隱藏檢查報告.",
        info = "<em>money: </em>{1} $<br /><br /><em>inventory: </em>{2}<br /><br /><em>weapons: </em>{3}",
        checked = "你被檢查過了."
      },
      seize = {
        seized = "抓住 {2} ~r~{1}",
        weapons = {
          title = "奪取武器",
          description = "抓住最近玩家的武器",
          seized = "~b~你的武器被沒收了."
        },
        items = {
          title = "抓住非法移民",
          description = "沒收違法物品",
          seized = "~b~你的非法物品已被查封."
        }
      },
      jail = {
        title = "監獄",
        description = "監獄/ UnJail離最近的監獄最近的玩家.",
        not_found = "~r~沒有發現監獄.",
        jailed = "~b~入獄.",
        unjailed = "~b~被判入獄.",
        notify_jailed = "~b~你被监禁了.",
        notify_unjailed = "~b~您已被判入獄."
      },
      fine = {
        title = "法恩",
        description = "罚款最近的玩家.",
        fined = "~b~罰款 ~s~{2} $ for~b~{1}.",
        notify_fined = "~b~你被罰款了 ~s~ {2} $ for ~b~{1}.",
        record = "[罰款] {2} $ for {1}"
      },
      store_weapons = {
        title = "儲存武器",
        description = "把你的武器儲存在你的庫存裏."
      }
    },
    identity = {
      info = "<em>Name: </em>{1}<br /><em>First name: </em>{2}<br /><em>Age: </em>{3}<br /><em>Registration n°: </em>{4}<br /><em>Phone: </em>{5}<br /><em>Business: </em>{6}<br /><em>Business capital: </em>{7} $<br /><em>Address: </em>{9}, {8}"
    }
  },
  emergency = {
    menu = {
      revive = {
        title = "恢復",
        description = "恢復最近的球員玩家.",
        not_in_coma = "~r~不是昏迷."
      }
    }
  },
  phone = {
    title = "電話",
    directory = {
      title = "號碼簿",
      description = "打開電話目錄.",
      add = {
        title = "➕ add",
        prompt_number = "輸入要添加的電話號碼:",
        prompt_name = "輸入條目名:",
        added = "~g~條目添加."
      },
      sendsms = {
        title = "發送短信",
        prompt = "輸入消息 (max {1} chars):",
        sent = "~g~ 發送到 n°{1}.",
        not_sent = "~r~ n°{1} 不可用."
      },
      sendpos = {
        title = "發送位置",
      },
      remove = {
        title = "删除"
      }
    },
    sms = {
      title = "簡訊的歷史",
      description = "收到簡訊的歷史.",
      info = "<em>{1}</em><br /><br />{2}",
      notify = "短訊~b~ {1}:~s~ ~n~{2}"
    },
    smspos = {
      notify = "簡訊-位置 ~b~ {1}"
    },
    service = {
      title = "服務",
      description = "生產服務或急救號碼.",
      prompt = "如果需要，輸入服務的消息:",
      ask_call = "收到 {1} 呼叫，你接受了嗎？ <em>{2}</em>",
      taken = "~r~正在通話."
    },
    announce = {
      title = "宣佈",
      description = "發佈公告可見所有人幾秒鐘.",
      item_desc = "{1} $<br /><br/>{2}",
      prompt = "宣佈內容（10-1000字符）: "
    }
  },
  emotes = {
    title = "表情",
    clear = {
      title = "> 清除",
      description = "清除所有正在運行的表情."
    }
  },
  home = {
    buy = {
      title = "買",
      description = "在這裡買一個家，價格是 {1} $.",
      bought = "~g~購買.",
      full = "~r~這地方滿了.",
      have_home = "~r~你已經有了家."
    },
    sell = {
      title = "賣",
      description = "賣你的房子 {1} $",
      sold = "~g~出售.",
      no_home = "~r~你在這裡沒有家."
    },
    intercom = {
      title = "講",
      description = "使用對講機進入家庭.",
      prompt = "數位:",
      not_available = "~r~不可用.",
      refused = "~r~拒絕進入.",
      prompt_who = "說你是誰:",
      asked = "詢問...",
      request = "有人想打開您的家庭門: <em>{1}</em>"
    },
    slot = {
      leave = {
        title = "離開"
      },
      ejectall = {
        title = "全部出去",
        description = "趕出所有的家庭訪客, 包括你, 並關閉的家."
      }
    },
    wardrobe = {
      title = "衣櫃",
      save = {
        title = "> 保存",
        prompt = "保存名稱:"
      }
    },
    gametable = {
      title = "遊戲桌",
      bet = {
        title = "開始下注",
        description = "與你附近的玩家開始下注, 贏家將被隨機選中.",
        prompt = "投注金額:",
        request = "[打賭] 你想賭 {1} $ ?",
        started = "~g~開始下注."
      }
    }
  },
  garage = {
    title = "車庫 ({1})",
    owned = {
      title = "國有",
      description = "擁有的車輛."
    },
    buy = {
      title = "買",
      description = "購買車輛.",
      info = "{1} $<br /><br />{2}"
    },
    sell = {
      title = "賣",
      description = "銷售車輛."
    },
    rent = {
      title = "租金",
      description = "租用車輛的會議 (直到你斷開)."
    },
    store = {
      title = "存儲",
      description = "把你現在的車放進車庫."
    }
  },
  vehicle = {
    title = "車輛",
    no_owned_near = "~r~附近沒有車輛.",
    trunk = {
      title = "樹幹",
      description = "打開車輛後備箱."
    },
    detach_trailer = {
      title = "將拖車",
      description = "分離拖車."
    },
    detach_towtruck = {
      title = "拆卸拖車",
      description = "拆卸拖車."
    },
    detach_cargobob = {
      title = "分離貨物",
      description = "分離貨物."
    },
    lock = {
      title = "鎖定/解鎖",
      description = "鎖定或解鎖車輛."
    },
    engine = {
      title = "引擎開/關",
      description = "啟動或停止引擎."
    },
    asktrunk = {
      title = "打開後備箱",
      asked = "~g~詢問...",
      request = "你要打開行李箱嗎 ?"
    },
    replace = {
      title = "更換車輛",
      description = "在地上替換最近的車輛."
    },
    repair = {
      title = "修理車輛",
      description = "修理最近的車輛."
    }
  },
  gunshop = {
    title = "槍械店 ({1})",
    prompt_ammo = "購買彈藥的數量 {1}:",
    info = "<em>body: </em> {1} $<br /><em>彈藥： </em> {2} $/u<br /><br />{3}"
  },
  market = {
    title = "市場 ({1})",
    prompt = "要購買的 {1} 金額:",
    info = "{1} $<br /><br />{2}"
  },
  skinshop = {
    title = "皮膚店"
  },
  cloakroom = {
    title = "小件寄存處 ({1})",
    undress = {
      title = "> 脫衣服"
    }
  },
  itemtr = {
    informer = {
      title = "違法者",
      description = "{1} $",
      bought = "~g~位置發送到您的全球定位系統."
    }
  },
  mission = {
    blip = "重要任務 ({1}) {2}/{3}",
    display = "<span class=\"name\">{1}</span> <span class=\"step\">{2}/{3}</span><br /><br />{4}",
    cancel = {
      title = "取消任務"
    }
  },
  aptitude = {
    title = "能力",
    description = "顯示能力.",
    lose_exp = "資質 ~b~{1}/{2} ~r~-{3} ~s~經驗.",
    earn_exp = "資質 ~b~{1}/{2} ~g~+{3} ~s~經驗.",
    level_down = "資質 ~b~{1}/{2} ~r~下降 ({3}).",
    level_up = "資質 ~b~{1}/{2} ~g~提升 ({3}).",
    display = {
      group = "{1}: ",
      aptitude = "--- {1} | 经验 {2} | lvl {3} | 进展 {4}%"
    }
  }
}

return lang
