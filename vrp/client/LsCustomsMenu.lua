--[[
MenuBase 
Credits - MythicalBro
/////License/////
Do not reupload/re release any part of this script without my permission
]]

Menu = setmetatable({}, Menu)
Menu.__index = Menu
function Menu.new(title,header,x,y,width,height,font)
	local newmenu = {
		visible = false,
		currentmenu = "main",
		lastmenu = {},
		selected = 1,
		from = 1,
		to = 10,
		maxbuttons = 10,
		title = title,
		title_sprite = nil,
		header = header,
		name = "main",
		buttons = {},
		config = {
			position = { x = x, y = y}, 
			size = {width = width, height = height},
			font = font,
			pcontrol = false,
			text_color = { r = 255,g = 255, b = 255, a = 255},
			bg_color = { r = 0,g = 0, b = 0, a = 155},
			stext_color = { r = 0,g = 0, b = 0, a = 255},
			sbg_color = { r = 255,g = 255, b = 255, a = 200},
			menu_name = true,
			controls = {
				menu_up = 27,
				menu_down = 173,
				menu_left = 174,
				menu_right = 175,
				menu_select = 201,
				menu_back = 177,
			}
		}
	}
	return setmetatable(newmenu,Menu)
end

function Menu:showNotification(txt)
	self.notification = nil
	Citizen.CreateThread(function()
		while self.notification ~= nil do
			Citizen.Wait(10)
		end
		self.notification = txt
		Citizen.Wait(1250)
		self.notification = nil
	end)
end

function Menu:setMaxButtons(n)
	self.to = n
	self.maxbuttons = n
end

function Menu:setColors(t_c,st_c,b_c,sb_c)
	self.config.text_color = t_c
	self.config.bg_color = b_c
	self.config.stext_color = st_c
	self.config.sbg_color = sb_c
end

function Menu:isVisible()
	return self.visible
end

function drawMenuText(text,font,centre,x,y,scale,r,g,b,a)
	SetTextFont(font)
	SetTextProportional(0)
	SetTextScale(scale, scale)
	SetTextColour(r, g, b, a)
	--SetTextDropShadow(0, 0, 0, 0,255)
	SetTextEdge(1, 0, 0, 0, 255)
	--SetTextDropShadow()
	--SetTextOutline()
	SetTextCentre(centre)
	SetTextEntry("STRING")
	AddTextComponentString(text)
	DrawText(x , y)	
end

function drawInfo(text,font,x,y,width,height,scale,r,g,b,a)
	SetTextFont(font)
	SetTextProportional(0)
	SetTextScale(scale, scale)
	SetTextWrap(x - width/2.2,x+ width/2.2)
	l = GetLineCount(text,x - width/2.2, y - height/2.8)
	local lx, ly = x,y
	DrawRect(lx,  ly + 0.0025, width, height, 0,  0,  0,  180)	
	ly = ly+(scale/10)/2 + 0.011
	if l >1 then
		for i = 1,l do
			DrawRect(lx,  ly, width, (scale/10)/2, 0,  0,  0,  180)	
			ly = ly+(scale/10)/2
		end
	end
	SetTextColour(r, g, b, a)
	--SetTextDropShadow(0, 0, 0, 0,255)
	SetTextEdge(1, 0, 0, 0, 255)
	--SetTextDropShadow()
	--SetTextOutline()
	SetTextEntry("STRING")
	AddTextComponentString(text)
	DrawText(x - width/2.2, y - height/2.8)	
end

function drawRightMenuText(text,font,centre,x,y,scale,r,g,b,a)
	SetTextFont(font)
	SetTextProportional(0)
	SetTextScale(scale, scale)
	SetTextRightJustify(1)
	SetTextWrap(0.0,x)
	SetTextColour(r, g, b, a)
	--SetTextDropShadow(0, 0, 0, 0,255)
	SetTextEdge(1, 0, 0, 0, 255)
	--SetTextDropShadow()
	--SetTextOutline()
	SetTextCentre(centre)
	SetTextEntry("STRING")
	AddTextComponentString(text)
	DrawText(x , y)	
	--ScreenDrawPositionEnd()
end

function Menu:config(t)
	if t then
		if t.pcontrol then
			self.config.pcontrol = t.pcontrol
		end
	end
