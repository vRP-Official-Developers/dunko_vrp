local displayApartBlips = true --SET TO TRUE IF YOU WANT TO ADD BLIPS FOR APPARTMENTS

local interiors = {
    [1] = { ["price"] = 100000, ["xe"] = 1394.48278808594, ["ye"] = 1141.74035644531, ["ze"] = 114.606857299805, ["he"] = 0.000, ["xo"] = 1397.33056640625, ["yo"] = 1142.05017089844, ["zo"] = 114.333587646484, ["ho"] = 0.000, ["name"] = 'Ranch Main'},
    [2] = { ["price"] = 100000, ["xe"] = 1400.36584472656, ["ye"] = 1127.14978027344, ["ze"] = 114.334297180176, ["he"] = 0.000, ["xo"] = 1400.05810546875, ["yo"] = 1128.62951660156, ["zo"] = 114.334289550781, ["ho"] = 0.000, ["name"] = 'Ranche side'},
    [3] = { ["price"] = 100000, ["xe"] = -1910.7265625, ["ye"] = -576.919189453125, ["ze"] = 19.0969314575195, ["he"] = 0.00, ["xo"] = -1910.099609375, ["yo"] = -574.97265625, ["zo"] = 19.0956039428711, ["ho"] = 0.00, ["name"] = 'Bureau sur Plage 1'},
    [4] = { ["price"] = 100000, ["xe"] = -269.457214355469, ["ye"] = -955.855529785156, ["ze"] = 31.2231330871582, ["he"] = 0.00, ["xo"] = -270.538421630859, ["yo"] = -940.73974609375, ["zo"] = 92.5109481811523, ["ho"] = 0.00, ["name"] = 'Condo de Luxe 1'},
    [5] = { ["price"] = 100000, ["xe"] = -44.6460037231445, ["ye"] = -587.163024902344, ["ze"] = 38.1613159179688, ["he"] = 0.00, ["xo"] = -30.8175601959229, ["yo"] = -595.315246582031, ["zo"] = 80.030891418457, ["ho"] = 0.00, ["name"] = 'Condo de Luxe 2'},
    [6] = { ["price"] = 100000, ["xe"] = -43.9314346313477, ["ye"] = -584.379028320313, ["ze"] = 38.1618614196777, ["he"] = 0.00, ["xo"] = -18.1004009246826, ["yo"] = -590.620544433594, ["zo"] = 90.1148223876953, ["ho"] = 0.00, ["name"] = 'Condo de Luxe 3'},
    [7] = { ["price"] = 100000, ["xe"] = -480.583343505859, ["ye"] = -688.393371582031, ["ze"] = 33.2119483947754, ["he"] = 0.00, ["xo"] = -466.607604980469, ["yo"] = -708.706115722656, ["zo"] = 77.0869216918945, ["ho"] = 0.00, ["name"] = 'Condo de Luxe 4'},
    [8] = { ["price"] = 100000, ["xe"] = -796.283264160156, ["ye"] = 336.186981201172, ["ze"] = 85.7004165649414, ["he"] = 0.00, ["xo"] = -784.695556640625, ["yo"] = 323.346374511719, ["zo"] = 211.997192382813, ["ho"] = 0.00, ["name"] = 'Condo de Luxe 5'},
    [9] = { ["price"] = 100000, ["xe"] = 414.587738037109, ["ye"] = -217.593215942383, ["ze"] = 59.9104766845703, ["he"] = 0.00, ["xo"] = 426.823150634766, ["yo"] = -255.383087158203, ["zo"] = 71.2514114379883, ["ho"] = 0.00, ["name"] = 'Terrasse Hotel'},
    [10] = { ["price"] = 100000, ["xe"] = -98.5413970947266, ["ye"] = 367.420593261719, ["ze"] = 113.274826049805, ["he"] = 0.00, ["xo"] = -101.87483215332, ["yo"] = 372.153594970703, ["zo"] = 142.680328369141, ["ho"] = 0.00, ["name"] = 'Terrasse C'},
    [11] = { ["price"] = 100000, ["xe"] = -107.244064331055, ["ye"] = 369.226196289063, ["ze"] = 112.880752563477, ["he"] = 0.00, ["xo"] = -88.3965454101563, ["yo"] = 324.328125, ["zo"] = 142.599212646484, ["ho"] = 0.00, ["name"] = 'Terrasse B'},
    [12] = { ["price"] = 100000, ["xe"] = -116.21142578125, ["ye"] = 372.935424804688, ["ze"] = 112.88077545166, ["he"] = 0.00, ["xo"] = -93.2163009643555, ["yo"] = 316.106872558594, ["zo"] = 136.855270385742, ["ho"] = 0.00, ["name"] = 'Terrasse A'},
    [13] = { ["price"] = 100000, ["xe"] = 119.249359130859, ["ye"] = 564.305969238281, ["ze"] = 183.96142578125, ["he"] = 0.00, ["xo"] = 117.411087036133, ["yo"] = 559.382934570313, ["zo"] = 184.30485534668, ["ho"] = 0.00, ["name"] = 'House Premium 1'},
    [14] = { ["price"] = 100000, ["xe"] = 374.177398681641, ["ye"] = 427.730651855469, ["ze"] = 145.684204101563, ["he"] = 0.00, ["xo"] = 373.5234375, ["yo"] = 423.222930908203, ["zo"] = 145.90788269043, ["ho"] = 0.00, ["name"] = 'House Premium 2'},
    [15] = { ["price"] = 100000, ["xe"] = -174.349594116211, ["ye"] = 502.55615234375, ["ze"] = 137.42024230957, ["he"] = 0.00, ["xo"] = -174.111358642578, ["yo"] = 497.260223388672, ["zo"] = 137.661056518555, ["ho"] = 0.00, ["name"] = 'House Premium 3'},
    [16] = { ["price"] = 100000, ["xe"] = 346.176666259766, ["ye"] = 440.199554443359, ["ze"] = 148.08430480957, ["he"] = 0.00, ["xo"] = 341.693542480469, ["yo"] = 437.470153808594, ["zo"] = 149.387069702148, ["ho"] = 0.00, ["name"] = 'House Premium 4'},
    [17] = { ["price"] = 100000, ["xe"] = -1910.7265625, ["ye"] = -576.919189453125, ["ze"] = 19.0969314575195, ["he"] = 0.00, ["xo"] = -1910.099609375, ["yo"] = -574.97265625, ["zo"] = 19.0956039428711, ["ho"] = 0.00, ["name"] = 'Bureau Sur Plage 2'},
    [18] = { ["price"] = 100000, ["xe"] = -635.626892089844, ["ye"] = 44.2951354980469, ["ze"] = 42.6980400085449, ["he"] = 0.00, ["xo"] = -603.831115722656, ["yo"] = 58.761058807373, ["zo"] = 98.2002182006836, ["ho"] = 0.00, ["name"] = 'Condo de Luxe 6'},
    [19] = { ["price"] = 100000, ["xe"] = -776.924255371094, ["ye"] = 318.661376953125, ["ze"] = 85.6626510620117, ["he"] = 0.00, ["xo"] = -781.977478027344, ["yo"] = 325.327331542969, ["zo"] = 176.803680419922, ["ho"] = 0.00, ["name"] = 'Condo de Luxe 7'},
    [20] = { ["price"] = 100000, ["xe"] = -1581.46313476563, ["ye"] = -558.558898925781, ["ze"] = 34.9528388977051, ["he"] = 0.00, ["xo"] = -1581.21960449219, ["yo"] = -561.3564453125, ["zo"] = 108.523002624512, ["ho"] = 0.00, ["name"] = 'Bureau du Maire'},
    [21] = { ["price"] = 100000, ["xe"] = -1443.81750488281, ["ye"] = -536.080017089844, ["ze"] = 34.7401390075684, ["he"] = 0.00, ["xo"] = -1452.44152832031, ["yo"] = -540.203552246094, ["zo"] = 74.0443572998047, ["ho"] = 0.00, ["name"] = 'Condo de Luxe 8'},
    [22] = { ["price"] = 100000, ["xe"] = -1454.64892578125, ["ye"] = -513.301879882813, ["ze"] = 31.5818099975586, ["he"] = 0.00, ["xo"] = -1452.44152832031, ["yo"] = -540.203552246094, ["zo"] = 74.0443572998047, ["ho"] = 0.00, ["name"] = 'Par Stationnement 1'},
    [23] = { ["price"] = 100000, ["xe"] = -1450.7607421875, ["ye"] = -540.988159179688, ["ze"] = 34.7401390075684, ["he"] = 0.00, ["xo"] = -1450.5263671875, ["yo"] = -525.1552734375, ["zo"] = 69.5566940307617, ["ho"] = 0.00, ["name"] = 'Condo de Luxe 9'},
    [24] = { ["price"] = 100000, ["xe"] = -1456.5302734375, ["ye"] = -514.073425292969, ["ze"] = 31.5818099975586, ["he"] = 0.00, ["xo"] = -1450.5263671875, ["yo"] = -525.1552734375, ["zo"] = 69.5566940307617, ["ho"] = 0.00, ["name"] = 'Par Stationnement 2'},
    [25] = { ["price"] = 100000, ["xe"] = -1447.42456054688, ["ye"] = -537.894348144531, ["ze"] = 34.7402763366699, ["he"] = 0.00, ["xo"] = -1450.43359375, ["yo"] = -525.057312011719, ["zo"] = 56.9289970397949, ["ho"] = 0.00, ["name"] = 'Condo de Luxe 10'},
    [26] = { ["price"] = 100000, ["xe"] = -1458.28088378906, ["ye"] = -515.629211425781, ["ze"] = 31.5818099975586, ["he"] = 0.00, ["xo"] = -1450.43359375, ["yo"] = -525.057312011719, ["zo"] = 56.9289970397949, ["ho"] = 0.00, ["name"] = 'Par Stationnement 3'},
    [27] = { ["price"] = 100000, ["xe"] = -889.443298339844, ["ye"] = -333.081909179688, ["ze"] = 34.6838188171387, ["he"] = 0.00, ["xo"] = -912.898193359375, ["yo"] = -365.340240478516, ["zo"] = 114.274772644043, ["ho"] = 0.00, ["name"] = 'Condo de Luxe'},
    [28] = { ["price"] = 100000, ["xe"] = -908.367492675781, ["ye"] = -368.992370605469, ["ze"] = 113.074188232422, ["he"] = 0.00, ["xo"] = -903.132080078125, ["yo"] = -369.993041992188, ["zo"] = 136.2822265625, ["ho"] = 0.00, ["name"] = 'Helipad'},
    [29] = { ["price"] = 100000, ["xe"] = -901.707275390625, ["ye"] = -339.162506103516, ["ze"] = 34.6806182861328, ["he"] = 0.00, ["xo"] = -907.419128417969, ["yo"] = -371.880340576172, ["zo"] = 109.44034576416, ["ho"] = 0.00, ["name"] = 'Condo de Luxe 11'},
    [30] = { ["price"] = 100000, ["xe"] = -894.848999023438, ["ye"] = -353.67626953125, ["ze"] = 34.6796798706055, ["he"] = 0.00, ["xo"] = -922.5458984375, ["yo"] = -379.319671630859, ["zo"] = 85.4805603027344, ["ho"] = 0.00, ["name"] = 'Condo de Luxe 12'},
    [31] = { ["price"] = 100000, ["xe"] = -844.5498046875, ["ye"] = -391.217437744141, ["ze"] = 31.4693260192871, ["he"] = 0.00, ["xo"] = -907.26611328125, ["yo"] = -454.278350830078, ["zo"] = 126.534423828125, ["ho"] = 0.00, ["name"] = 'Condo de Luxe 13'},
    [32] = { ["price"] = 100000, ["xe"] = -837.708801269531, ["ye"] = -405.888824462891, ["ze"] = 31.4716987609863, ["he"] = 0.00, ["xo"] = -890.076171875, ["yo"] = -452.320587158203, ["zo"] = 95.4610977172852, ["ho"] = 0.00, ["name"] = 'Condo de Luxe 14'},
    [33] = { ["price"] = 100000, ["xe"] = -3093.06884765625, ["ye"] = 349.211853027344, ["ze"] = 7.53054094314575, ["he"] = 0.00, ["xo"] = -3094.15478515625, ["yo"] = 339.901702880859, ["zo"] = 10.8038291931152, ["ho"] = 0.00, ["name"] = 'Appartement plage 1er'},
    [34] = { ["price"] = 100000, ["xe"] = -3100.38256835938, ["ye"] = 360.864776611328, ["ze"] = 7.59101963043213, ["he"] = 0.00, ["xo"] = -3094.47314453125, ["yo"] = 340.733428955078, ["zo"] = 14.4392118453979, ["ho"] = 0.00, ["name"] = 'Appartement plage 2e'},
    [35] = { ["price"] = 100000, ["xe"] = 80.8491439819336, ["ye"] = 6643.9287109375, ["ze"] = 31.9288063049316, ["he"] = 0.00, ["xo"] = 82.4307098388672, ["yo"] = 6645.13037109375, ["zo"] = 31.9326190948486, ["ho"] = 0.00, ["name"] = 'Grange de Fortune 1'},
    [36] = { ["price"] = 100000, ["xe"] = 1929.818359375, ["ye"] = 4635.51953125, ["ze"] = 40.4547843933105, ["he"] = 0.00, ["xo"] = 1930.04479980469, ["yo"] = 4633.390625, ["zo"] = 40.4920272827148, ["ho"] = 0.00, ["name"] = 'Grange de Fortune 2'},
    [37] = { ["price"] = 100000, ["xe"] = -1565.64587402344, ["ye"] = -575.688049316406, ["ze"] = 108.522987365723, ["he"] = 0.00, ["xo"] = -1570.009765625, ["yo"] = -576.172729492188, ["zo"] = 114.449279785156, ["ho"] = 0.00, ["name"] = 'Maire Helipad'},
}

