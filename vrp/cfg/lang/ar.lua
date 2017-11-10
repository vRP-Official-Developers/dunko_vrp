
-- define all language properties الغة العربية زورك البقمي برو قيمر

local lang = {
  common = {
    welcome = "Welcome to the server. Press K to use the menu.~n~",
    no_player_near = "~r~No player near you.",
    invalid_value = "~r~Invalid value.",
    invalid_name = "~r~Invalid name.",
    not_found = "~r~Not found.",
    request_refused = "~r~Request refused.",
    wearing_uniform = "~r~Be careful, you are wearing a uniform.",
    not_allowed = "~r~Not allowed."
  },
  weapon = {
    pistol = "المسدس"
  },  
  survival = {
    starving = "الجوع",
    thirsty = "العطش"
  },
  money = {
    display = "<span class=\"symbol\">$</span> {1}",
    bdisplay = "<span class=\"symbol\">$</span> {1}",
    given = "Given ~r~{1}$.",
    received = "Received ~g~{1}$.",
    not_enough = "~r~Not enough money.",
    paid = "Paid ~r~{1}$.",
    give = {
      title = "اعطاء النقود",
      description = "اعطاء النقود لاقرب شخص.",
      prompt = "المبلغ المعطى:"
    }
  },
  inventory = {
    title = "الحقيبة",
    description = "افتح الحقيبة.",
    iteminfo = "({1})<br /><br />{2}<br /><em>{3} kg</em>",
    info_weight = "weight {1}/{2} kg",
    give = {
      title = "اعطاء",
      description = "اعطاء محتويات من الحقيبة لاقرب شخص.",
      prompt = "كمية المعطاه (max {1}):",
      given = "Given ~r~{1} ~s~{2}.",
      received = "Received ~g~{1} ~s~{2}.",
    },
    trash = {
      title = "تخلص منها",
      description = "رمي العنصر من الحقيبة.",
      prompt = "الكمية التي تريد التخلص منها (max {1}):",
      done = "Trashed ~r~{1} ~s~{2}."
    },
    missing = "~r~Missing {2} {1}.",
    full = "~r~Inventory full.",
    chest = {
      title = "الصندوق",
      already_opened = "~r~This chest is already opened by someone else.",
      full = "~r~Chest full.",
      take = {
        title = "اخذ",
        prompt = "الكمية (max {1}):"
      },
      put = {
        title = "ضع",
        prompt = "الكمية (max {1}):"
      }
    }
  },
  atm = {
    title = "صرافة",
    info = {
      title = "معلومات",
      bank = "البنك: {1} $"
    },
    deposit = {
      title = "ايداع",
      description = "ايداع في حسابك",
      prompt = "المبلغ الذي تريد ايداعة:",
      deposited = "~r~{1}$~s~ deposited."
    },
    withdraw = {
      title = "سحب",
      description = "سحب من حسابك",
      prompt = "المبلغ الذي تريد سحبة:",
      withdrawn = "~g~{1}$ ~s~withdrawn.",
      not_enough = "~r~You don't have enough money in bank."
    }
  },
  business = {
    title = "الغرفة التجارية",
    directory = {
      title = "السجلات",
      description = "سجلات التجار.",
      dprev = "> السابق",
      dnext = "> التالي",
      info = "<em>رأس المال: </em>{1} $<br /><em>المالك: </em>{2} {3}<br /><em>الاستمارة n°: </em>{4}<br /><em>الجوال: </em>{5}"
    },
    info = {
      title = "معلومات التجارة",
      info = "<em>الاسم: </em>{1}<br /><em>رأس المال: </em>{2} $<br /><em>رأس المال المحول: </em>{3} $<br /><br/>Capital transfer is the amount of money transfered for a business economic period, the maximum is the business capital."
    },
    addcapital = {
      title = "اضافة رأس مال",
      description = "اضافة رأس مال لشركتك.",
      prompt = "المبلغ المضاف لشركتك:",
      added = "~r~{1}$ ~s~added to the business capital."
    },
    launder = {
      title = "غسيل الاموال",
      description = "استخدم شركتك لغسل الاموال.",
      prompt = "المبلغ الذي تريد غسلة (max {1} $): ",
      laundered = "~g~{1}$ ~s~laundered.",
      not_enough = "~r~Not enough dirty money."
    },
    open = {
      title = "فتح شركة",
      description = "اقل رأس مال لفتح شركة {1} $.",
      prompt_name = "Business name (can't change after, max {1} chars):",
      prompt_capital = "Initial capital (min {1})",
      created = "~g~Business created."
      
    }
  },
  cityhall = {
    title = "الاحوال المدنية",
    identity = {
      title = "هوية جديدة ",
      description = "استخراج هوية جديدة يكلفك {1} ريال.",
      prompt_firstname = "الاسم الاول:",
      prompt_name = "اسم الاخير:",
      prompt_age = "العمر:",
    },
    menu = {
      title = "الهوية",
      info = "<em>الاسم الاول: </em>{2}<br /><em>الاسم الاخير: </em>{1}<br /><em>العمر: </em>{3}<br /><em>الاستمارة n°: </em>{4}<br /><em>الجوال: </em>{5}<br /><em>العنوان: </em>{7}, {6}"
    }
  },
  police = {
    title = "الشرطة",
    wanted = "Wanted rank {1}",
    not_handcuffed = "~r~Not handcuffed",
    cloakroom = {
      title = "غرفة الملابس",
      uniform = {
        title = "الزي الرسمي",
        description = "ارتداء الزي الرسمي."
      }
    },
    pc = {
      title = "مركز العمليات",
      searchreg = {
        title = "البحث من خلال الاستمارة ",
        description = "البحث عن شخص من خلال الاستمارة .",
        prompt = "ادخل رقم الاستمارة:"
      },
      closebusiness = {
        title = "اغلاق الشركة",
        description = "اغلاق شركة اقرب شخص.",
        request = "هل انت واثق من اغلاق الشركة {3} owned by {1} {2} ?",
        closed = "~g~Business closed."
      },
      trackveh = {
        title = "تتبع المركبة",
        description = "تتبع المركبة برقم اللوحة.",
        prompt_reg = "ادخل رقم اللوحة:",
        prompt_note = "ادخال سبب البحث عن لوحة:",
        tracking = "~b~Tracking started.",
        track_failed = "~b~Tracking of {1}~s~ ({2}) ~n~~r~Failed.",
        tracked = "Tracked {1} ({2})"
      },
      records = {
        show = {
          title = "اظهار السجل",
          description = "اظهار سجلات الشرطة بأستخدام رقم الوحة ."
        },
        delete = {
          title = "مسح السجلات",
          description = "مسح السجل بأستخدام رقم الاستمارة.",
          deleted = "~b~Police records deleted"
        }
      }
    },
    menu = {
      handcuff = {
        title = "Handcuff",
        description = "تقييد او فك القيد لاقرب شخص."
      },
      putinveh = {
        title = "اجباره لدخول الى الدورية",
        description = "Put the nearest handcuffed player in the nearest vehicle, as passenger."
      },
      getoutveh = {
        title = "اجباره الخروج من الدورية",
        description = "Get out of vehicle the nearest handcuffed player."
      },
      askid = {
        title = "طلب الهوية",
        description = "طلب الهوية من اقرب شخص.",
        request = "هل تريد اعطائه الهوية ؟",
        request_hide = "اخفاء الهوية.",
        asked = "Asking ID..."
      },
      check = {
        title = "تفتيش",
        description = "تفتيش اقرب شخص.",
        request_hide = "اخفاء محتويات التفتيش.",
        info = "<em>الرصيد: </em>{1} $<br /><br /><em>الحقيبة: </em>{2}<br /><br /><em>الاسلحة: </em>{3}",
        checked = "You have being checked."
      },
      seize = {
        seized = "Seized {2} ~r~{1}",
        weapons = {
          title = "الاستيلاء على الأسلحة",
          description = "الاستيلاء على الاسلحة من اقرب شخص",
          seized = "~b~Your weapons have been seized."
        },
        items = {
          title = "الاستيلاءعلى الممنوعات",
          description = "الاستيلاء على الممنوعات من اقرب شخص",
          seized = "~b~Your illegal stuff has been seized."
        }
      },
      jail = {
        title = "Jail",
        description = "سجن او خروج من سجن لاقرب شخص.",
        not_found = "~r~No jail found.",
        jailed = "~b~Jailed.",
        unjailed = "~b~Unjailed.",
        notify_jailed = "~b~You have been jailed.",
        notify_unjailed = "~b~You have been unjailed."
      },
      fine = {
        title = "Fine المخالفات",
        description = "اعطاء لاقرب شخص مخالفة.",
        fined = "~b~Fined ~s~{2} $ for ~b~{1}.",
        notify_fined = "~b~You have been fined ~s~ {2} $ for ~b~{1}.",
        record = "[Fine] {2} $ for {1}"
      },
      store_weapons = {
        title = "تخزين الأسلحة",
        description = "خزن اسلحتك في الحقيبة."
      }
    },
    identity = {
      info = "<em>الاسم: </em>{1}<br /><em>اسم الاول: </em>{2}<br /><em>العمر: </em>{3}<br /><em>الاستمارة: </em>{4}<br /><em>الجوال: </em>{5}<br /><em>الشركة: </em>{6}<br /><em>رأس مال الشركة: </em>{7} $<br /><em>العنوان: </em>{9}, {8}"
    }
  },
  emergency = {
    menu = {
      revive = {
        title = "انعاش",
        description = "ساعد بانعاش اقرب شخص.",
        not_in_coma = "~r~Not in coma."
      }
    }
  },
  phone = {
    title = "الجوال",
    directory = {
      title = "جهات الاتصال",
      description = "افتح جوالك لاضافة شخص.",
      add = {
        title = "➕ اضافة",
        prompt_number = "ادخل رقم الجوال للاضافة:",
        prompt_name = "ادخل الاسم:",
        added = "~g~Entry added."
      },
      sendsms = {
        title = "ارسال رسالة",
        prompt = "اكتب رسالتك:",
        sent = "~g~ Sent to n°{1}.",
        not_sent = "~r~ n°{1} unavailable."
      },
      sendpos = {
        title = "ارسال موقعك الحالي",
      },
      remove = {
        title = "حذف"
      }
    },
    sms = {
      title = "سجل الرسائل",
      description = "الرسائل الواردة.",
      info = "<em>{1}</em><br /><br />{2}",
      notify = "SMS~b~ {1}:~s~ ~n~{2}"
    },
    smspos = {
      notify = "SMS-Position ~b~ {1}"
    },
    service = {
      title = "الخدمات المدنية ",
      description = "للتواصل مع الطوارئ-اوبر-ميكانيكي.",
      prompt = "If needed, enter a message for the service:",
      ask_call = "Received {1} call, do you take it ? <em>{2}</em>",
      taken = "~r~This call is already taken."
    },
    announce = {
      title = "اعلان",
      description = "ضع اعلانك ليراه الجميع  .",
      item_desc = "{1} $<br /><br/>{2}",
      prompt = "الإعلان عن المحتوى: "
    }
  },
  emotes = {
    title = "الحركات",
    clear = {
      title = "> الغاء",
      description = "الغاء جميع الحركات ."
    }
  },
  home = {
    buy = {
      title = "شراء",
      description = "اشتر بيت هنا , سعره {1} ريال.",
      bought = "~g~Bought.",
      full = "~r~The place is full.",
      have_home = "~r~You already have a home."
    },
    sell = {
      title = "بيع",
      description = "بع بيتك بسعر {1} ريال",
      sold = "~g~Sold.",
      no_home = "~r~You don't have a home here."
    },
    intercom = {
      title = "للدخول الى البيت",
      description = "ادخل الرمز للدخول الى البيت.",
      prompt = "ادخل الرمز:",
      not_available = "~r~Not available.",
      refused = "~r~Refused to enter.",
      prompt_who = "عرف بنفسك:",
      asked = "Asking...",
      request = "<em>{1}</em> شخص ما يريد الدخول الى منزلك  "
    },
    slot = {
      leave = {
        title = "للخروج"
      },
      ejectall = {
        title = "طرد الجميع من منزلك",
        description = "طرد الجميع و الخروج من المنزل واغلاقة."
      }
    },
    wardrobe = {
      title = "خزانةالملابس",
      save = {
        title = "> حفظ",
        prompt = "حفظ بأسم:"
      }
    },
    gametable = {
      title = "طاولة  المراهنة",
      bet = {
        title = "أبدء الرهان",
        description = "أبدء الرهان مع لاعب قريب منك و الفائز يكون عشوائي.",
        prompt = "Bet amount:",
        request = "{1} [طاولة الرهان] هل تريد بدء الرهان",
        started = "~g~Bet started."
      }
    }
  },
  garage = {
    title = "كراج ({1})",
    owned = {
      title = "سيارتي",
      description = "سيارات الخاص بك تم شرائها."
    },
    buy = {
      title = "شراء",
      description = "شراء سيارة.",
      info = "{1} $<br /><br />{2}"
    },
    sell = {
      title = "بيع",
      description = "بيع سيارة."
    },
    rent = {
      title = "اجار",
      description = "استأجر سيارة لفتره حتى خروجك من المدينة."
    },
    store = {
      title = "ادخال السيارة",
      description = "ادخال سيارتك للكراج."
    }
  },
  vehicle = {
    title = "ريموت السيارة",
    no_owned_near = "~r~No owned vehicle near.",
    trunk = {
      title = "الشنطة",
      description = "افتح شتطة السيارة."
    },
    detach_trailer = {
      title = "فصل مقطورة",
      description = "فصل المقطورة عن المركبة."
    },
    detach_towtruck = {
      title = "فصل عن المركبة",
      description = "فصل المركبة عن الشاحنه سحب المركبة."
    },
    detach_cargobob = {
      title = "فصل المركبة عن الهليكوبتر",
      description = "فصل المركبة عن الهلكوبتر ذات خاصية سحب المركبات."
    },
    lock = {
      title = "قفل/فتح",
      description = "قفل او فتح المركبة الخاصة بك."
    },
    engine = {
      title = "المحرك",
      description = "تشغيل او ايقاف محرك السيارة."
    },
    asktrunk = {
      title = "طلب فتح الشنطة",
      asked = "~g~Asking...",
      request = "هل تريد فتح شنطة السيارة ؟"
    },
    replace = {
      title = "تعديل مسار السيارة",
      description = "تعديل مسار السيارة اذا هي مقلوبة ."
    },
    repair = {
      title = "اصلاح السيارة",
      description = "اصلاح اقرب سيارة لديك."
    }
  },
  gunshop = {
    title = "محل اسلحة ({1})",
    prompt_ammo = "عدد الذخيرة لسلاح {1}:",
    info = "<em>body: </em> {1} $<br /><em>ذخيرة: </em> {2} $/u<br /><br />{3}"
  },
  market = {
    title = "سوبر ماركت ({1})",
    prompt = "عدد {1} الذي تريد شرائة:",
    info = "{1} $<br /><br />{2}"
  },
  skinshop = {
    title = "محل الملابس"
  },
  cloakroom = {
    title = "غرفة تبديل الملابس({1})",
    undress = {
      title = "> خلع ملابسه"
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
    blip = "Mission ({1}) {2}/{3}",
    display = "<span class=\"name\">{1}</span> <span class=\"step\">{2}/{3}</span><br /><br />{4}",
    cancel = {
      title = "الغاء المهمة"
    }
  },
  aptitude = {
    title = "كفاءة",
    description = "اظهار كفاءتك.",
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