end

function Menu:Open(name)
	if name ~=nil then
		if self.name ~= name then
			self.currentmenu = self[name]
		else
			self.currentmenu = name
		end
	end
	if self.OnMenuOpen ~= nil then
		self:OnMenuOpen(self)
	end
	self.visible = true
	self:draw()
	if not self.config.pcontrol then
		SetPlayerControl(PlayerId(),false,260)
	end
	Citizen.CreateThread(function()
		if not HasStreamedTextureDictLoaded("commonmenu") then
			RequestStreamedTextureDict("commonmenu")
			while not HasStreamedTextureDictLoaded("commonmenu") do
				Citizen.Wait(0)
			end
		end
		if not HasStreamedTextureDictLoaded("commonmenutu") then
			RequestStreamedTextureDict("commonmenutu")
			while not HasStreamedTextureDictLoaded("commonmenutu") do
				Citizen.Wait(0)
			end
		end
		if self.title_sprite then
			if not HasStreamedTextureDictLoaded(self.title_sprite) then
				RequestStreamedTextureDict(self.title_sprite)
				while not HasStreamedTextureDictLoaded(self.title_sprite) do
					Citizen.Wait(0)
				end
			end
		end
		--[[if not HasStreamedTextureDictLoaded("") then
			RequestStreamedTextureDict("")
			while not HasStreamedTextureDictLoaded("") do
				Citizen.Wait(0)
			end
		end]]
	end)
end