local lang = 'en'

local txt = {
  ['fr'] = {
        ['fermermenu'] = 'Fermer le menu',
        ['sonner'] = 'Sonner a la porte',
        ['gohome'] = 'Rentrer chez moi',
        ['vendre'] = 'Revendre l\'appartement',
        ['acheter'] = 'Acheter l\'appartement',
        ['visiter'] = 'Visiter l\'appartement',
        ['menu'] = 'Appuyez sur ~g~E~s~ pour ouvrir le menu',
        ['soon'] = 'Cette fonctionnalite arrivera bientot',
        ['exit'] = 'Sortir',
        ['retirerargent'] = 'Retirer de l\'argent propre',
        ['retirersale'] = 'Retirer de l\'argent sale',
        ['deposerargent'] = 'Deposer de l\'argent propre',
        ['deposersale'] = 'Deposer de l\'argent sale'
  },

    ['en'] = {
        ['fermermenu'] = 'Close menu',
        ['sonner'] = 'Ring the doorbell',
        ['gohome'] = 'Go to home',
        ['vendre'] = 'Sell apartment',
        ['acheter'] = 'Buy apartment',
        ['visiter'] = 'Visit the apartment',
        ['menu'] = 'Press ~g~E~s~ to open menu',
        ['soon'] = 'This functionality will come soon',
        ['exit'] = 'Exit',
        ['retirerargent'] = 'Withdraw clean money',
        ['retirersale'] = 'Withdraw dirty money',
        ['deposerargent'] = 'Deposit clean money',
        ['deposersale'] = 'Deposit dirty money'
    }
}

