gui_interiors = {
	opened = false,
	title = "",
	currentmenu = "main",
	lastmenu = nil,
	currentpos = nil,
	selectedbutton = 0,
	marker = { r = 0, g = 155, b = 255, a = 200, type = 1 }, -- ???
	menu = {
		x = 0.11,
		y = 0.25,
		width = 0.2,
		height = 0.04,
		buttons = 10,
		from = 1,
		to = 10,
		scale = 0.4,
		font = 0,
		["main"] = {
			title = "Menu",
			name = "main",
			buttons = {
			}
		},
	}
}

-------------------------------------------------
----------------CONFIG SELECTION----------------
-------------------------------------------------
function gui_interiors_ButtonSelected(button)
	PlaySound(-1, "SELECT", "HUD_FRONTEND_DEFAULT_SOUNDSET", 0, 0, 1)
	local ped = GetPlayerPed(-1)
	local this = gui_interiors.currentmenu
	local btn = button.name
	if this == "main" then
		teleport(button)
	end
end

-------------------------------------------------
----------------CONFIG OPEN MENU-----------------
-------------------------------------------------
function gui_interiors_OpenSubMenu(menu)
	gui_interiors.menu.from = 1
	gui_interiors.menu.to = 10
	gui_interiors.selectedbutton = 0
	gui_interiors.currentmenu = menu
end
-------------------------------------------------
------------------DRAW TITLE MENU----------------
-------------------------------------------------
function gui_interiors_drawMenuTitle(txt,x,y)
    local menu = gui_interiors.menu
	SetTextFont(2)
	SetTextProportional(0)
	SetTextScale(0.5, 0.5)
	SetTextColour(255, 255, 255, 255)
	SetTextEntry("STRING")
	AddTextComponentString(txt)
	DrawRect(x,y,menu.width,menu.height,0,0,0,255)
	DrawText(x - menu.width/2 + 0.005, y - menu.height/2 + 0.0028)
end
-------------------------------------------------
------------------DRAW MENU BOUTON---------------
-------------------------------------------------
function gui_interiors_drawMenuButton(button,x,y,selected)
	local menu = gui_interiors.menu
	SetTextFont(menu.font)
	SetTextProportional(0)
	SetTextScale(menu.scale, menu.scale)
	if selected then
		SetTextColour(0, 0, 0, 255)
	else
		SetTextColour(255, 255, 255, 255)
	end
	SetTextCentre(0)
	SetTextEntry("STRING")
	AddTextComponentString(button.name)
	if selected then
		DrawRect(x,y,menu.width,menu.height,255,255,255,255)
	else
		DrawRect(x,y,menu.width,menu.height,0,0,0,150)
	end
	DrawText(x - menu.width/2 + 0.005, y - menu.height/2 + 0.0028)
end
-------------------------------------------------
------------------DRAW MENU INFO-----------------
-------------------------------------------------
function gui_interiors_drawMenuInfo(text)
	local menu = gui_interiors.menu
	SetTextFont(menu.font)
	SetTextProportional(0)
	SetTextScale(0.45, 0.45)
	SetTextColour(255, 255, 255, 255)
	SetTextCentre(0)
	SetTextEntry("STRING")
	AddTextComponentString(text)
	DrawRect(0.675, 0.95,0.65,0.050,255,255,255,150)
	DrawText(0.365, 0.934)
end
-------------------------------------------------
----------------DRAW MENU DROIT------------------
-------------------------------------------------
function gui_interiors_drawMenuRight(txt,x,y,selected)
	local menu = gui_computer.menu
	SetTextFont(menu.font)
	SetTextProportional(0)
	SetTextScale(menu.scale, menu.scale)
	--SetTextRightJustify(1)
	if selected then
		SetTextColour(0, 0, 0, 255)
	else
		SetTextColour(255, 255, 255, 255)
	end
	SetTextCentre(1)
	SetTextEntry("STRING")
	AddTextComponentString(txt)
    DrawRect(0.01 + (menu.width)+((menu.width/3)/2),y,menu.width/3,menu.height,255,255,255,150)
	DrawText(0.01 + (menu.width)+((menu.width/3)/2), y - menu.height/2 + 0.0028)
end
-------------------------------------------------
-------------------DRAW TEXT---------------------
-------------------------------------------------
function gui_interiors_drawTxt(text,font,centre,x,y,scale,r,g,b,a)
	SetTextFont(font)
	SetTextProportional(0)
	SetTextScale(scale, scale)
	SetTextColour(r, g, b, a)
	SetTextDropShadow(0, 0, 0, 0,255)
	SetTextDropShadow()
	SetTextOutline()
	SetTextCentre(centre)
	SetTextEntry("STRING")
	AddTextComponentString(text)
	DrawText(x , y)