function Menu:ChangeMenu(name)
	if name ~= self.name then
		name = self[name]
	else
		name = self
	end
	if self.OnMenuChange ~= nil then
		self:OnMenuChange(self.currentmenu,name)
	end
	self.lastmenu[#self.lastmenu+1] = self.currentmenu
	self.currentmenu = name
end

function Menu:Close()
	if self.OnMenuClose ~= nil then
		self:OnMenuClose(self)
	end
	self.visible = false
	self.currentmenu = "main"
	self.selected = 1
	self.lastmenu = {}
	self.from = 1
	self.to = self.maxbuttons
	if not self.config.pcontrol then
		SetPlayerControl(PlayerId(),true)
	end
	if HasStreamedTextureDictLoaded("commonmenu") then
		SetStreamedTextureDictAsNoLongerNeeded("commonmenu")
	end
	if HasStreamedTextureDictLoaded("commonmenutu") then
		SetStreamedTextureDictAsNoLongerNeeded("commonmenutu")
	end
end

function Menu:addButton(name, args)
	local button = {}
	button.name = name 
	button.selected = false
	button.sprite = nil
	if args ~= nil then
		if not type(args) == 'table' then
			args = {args}
		end
		button.args = args
	end
	table.insert(self.buttons, button)
	return self.buttons[#self.buttons]
end

function Menu:addPurchase(name,price,info,args)
	local button = {}
	button.name = name 
	button.selected = false
	if args ~= nil then
		if not type(args) == 'table' then
			args = {args}
		end
		button.args = args
	end
	button.price = price or 0
	button.purchased = false
	button.sprite = nil
	button.info = info
	table.insert(self.buttons, button)
	return self.buttons[#self.buttons]
end


function Menu:addList(name, list)
	local button = {}
	button.name = name 
	button.selected = false
	button.list = list
	button.sprite = nil
	button.listindex = 1
	table.insert(self.buttons, button)
	return self.buttons[#self.buttons]
end

function Menu:addCheckbox(name, b)
	local button = {}
	button.name = name 
	button.selected = false
	button.sprite = nil
	button.checkbox = b
	table.insert(self.buttons, button)
	return self.buttons[#self.buttons]
end

function Menu:removeButton(button)
	for i,btn in pairs(self.buttons) do
		if btn == button then
			buttons[i] = nil
			break
		end
	end
end



function Menu:OnButtonListChange(button)
	if button then

	end
end

function Menu:addSubMenu(header,name,info,addbtn)
	if self[name] ~= nil then
	setmetatable(getmetatable(self[name]),nil)
	self[name] = nil
	end
	local submenu = {
		buttons = {},
		header = header,
		name = name,
		parent = self.name,
		selected = 1,
		from = 1,
		to = self.maxbuttons,
		maxbuttons = self.maxbuttons
	}
	if info then
		submenu.info = info
	end
	self[name] = submenu
	for i,btn in pairs(self.buttons) do
		if btn.menu and btn.menu.name == name then
			addbtn = false
		end
	end
	if addbtn then
		table.insert(self.buttons, { name = name, selected = false, menu = self[name], info = info })
	end
	return setmetatable(self[name],Menu)
end

function tablelength(T)
  local count = 0
  for _ in pairs(T) do count = count + 1 end
  return count
end

function Menu:draw()
	Citizen.CreateThread(function()
	local menu
	local buttons
	local lastselect = nil
		while self.visible do
			Citizen.Wait(0)
	
			local cfg = self.config
			local size = cfg.size
			local width = size.width 
			local height = size.height 
			height = height/self.maxbuttons
			local scale = cfg.scale
			scale = height/0.1
			local x = cfg.position.x
			local y = cfg.position.y
			local tx = x
			local ty = y
			--tx = tx - 
			--Title
			if self.title_sprite then
				DrawSprite(self.title_sprite, self.title_sprite, x,  y - 0.039, width, height + 0.08, 0.00,255,255,255,255)
			else
				drawMenuText(self.title,1,1,tx,ty - height -0.009,scale*2.4,cfg.stext_color.r,cfg.stext_color.g,cfg.stext_color.b,cfg.stext_color.a)
				DrawRect(x,  y - 0.019, width, height + 0.04,cfg.sbg_color.r,cfg.sbg_color.g,cfg.sbg_color.b,cfg.sbg_color.a)
			end
			y = y + height
			ty = y - height/2.8
			tx = tx - (width/2.2)
				
			--Buttons
			if self.currentmenu == "main" then
				menu = self
			else
				menu = self.currentmenu
			end
			if menu == nil then
				return
			end
			buttons = menu.buttons
			--menu info
			if self.header then
				drawMenuText(menu.header:upper(),cfg.font,0,tx,ty,scale,cfg.text_color.r,cfg.text_color.g,cfg.text_color.b,cfg.text_color.a)
			end
			drawRightMenuText(menu.selected..'/'..tablelength(menu.buttons),cfg.font,0,x + (width/2.1),ty,scale,cfg.text_color.r,cfg.text_color.g,cfg.text_color.b,cfg.text_color.a)
			DrawRect(x,  y, width, height,cfg.bg_color.r,cfg.bg_color.g,cfg.bg_color.b,255)
			y = y + height
			ty = y - height/2.8
			
				for i,btn in pairs(buttons) do
					if i >= menu.from and i <= menu.to then
						if menu.selected == i then
							if lastselect ~= menu.selected then
								lastselect = menu.selected
								if self.onSelectedIndexChanged ~= nil then
									self:onSelectedIndexChanged(btn.name,btn)
								end
							end
							drawMenuText(btn.name,cfg.font,0,tx,ty,scale,cfg.stext_color.r,cfg.stext_color.g,cfg.stext_color.b,cfg.stext_color.a)
							DrawRect(x,  y, width, height,cfg.sbg_color.r,cfg.sbg_color.g,cfg.sbg_color.b,cfg.sbg_color.a)
							if btn.sprite ~= nil then
								if btn.sprite == "garage" then
									DrawSprite("commonmenu", "shop_garage_icon_b", x + (width/2.4), y, scale/10 -0.01, scale/10 +0.01, 0.00,cfg.text_color.r,cfg.text_color.g,cfg.text_color.b,cfg.text_color.a)
								end
							elseif btn.price ~= nil then	
								if btn.price == 0 then
									drawRightMenuText("",cfg.font,0,x + (width/2.1),ty,scale,cfg.stext_color.r,cfg.stext_color.g,cfg.stext_color.b,cfg.stext_color.a)
								else
									if not btn.purchased then
										drawRightMenuText("$"..btn.price,cfg.font,0,x + (width/2.1),ty,scale,cfg.stext_color.r,cfg.stext_color.g,cfg.stext_color.b,cfg.stext_color.a)
									else
										drawRightMenuText("OWNED",cfg.font,0,x + (width/2.1),ty,scale,cfg.stext_color.r,cfg.stext_color.g,cfg.stext_color.b,cfg.stext_color.a)
									end
								end
							elseif btn.menu ~= nil then
									DrawSprite("commonmenutu", "arrowright", x + (width/2.2), y, scale/14 -0.01, scale/19 +0.01, 0.00,cfg.stext_color.r,cfg.stext_color.g,cfg.stext_color.b,cfg.stext_color.a)
							end
							if  IsControlJustReleased(1,self.config.controls.menu_select) or IsDisabledControlJustReleased(1,self.config.controls.menu_select) then
								if self.onButtonSelected ~= nil then
										self:onButtonSelected(btn.name,btn)
								end
								if btn.menu ~= nil then
									if self.OnMenuChange ~= nil then
										self:OnMenuChange(menu,btn.menu)
									end
									self.lastmenu[#self.lastmenu+1] = self.currentmenu
									self.currentmenu = btn.menu
									lastselect = nil
								end
								if btn.checkbox ~= nil then
									btn.checkbox = not btn.checkbox
									if self.onCheckboxChange ~= nil then
										self:onCheckboxChange(btn.name,btn.checkbox)
									end
								end
							end
							if btn.checkbox ~= nil then
								if btn.checkbox then
									DrawSprite("commonmenu", "shop_box_tickb", x + (width/2.3), y, scale/10, scale/10, 0.00,cfg.stext_color.r,cfg.stext_color.g,cfg.stext_color.b,cfg.stext_color.a)
								else
									DrawSprite("commonmenu", "shop_box_blankb",  x + (width/2.3), y, scale/10, scale/10, 0.00,cfg.stext_color.r,cfg.stext_color.g,cfg.stext_color.b,cfg.stext_color.a)
								end
							end
							if btn.list then
								drawRightMenuText('< '..btn.list[btn.listindex]..' >',cfg.font,0,x + (width/2.1),ty,scale,cfg.stext_color.r,cfg.stext_color.g,cfg.stext_color.b,cfg.stext_color.a)
								if IsControlJustPressed(1,self.config.controls.menu_left) or IsDisabledControlJustPressed(1,self.config.controls.menu_left)then
									if btn.listindex > 1 then
										btn.listindex = btn.listindex - 1
									else
										btn.listindex = #btn.list
									end
									if self.OnButtonListChange ~= nil then
										self:OnButtonListChange(btn)
									end
								end
								if IsControlJustPressed(1,self.config.controls.menu_right) or IsDisabledControlJustPressed(1,self.config.controls.menu_right) then
									if btn.listindex < #btn.list then
										btn.listindex = btn.listindex + 1
									else
										btn.listindex = 1
									end
									if self.OnButtonListChange ~= nil then
										self:OnButtonListChange(btn)
									end
								end
							end
						else
							drawMenuText(btn.name,cfg.font,0,tx,ty,scale,cfg.text_color.r,cfg.text_color.g,cfg.text_color.b,cfg.text_color.a)
							if btn.list then
								drawRightMenuText('< '..btn.list[btn.listindex]..' >',cfg.font,0,x + (width/2.1),ty,scale,cfg.text_color.r,cfg.text_color.g,cfg.text_color.b,cfg.text_color.a)
							end
							DrawRect(x,  y, width, height,cfg.bg_color.r,cfg.bg_color.g,cfg.bg_color.b,cfg.bg_color.a)
							if btn.sprite ~= nil then
								if btn.sprite == "garage" then
									DrawSprite("commonmenu", "shop_garage_icon_a", x + (width/2.4), y, scale/10 -0.01, scale/10 +0.01, 0.00,cfg.text_color.r,cfg.text_color.g,cfg.text_color.b,cfg.text_color.a)
								end
							elseif btn.price ~= nil then
								if btn.price ~= 0 then
									if not btn.purchased then
										drawRightMenuText("$"..btn.price,cfg.font,0,x + (width/2.1),ty,scale,cfg.text_color.r,cfg.text_color.g,cfg.text_color.b,cfg.text_color.a)
									else
										drawRightMenuText("OWNED",cfg.font,0,x + (width/2.1),ty,scale,cfg.text_color.r,cfg.text_color.g,cfg.text_color.b,cfg.text_color.a)
									end
								end
							elseif btn.menu ~= nil then
									DrawSprite("commonmenu", "arrowright", x + (width/2.2), y, scale/14 -0.01, scale/19 +0.01, 0.00,cfg.text_color.r,cfg.text_color.g,cfg.text_color.b,cfg.text_color.a)
							end
							if btn.checkbox ~= nil then
								if btn.checkbox then
									DrawSprite("commonmenu", "shop_box_tick", x + (width/2.3), y, scale/10, scale/10, 0.00,cfg.text_color.r,cfg.text_color.g,cfg.text_color.b,cfg.text_color.a)
								else
									DrawSprite("commonmenu", "shop_box_blank",  x + (width/2.3), y, scale/10, scale/10, 0.00,cfg.text_color.r,cfg.text_color.g,cfg.text_color.b,cfg.text_color.a)
								end
							end
						end
						
						y = y + height
						ty = y - height/2.8
					end
				end
				if tablelength(buttons) > menu.maxbuttons then
					DrawRect(x,  y, width, height,cfg.bg_color.r,cfg.bg_color.g,cfg.bg_color.b,255)
					DrawSprite("commonmenu", "shop_arrows_upanddown", x , y, scale/13, scale/9, 0.00,cfg.text_color.r,cfg.text_color.g,cfg.text_color.b,cfg.text_color.a)
					y = y + height
					ty = y - height/2.8
				end
				if self.notification ~= nil then
					DrawRect(x,  y-height + y-ty + 0.0055, width, 0.0035,cfg.sbg_color.r,cfg.sbg_color.g,cfg.sbg_color.b,255)
					drawInfo(self.notification,cfg.font,x,y,width,height,scale,cfg.text_color.r,cfg.text_color.g,cfg.text_color.b,cfg.text_color.a)
				elseif menu.buttons[menu.selected] and menu.buttons[menu.selected].info ~= nil then
					DrawRect(x,  y-height + y-ty + 0.0055, width, 0.0035,cfg.sbg_color.r,cfg.sbg_color.g,cfg.sbg_color.b,255)
					drawInfo(menu.buttons[menu.selected].info,cfg.font,x,y,width,height,scale,cfg.text_color.r,cfg.text_color.g,cfg.text_color.b,cfg.text_color.a)
				end
				if IsControlJustPressed(1,self.config.controls.menu_up) or IsDisabledControlJustPressed(1,self.config.controls.menu_up)then
					if menu.selected > 1 then
						menu.selected = menu.selected - 1
					else
						menu.selected = #buttons
						menu.from = #buttons - menu.maxbuttons+1
						menu.to = #buttons
					end
					if tablelength(buttons) > menu.maxbuttons and menu.selected < menu.from then
						menu.from = menu.from -1
						menu.to = menu.to - 1
					end
				end
				if IsControlJustPressed(1,self.config.controls.menu_down) or IsDisabledControlJustPressed(1,self.config.controls.menu_down) then
					if menu.selected < #buttons then
						menu.selected = menu.selected + 1
					else
						menu.selected = 1
						menu.from = 1
						menu.to = menu.maxbuttons
					end
					if tablelength(buttons) > menu.maxbuttons and menu.selected > menu.to then
						menu.from = menu.from +1
						menu.to = menu.to + 1
					end
				end
				if IsControlJustReleased(1,  self.config.controls.menu_back) or IsDisabledControlJustReleased(1,  self.config.controls.menu_back) then
					if #self.lastmenu < 1 or self.currentmenu == self.lastmenu[1] then
						self:Close()
					else
						if self.OnMenuChange ~= nil then
							if self.lastmenu[#self.lastmenu] == 'main' then
								self:OnMenuChange(menu,self)
							else
								self:OnMenuChange(menu,self.lastmenu[#self.lastmenu])
							end
						end
						self.currentmenu = self.lastmenu[#self.lastmenu]
						self.lastmenu[#self.lastmenu] = nil
					end
				end
		end
	end)
end

function GetLineCount(text,x,y)
	BeginTextCommandLineCount("STRING")
	AddTextComponentString(text)
	return EndTextCommandGetLineCount(x,y)
end

function Menu:getTitle()
	return self.title
end

function Menu:setTitle(txt)
	self.title = txt
end

function Menu:getName()
	return self.name
end

function Menu:getHeader()
	return self.header
end

function SetMenu()
	return Menu
end