local entrer = false
local isBuy = 0
local money = 0
local dirtymoney = 0
local depositcash = false
local depositdirtycash = false
local depositapart = ""


distance = 50.5999 -- distance to draw
timer = 0
current_int = 0
 
-- AddEventHandler("playerSpawned", function()
--   TriggerServerEvent("apart:sendData_s")
-- end)
 
-- -- Active this when you restart resource. If you don't want to close the server
-- TriggerServerEvent("apart:sendData_s")
 
-- RegisterNetEvent("apart:f_sendData")
-- AddEventHandler("apart:f_sendData", function(t1)
--     -- Tyler1 my boy
--   interiors = t1
-- end)
 
RegisterNetEvent("apart:isBuy")
AddEventHandler("apart:isBuy", function()
  isBuy = 1
end)
 
RegisterNetEvent("apart:isNotBuy")
AddEventHandler("apart:isNotBuy", function()
  isBuy = 0
end)

RegisterNetEvent("apart:isMine")
AddEventHandler("apart:isMine", function()
  isBuy = 2
end)

RegisterNetEvent("apart:getCash")
AddEventHandler("apart:getCash", function(moneyparm, dirtymoneyparm)
  money = moneyparm
  dirtymoney = dirtymoneyparm
end)

function DrawAdvancedText(x,y ,w,h,sc, text, r,g,b,a,font,jus)
    SetTextFont(font)
    SetTextProportional(0)
    SetTextScale(sc, sc)
        N_0x4e096588b13ffeca(jus)
    SetTextColour(r, g, b, a)
    SetTextDropShadow(0, 0, 0, 0,255)
    SetTextEdge(1, 0, 0, 0, 255)
    SetTextDropShadow()
    SetTextOutline()
    SetTextEntry("STRING")
    AddTextComponentString(text)
    DrawText(x - 0.1+w, y - 0.02+h)