end
-------------------------------------------------
----------------CONFIG BACK MENU-----------------
-------------------------------------------------
function gui_interiors_BackMenu()
	if gui_interiors.currentmenu == "main" then
		gui_interiors_CloseMenu()
		PlaySound(-1, "QUIT", "HUD_FRONTEND_DEFAULT_SOUNDSET", 0, 0, 1)
    end 
end
-------------------------------------------------
----------------FONCTION OPEN--------------------
-------------------------------------------------
function gui_interiors_OpenMenu()
	gui_interiors.currentmenu = "main"
	gui_interiors.opened = true
	gui_interiors.selectedbutton = 0
end
-------------------------------------------------
----------------FONCTION CLOSE-------------------
-------------------------------------------------
function gui_interiors_CloseMenu()
    gui_interiors.opened = false
    gui_interiors.menu.from = 1
    gui_interiors.menu.to = 10
end
-------------------------------------------------
----------------FONCTION OPEN MENU---------------
-------------------------------------------------
Citizen.CreateThread(function()
	while true do
		Citizen.Wait(0)

        local ped = GetPlayerPed(-1)
        local playerPos = GetEntityCoords(ped, true)
        local vehicle = GetVehiclePedIsIn(ped, false)

        if (Vdist(playerPos.x, playerPos.y, playerPos.z, INTERIORS[POS_actual].x, INTERIORS[POS_actual].y, INTERIORS[POS_actual].z) > 2.0) then
			if gui_interiors.opened then
				gui_interiors_CloseMenu()
			end
		end

		if gui_interiors.opened then
            local ped = localPed()
            local menu = gui_interiors.menu[gui_interiors.currentmenu]
            gui_interiors_drawTxt(gui_interiors.title,1,1,gui_interiors.menu.x,gui_interiors.menu.y,1.0, 255,255,255,255)
            gui_interiors_drawMenuTitle(menu.title, gui_interiors.menu.x,gui_interiors.menu.y + 0.08)
            gui_interiors_drawTxt(gui_interiors.selectedbutton.."/"..tablelength(menu.buttons),0,0,gui_interiors.menu.x + gui_interiors.menu.width/2 - 0.0385,gui_interiors.menu.y + 0.067,0.4, 255,255,255,255)
            local y = gui_interiors.menu.y + 0.12

			menu.buttons = {}
			for i,dest in pairs(INTERIORS[POS_actual].destination) do
				table.insert(menu.buttons , INTERIORS[dest])
			end

            buttoncount = tablelength(menu.buttons)
            local selected = false

            for i,button in pairs(menu.buttons) do
                if i >= gui_interiors.menu.from and i <= gui_interiors.menu.to then
					if i == gui_interiors.selectedbutton then
						selected = true
					else
						selected = false
					end
					gui_interiors_drawMenuButton(button,gui_interiors.menu.x,y,selected)
					if button.type ~= nil then
						gui_interiors_drawMenuRight(button.type,gui_interiors.menu.x,y,selected)
					end
					y = y + 0.04
					if selected and IsControlJustPressed(1,201) then
						gui_interiors_ButtonSelected(button)
					end
                end
            end
		end

		if gui_interiors.opened then
			if IsControlJustPressed(1,177) then
				gui_interiors_BackMenu()
			end
			if IsControlJustPressed(1,188) then
				if gui_interiors.selectedbutton > 1 then
					gui_interiors.selectedbutton = gui_interiors.selectedbutton -1
					PlaySound(-1, "NAV_UP_DOWN", "HUD_FRONTEND_DEFAULT_SOUNDSET", 0, 0, 1)
					if buttoncount > 10 and gui_interiors.selectedbutton < gui_interiors.menu.from then
						gui_interiors.menu.from = gui_interiors.menu.from -1
						gui_interiors.menu.to = gui_interiors.menu.to - 1
					end
				end
			end
			if IsControlJustPressed(1,187)then
				if gui_interiors.selectedbutton < buttoncount then
					gui_interiors.selectedbutton = gui_interiors.selectedbutton +1
					PlaySound(-1, "NAV_UP_DOWN", "HUD_FRONTEND_DEFAULT_SOUNDSET", 0, 0, 1)
					if buttoncount > 10 and gui_interiors.selectedbutton > gui_interiors.menu.to then
						gui_interiors.menu.to = gui_interiors.menu.to + 1
						gui_interiors.menu.from = gui_interiors.menu.from + 1
					end
				end
			end
		end

	end
end)

function localPed()
	return GetPlayerPed(-1)
end

function tablelength(T)
	local count = 0
	for _ in pairs(T) do count = count + 1 end
	return count
end

