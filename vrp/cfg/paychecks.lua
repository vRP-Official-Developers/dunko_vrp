local cfg = {}

cfg.paychecks = {
    -- Police
    {
        name = "Police Department",
        paycheck = 2000,
        permissions = {"police.paycheck"}
    },
    {
        name = "Police Department",
        paycheck = 3000,
        permissions = {"Chief.paycheck"}
    },
    {
        name = "Police Department",
        paycheck = 4000,
        permissions = {"Commander.paycheck"}
    },
    {
        name = "Police Department",
        paycheck = 2500,
        permissions = {"Captain.paycheck"}
    },
    {
        name = "Police Department",
        paycheck = 2500,
        permissions = {"Lieutenant.paycheck"}
    },
    {
        name = "Police Department",
        paycheck = 2250,
        permissions = {"Detective.paycheck"}
    },
    {
        name = "Police Department",
        paycheck = 2000,
        permissions = {"Sergeant.paycheck"}
    },
    {
        name = "Police Department",
        paycheck = 2000,
        permissions = {"Deputy.paycheck"}
    },
    {
        name = "Police Department",
        paycheck = 2500,
        permissions = {"SWAT.paycheck"}
    },
    {
        name = "Police Department",
        paycheck = 2500,
        permissions = {"sherrif.paycheck"}
    },
    {
        name = "Police Department",
        paycheck = 2000,
        permissions = {"Cadet.paycheck"}
    },
    {
        name = "Police Department",
        paycheck = 1500,
        permissions = {"trafficguard.paycheck"}
    },
    -- EMS
    {
        name = "EMS Department",
        paycheck = 5000,
        permissions = {"emsChief.paycheck"}
    },
    {
        name = "EMS Department",
        paycheck = 3000,
        permissions = {"emsLieutenant.paycheck"}
    },
    {
        name = "EMS Department",
        paycheck = 2000,
        permissions = {"emsMedic.paycheck"}
    },
    {
        name = "EMS Department",
        paycheck = 2500,
        permissions = {"emsSearchRescue.paycheck"}
    },
    --JOBS
    {
        name = "Mafia",
        paycheck = 10000,
        permissions = {"mafia.paycheck"}
    },
    {
        name = "Repair Company",
        paycheck = 2000,
        permissions = {"repair.paycheck"}
    },
    {
        name = "UBER",
        paycheck = 2000,
        permissions = {"uber.paycheck"}
    },
    {
        name = "Saul Goodman Lawyers",
        paycheck = 2000,
        permissions = {"Lawyer.paycheck"}
    },
    {
        name = "DHL Delivery",
        paycheck = 2000,
        permissions = {"delivery.paycheck"}
    },
    {
        name = "Benefits",
        paycheck = 2000,
        permissions = {"citizen.paycheck"}
    },
    {
        name = "Bank Driver",
        paycheck = 2000,
        permissions = {"bankdriver.paycheck"}
    },
    {
        name = "EasyJet Flights",
        paycheck = 2000,
        permissions = {"pilot.paycheck", "air.paycheck"}
    },
    {
        name = "UPS Postal",
        paycheck = 2000,
        permissions = {"ups.paycheck"}
    },
    {
        name = "Trash Collector",
        paycheck = 2000,
        permissions = {"trash.paycheck"}
    },
    {
        name = "Gift For Playing",
        paycheck = 100,
        permissions = {"user.paycheck"},
        isGift = true
    },

}

cfg.interval = 900000
return cfg