end

function SetBlipTrade(id, text, color, x, y, z)
  local Blip = AddBlipForCoord(x, y, z)

  SetBlipSprite(Blip, id)
  SetBlipColour(Blip, color)
  SetBlipAsShortRange(Blip, true)
  BeginTextCommandSetBlipName("STRING")
  AddTextComponentString(text)
  EndTextCommandSetBlipName(Blip)
end
 
function drawTxt(text,font,centre,x,y,scale,r,g,b,a)
    SetTextFont(font)
    SetTextProportional(0)
    SetTextScale(scale, scale)
    SetTextColour(r, g, b, a)
    SetTextDropShadow(0, 0, 0, 0,255)
    SetTextEdge(1, 0, 0, 0, 255)
    SetTextDropShadow()
    SetTextOutline()
    SetTextCentre(centre)
    SetTextEntry("STRING")
    AddTextComponentString(text)
    DrawText(x , y)
end

function MenuInsideAppartement()
	ped = GetPlayerPed(-1);
    MenuTitle = "Appartement"
    ClearMenu()
 
    for i=1, #interiors do
        if GetDistanceBetweenCoords(GetEntityCoords(GetPlayerPed(-1)), interiors[i].xo,interiors[i].yo,interiors[i].zo, true) < 1.599 then
            TriggerServerEvent("apart:getCash", interiors[i].name)
            Wait(250)
            if isBuy == 2 then
            	print(money)
            	print(dirtymoney)
                Menu.addButton("Argent propre: " .. money .. " $","privetimuseless",nil)
                Menu.addButton("Argent sale: " .. dirtymoney .." $","privetimuseless",nil)
                Menu.addButton(txt[lang]['deposerargent'],"deposerargent",interiors[i].name)
                Menu.addButton(txt[lang]['deposersale'],"deposersale",interiors[i].name)
                Menu.addButton(txt[lang]['retirerargent'],"retirerargent",interiors[i].name)
                Menu.addButton(txt[lang]['retirersale'],"retirersale",interiors[i].name)
                Menu.addButton(txt[lang]['exit'],"Exit",nil)
            else
                Menu.addButton(txt[lang]['exit'],"Exit",nil)
            end
            Menu.addButton(txt[lang]['fermermenu'],"CloseMenu",nil)
        end
    end
end
function privetimuseless() 
end

function deposerargent(apart)
	DisplayOnscreenKeyboard(true, "FMMC_KEY_TIP8", "", "", "", "", "", 120)
	while UpdateOnscreenKeyboard() == 0 do
		DisableAllControlActions(0)
       	Wait(0);
    end
	if (GetOnscreenKeyboardResult()) then
		local txt = GetOnscreenKeyboardResult()
		if (string.len(txt) > 0) then
			TriggerServerEvent("apart:depositcash", txt, apart)
			CloseMenu()
		end
	end
end

function deposersale(apart)
	DisplayOnscreenKeyboard(true, "FMMC_KEY_TIP8", "", "", "", "", "", 120)
	while UpdateOnscreenKeyboard() == 0 do
		DisableAllControlActions(0)
       	Wait(0);
    end
	if (GetOnscreenKeyboardResult()) then
		local txt = GetOnscreenKeyboardResult()
		if (string.len(txt) > 0) then
			TriggerServerEvent("apart:depositdirtycash", txt, apart)
			CloseMenu()
		end
	end
end

function retirerargent(apart)
	print("coucou")
	DisplayOnscreenKeyboard(true, "FMMC_KEY_TIP8", "", "", "", "", "", 120)
	while UpdateOnscreenKeyboard() == 0 do
		DisableAllControlActions(0)
       	Wait(0);
    end
	if (GetOnscreenKeyboardResult()) then
		local txt = GetOnscreenKeyboardResult()
		if (string.len(txt) > 0) then
			print("ok c bon")
			TriggerServerEvent("apart:takecash", txt, apart)
			CloseMenu()
		end
	end
end

function retirersale(apart)
	DisplayOnscreenKeyboard(true, "FMMC_KEY_TIP8", "", "", "", "", "", 120)
	while UpdateOnscreenKeyboard() == 0 do
		DisableAllControlActions(0)
       	Wait(0);
    end
	if (GetOnscreenKeyboardResult()) then
		local txt = GetOnscreenKeyboardResult()
		if (string.len(txt) > 0) then
			TriggerServerEvent("apart:takedirtycash", txt, apart)
			CloseMenu()
		end
	end
end

function Exit()
	for i=1, #interiors do
		if GetDistanceBetweenCoords(GetEntityCoords(GetPlayerPed(-1)), interiors[i].xo,interiors[i].yo,interiors[i].zo, true) < 1.599 then
			if timer == 0 then
			    DoScreenFadeOut(1000)
			    while IsScreenFadingOut() do Citizen.Wait(0) end
			    NetworkFadeOutEntity(GetPlayerPed(-1), true, false)
			    Wait(1000)
			    SetEntityCoords(GetPlayerPed(-1), interiors[i].xe,interiors[i].ye,interiors[i].ze)
			    SetEntityHeading(GetPlayerPed(-1), interiors[i].ho)
			    NetworkFadeInEntity(GetPlayerPed(-1), 0)
			    Wait(1000)
			    current_int = i
			    timer = 5
			    SimulatePlayerInputGait(PlayerId(), 1.0, 100, 1.0, 1, 0)
			    DoScreenFadeIn(1000)
			    Menu.hidden = true
			    while IsScreenFadingIn() do Citizen.Wait(0) end
			end
		end
	end
end
 
function MenuAppartement()
    ped = GetPlayerPed(-1);
    MenuTitle = "Appartement"
    ClearMenu()
 
    for i=1, #interiors do
        if GetDistanceBetweenCoords(GetEntityCoords(GetPlayerPed(-1)), interiors[i].xe,interiors[i].ye,interiors[i].ze, true) < 1.599 then
            TriggerServerEvent("apart:getAppart", interiors[i].name)
            Wait(250)
            if isBuy == 1 then
                Menu.addButton(txt[lang]['sonner'],"Sonner",nil)
            elseif isBuy == 2 then
                Menu.addButton(txt[lang]['gohome'],"Visiter",nil)
                Menu.addButton(txt[lang]['vendre'],"Vendre",nil)
            else
                Menu.addButton(txt[lang]['acheter'],"Acheter",nil)
                Menu.addButton(txt[lang]['visiter'],"Visiter",nil)
            end
            Menu.addButton(txt[lang]['fermermenu'],"CloseMenu",nil)
        end
    end
end
 
function CloseMenu()
    Menu.hidden = true    
end

function Sonner()
    exports.pNotify:SendNotification({text = txt[lang]['soon'], type = "error", timeout = 5000, layouts = "bottomCenter"})
end

function Vendre()
    for i=1, #interiors do
        if GetDistanceBetweenCoords(GetEntityCoords(GetPlayerPed(-1)), interiors[i].xe,interiors[i].ye,interiors[i].ze, true) < 1.599 then
            TriggerServerEvent("apart:sellAppart", interiors[i].name, interiors[i].price)
            CloseMenu()
        end
    end
end

function Acheter()
    for i=1, #interiors do
        if GetDistanceBetweenCoords(GetEntityCoords(GetPlayerPed(-1)), interiors[i].xe,interiors[i].ye,interiors[i].ze, true) < 1.599 then
            TriggerServerEvent("apart:buyAppart", interiors[i].name, interiors[i].price)
            CloseMenu()
        end
    end
end
 
function Visiter(i)
    for i=1, #interiors do
        if GetDistanceBetweenCoords(GetEntityCoords(GetPlayerPed(-1)), interiors[i].xe,interiors[i].ye,interiors[i].ze, true) < 1.599 then
            if timer == 0 then
                DoScreenFadeOut(1000)
                while IsScreenFadingOut() do Citizen.Wait(0) end
                NetworkFadeOutEntity(GetPlayerPed(-1), true, false)
                Wait(1000)
                SetEntityCoords(GetPlayerPed(-1), interiors[i].xo,interiors[i].yo,interiors[i].zo)
                SetEntityHeading(GetPlayerPed(-1), interiors[i].ho)
                NetworkFadeInEntity(GetPlayerPed(-1), 0)
                Wait(1000)
                current_int = i
                timer = 5
                SimulatePlayerInputGait(PlayerId(), 1.0, 100, 1.0, 1, 0)
                DoScreenFadeIn(1000)
                Menu.hidden = true
                while IsScreenFadingIn() do Citizen.Wait(0) end
            end
        end
    end
end
 
Citizen.CreateThread(function()
    while true do
        Citizen.Wait(0)
        if timer > 0 and current_int > 0 then DrawAdvancedText(0.707, 0.77, 0.005, 0.0028, 1.89, "~b~"..interiors[current_int].name, 255, 255, 255, 255, 1, 1) end
            for i=1, #interiors do
                if not IsEntityDead(PlayerPedId()) then
                    if GetDistanceBetweenCoords(GetEntityCoords(GetPlayerPed(-1)), interiors[i].xe,interiors[i].ye,interiors[i].ze, true) < distance then
                        DrawMarker(1,interiors[i].xe,interiors[i].ye,interiors[i].ze-1.0001, 0, 0, 0, 0, 0, 0, 1.01, 1.01, 0.3, 212, 189, 0, 105, 0, 0, 2, 0, 0, 0, 0)
                        if GetDistanceBetweenCoords(GetEntityCoords(GetPlayerPed(-1)), interiors[i].xe,interiors[i].ye,interiors[i].ze, true) < 1.599 then
                            drawTxt(txt[lang]['menu'],0,1,0.5,0.8,0.6,255,255,255,255)
                            if IsControlJustPressed(1, 86) then
                                MenuAppartement()
                                Menu.hidden = not Menu.hidden
                            end
                            Menu.renderGUI()
                        end
                    end
                    if GetDistanceBetweenCoords(GetEntityCoords(GetPlayerPed(-1)), interiors[i].xo,interiors[i].yo,interiors[i].zo, true) < distance then
                        DrawMarker(1,interiors[i].xo,interiors[i].yo,interiors[i].zo-1.0001, 0, 0, 0, 0, 0, 0, 1.01, 1.01, 0.3, 212, 189, 0, 105, 0, 0, 2, 0, 0, 0, 0)
                        if GetDistanceBetweenCoords(GetEntityCoords(GetPlayerPed(-1)), interiors[i].xo,interiors[i].yo,interiors[i].zo, true) < 1.599 then
                            drawTxt(txt[lang]['menu'],0,1,0.5,0.8,0.6,255,255,255,255)
                            if IsControlJustPressed(1, 86) then
                                MenuInsideAppartement()
                                Menu.hidden = not Menu.hidden
                            end
                            Menu.renderGUI()
                        end
                    end
                end
            end
    end
end)
 
Citizen.CreateThread(function()
    while true do
        Wait(1000)
        if timer > 0 then
            timer=timer-1
            if timer == 0 then current_int = 0 end
        end
    end
end)

Citizen.CreateThread(function()
    if displayApartBlips == true then
        for _, item in pairs(interiors) do
          item.blip = AddBlipForCoord(item.xe, item.ye, item.ze)
          SetBlipSprite(item.blip, 375)
          SetBlipAsShortRange(item.blip, true)
          BeginTextCommandSetBlipName("STRING")
          SetBlipColour(item.blip, 3)
          SetBlipScale(item.blip, 0.9)
          AddTextComponentString("Appartement")
          EndTextCommandSetBlipName(item.blip)
        end
    end
end)