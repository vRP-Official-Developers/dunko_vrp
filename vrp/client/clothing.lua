RMenu.Add('vRPClothing', 'main', RageUI.CreateMenu("Clothing", "~b~Clothing Menu",1250,100))
RMenu.Add('vRPClothing', 'clothingsubmenu',  RageUI.CreateSubMenu(RMenu:Get("vRPClothing", "main")))
RMenu.Add('vRPClothing', 'changegendersubmenu',  RageUI.CreateSubMenu(RMenu:Get("vRPClothing", "main")))

local Face = {Max = {}, Index = 0, TextureIndex = 0};
local Mask = {Max = {}, Index = 0, TextureIndex = 0};
local Hair = {Max = {}, Index = 0, TextureIndex = 0};
local Torso = {Max = {}, Index = 0, TextureIndex = 0};
local Legs =  {Max = {}, Index = 0, TextureIndex = 0};
local Parachute = {Max = {}, Index = 0, TextureIndex = 0};
local Shoes = {Max = {}, Index = 0, TextureIndex = 0};
local Accessory = {Max = {}, Index = 0, TextureIndex = 0};
local Undershirt = {Max = {}, Index = 0, TextureIndex = 0};
local Kevlar = {Max = {}, Index = 0, TextureIndex = 0}; 
local Badge = {Max = {}, Index = 0, TextureIndex = 0};
local Torso2 = {Max = {}, Index = 0, TextureIndex = 0};
local Hats = {Max = {}, Index = 0, TextureIndex = 0};
local Glasses = {Max = {}, Index = 0, TextureIndex = 0};
local Earings = {Max = {}, Index = 0, TextureIndex = 0};
local Watches = {Max = {}, Index = 0, TextureIndex = 0};
local Bracelets = {Max = {}, Index = 0, TextureIndex = 0};
local SelectedOption = nil;
local MenuOpen = false;



function DrawAdvancedText(x,y ,w,h,sc, text, r,g,b,a,font,jus)
    SetTextFont(font)
    SetTextProportional(0)
    SetTextScale(sc, sc)
	N_0x4e096588b13ffeca(jus)
    SetTextColour(r, g, b, a)
    SetTextDropShadow(0, 0, 0, 0,255)
    SetTextEdge(1, 0, 0, 0, 255)
    SetTextDropShadow()
    SetTextEntry("STRING")
    AddTextComponentString(text)
	DrawText(x - 0.1+w, y - 0.02+h)
end


RageUI.CreateWhile(1.0, true, function()
    
    if RageUI.Visible(RMenu:Get('vRPClothing', 'main')) then
        RageUI.DrawContent({ header = true, glare = true, instructionalButton = true}, function()
            RageUI.Button("Change Clothing", "", {}, true, function(Hovered, Active, Selected) end, RMenu:Get("vRPClothing", "clothingsubmenu"))
            RageUI.Button("Change Gender", "", {}, true, function(Hovered, Active, Selected) end, RMenu:Get("vRPClothing", "changegendersubmenu"))
            RageUI.Button("Clear Prop Index", "", {}, true, function(Hovered, Active, Selected) 
                if Selected then 
                    ClearAllPedProps(PlayerPedId())
                end
            end)
        end)
    end
    if RageUI.Visible(RMenu:Get('vRPClothing', 'changegendersubmenu')) then 
        RageUI.DrawContent({ header = true, glare = true, instructionalButton = true}, function()
            RageUI.Button("Female", "", {}, true, function(Hovered, Active, Selected) 
                if Selected then 
                    local model = GetHashKey('mp_f_freemode_01')
                    RequestModel(model)
                    while not HasModelLoaded(model) do
                        RequestModel(model)
                        Citizen.Wait(0)
                    end
                    SetPlayerModel(PlayerId(), model)
                    SetPedComponentVariation(GetPlayerPed(-1), 0, 0, 0, 2) 
                end
            end,RMenu:Get("vRPClothing", "changegendersubmenu"))
            RageUI.Button("Male", "", {}, true, function(Hovered, Active, Selected) 
                if Selected then
                    local model = GetHashKey('mp_m_freemode_01')
                    RequestModel(model)
                    while not HasModelLoaded(model) do
                        RequestModel(model)
                        Citizen.Wait(0)
                    end
                    SetPlayerModel(PlayerId(), model)
                    SetPedComponentVariation(GetPlayerPed(-1), 0, 0, 0, 2) 
                end
            end)
        end)
    end
    if RageUI.Visible(RMenu:Get('vRPClothing', 'clothingsubmenu')) then
        DrawAdvancedText(0.870, 0.850, 0.005, 0.0028, 0.4, 'Press SPACE to input an ID',  255, 255, 255, 255, 6, 0)
        if IsControlJustPressed(0, 203) then 
                AddTextEntry('FMMC_MPM_NA', "Enter Clothing ID")
                DisplayOnscreenKeyboard(1, "FMMC_MPM_NA", "", "", "", "", "", 30)
                while (UpdateOnscreenKeyboard() == 0) do
                    DisableAllControlActions(0);
                    Wait(0);
                end
                if (GetOnscreenKeyboardResult()) then
                    local result = GetOnscreenKeyboardResult()
                    local ped = PlayerPedId()
                    if tonumber(SelectedOption) then 
                    SetPedComponentVariation(ped, SelectedOption, tonumber(result), 0, 0)
                    elseif SelectedOption == "hats" then
                        SetPedPropIndex(PlayerPedId(), 0, tonumber(result), Hats.TextureIndex, 0)
                    elseif SelectedOption == "glasses" then 
                        SetPedPropIndex(PlayerPedId(), 1, tonumber(result), Glasses.TextureIndex, 0)
                    elseif SelectedOption == "earings" then
                        SetPedPropIndex(PlayerPedId(), 2, tonumber(result), Earings.TextureIndex, 0) 
                    elseif SelectedOption == "watches" then 
                        SetPedPropIndex(PlayerPedId(), 6, tonumber(result), Watches.TextureIndex, 0)
                    elseif SelectedOption == "bracelets" then 
                        SetPedPropIndex(PlayerPedId(), 7, tonumber(result), Bracelets.TextureIndex, 0)
                    end
                    Face.Index = GetPedDrawableVariation(ped, 0)
                    Face.TextureIndex = GetPedTextureVariation(ped, 0)
                    Mask.Index = GetPedDrawableVariation(ped, 1)
                    Mask.TextureIndex = GetPedTextureVariation(ped, 1)
                    Hair.Index = GetPedDrawableVariation(ped, 2)
                    Hair.TextureIndex = GetPedTextureVariation(ped, 2)
                    Torso.Index = GetPedDrawableVariation(ped, 3)
                    Torso.TextureIndex = GetPedTextureVariation(ped, 3)
                    Legs.Index = GetPedDrawableVariation(ped, 4)
                    Legs.TextureIndex = GetPedTextureVariation(ped, 4)
                    Parachute.Index = GetPedDrawableVariation(ped, 5)
                    Parachute.TextureIndex = GetPedTextureVariation(ped, 5)
                    Shoes.Index = GetPedDrawableVariation(ped, 6)
                    Shoes.TextureIndex = GetPedTextureVariation(ped, 6)
                    Accessory.Index = GetPedDrawableVariation(ped, 7)
                    Accessory.TextureIndex = GetPedTextureVariation(ped, 7)
                    Undershirt.Index = GetPedDrawableVariation(ped, 8)
                    Undershirt.TextureIndex = GetPedTextureVariation(ped, 8)
                    Kevlar.Index = GetPedDrawableVariation(ped, 9)
                    Kevlar.TextureIndex = GetPedTextureVariation(ped, 9)
                    Badge.Index = GetPedDrawableVariation(ped, 10)
                    Badge.TextureIndex = GetPedTextureVariation(ped, 10)
                    Torso2.Index = GetPedDrawableVariation(ped, 11)
                    Torso2.TextureIndex = GetPedTextureVariation(ped, 11)
                    Hats.Index = GetNumberOfPedPropDrawableVariations(ped, 0)
                    Glasses.Index = GetPedPropIndex(ped, 1)
                    Earings.Index = GetPedPropIndex(ped, 2)
                    Watches.Index = GetPedPropIndex(ped, 6)
                    Bracelets.Index = GetPedPropIndex(ped, 7)
                end
        end
        RageUI.DrawContent({ header = true, glare = true, instructionalButton = true}, function()
            RageUI.List("Face", Face.Max, Face.Index, "", { }, true, function(Hovered, Active, Selected, Index)
                Face.Index = Index
                if Active then
                    SelectedOption = 0;
                    DrawAdvancedText(0.863, 0.809, 0.005, 0.0028, 0.4, 'Texture Index: ' .. Face.TextureIndex .. "/" .. GetNumberOfPedTextureVariations(PlayerPedId(), 0, Face.Index),  255, 255, 255, 255, 6, 0)
                    SetPedComponentVariation(PlayerPedId(), 0, Face.Index, Face.TextureIndex, 0)
                end
                if Selected then 
                    if Face.TextureIndex > (GetNumberOfPedTextureVariations(PlayerPedId(), 0, Face.Index)-1) then 
                        Face.TextureIndex = 0;
                    else 
                        Face.TextureIndex = Face.TextureIndex + 1
                    end
                end
            end)
            RageUI.List("Mask", Mask.Max, Mask.Index, "", { }, true, function(Hovered, Active, Selected, Index)
                Mask.Index = Index
                if Active then
                    SelectedOption = 1;
                    DrawAdvancedText(0.863, 0.809, 0.005, 0.0028, 0.4, 'Texture Index: ' .. Mask.TextureIndex .. "/" .. GetNumberOfPedTextureVariations(PlayerPedId(), 1, Mask.Index),  255, 255, 255, 255, 6, 0)
                    SetPedComponentVariation(PlayerPedId(), 1, Mask.Index, Mask.TextureIndex, 0)
                end
                if Selected then 
                    if Mask.TextureIndex > (GetNumberOfPedTextureVariations(PlayerPedId(), 1, Mask.Index)-1) then 
                        Mask.TextureIndex = 1;
                    else 
                        Mask.TextureIndex = Mask.TextureIndex + 1
                    end
                end
            end)
            RageUI.List("Hair", Hair.Max, Hair.Index, "", { }, true, function(Hovered, Active, Selected, Index)
                Hair.Index = Index
                if Active then
                    SelectedOption = 2;
                    DrawAdvancedText(0.863, 0.809, 0.005, 0.0028, 0.4, 'Texture Index: ' .. Hair.TextureIndex .. "/" .. GetNumberOfPedTextureVariations(PlayerPedId(), 2, Hair.Index),  255, 255, 255, 255, 6, 0)
                    SetPedComponentVariation(PlayerPedId(), 2, Hair.Index, Hair.TextureIndex, 0)
                end
                if Selected then 
                    if Hair.TextureIndex >= (GetNumberOfPedTextureVariations(PlayerPedId(), 2, Hair.Index)-1) then 
                        Hair.TextureIndex = 0;
                    else 
                        Hair.TextureIndex = Hair.TextureIndex + 1
                    end
                end
            end)
            RageUI.List("Hands", Torso.Max, Torso.Index, "", { }, true, function(Hovered, Active, Selected, Index)
                Torso.Index = Index
                if Active then
                    SelectedOption = 3;
                    DrawAdvancedText(0.863, 0.809, 0.005, 0.0028, 0.4, 'Texture Index: ' .. Torso.TextureIndex .. "/" .. GetNumberOfPedTextureVariations(PlayerPedId(), 3, Torso.Index),  255, 255, 255, 255, 6, 0)
                    SetPedComponentVariation(PlayerPedId(), 3, Torso.Index, Torso.TextureIndex, 0)
                end
                if Selected then 
                    if Torso.TextureIndex > (GetNumberOfPedTextureVariations(PlayerPedId(), 3, Torso.Index)-1) then 
                        Torso.TextureIndex = 0;
                    else 
                        Torso.TextureIndex = Torso.TextureIndex + 1
                    end
                end
            end)
            RageUI.List("Legs", Legs.Max, Legs.Index, "", { }, true, function(Hovered, Active, Selected, Index)
                Legs.Index = Index
                if Active then
                    SelectedOption = 4;
                    DrawAdvancedText(0.863, 0.809, 0.005, 0.0028, 0.4, 'Texture Index: ' .. Legs.TextureIndex .. "/" .. GetNumberOfPedTextureVariations(PlayerPedId(), 4, Legs.Index),  255, 255, 255, 255, 6, 0)
                    SetPedComponentVariation(PlayerPedId(), 4, Legs.Index, Legs.TextureIndex, 0)
                end
                if Selected then 
                    if Legs.TextureIndex > (GetNumberOfPedTextureVariations(PlayerPedId(), 4, Legs.Index)-1) then 
                        Legs.TextureIndex = 1;
                    else 
                        Legs.TextureIndex = Legs.TextureIndex + 1
                    end
                end
            end)
            RageUI.List("Parachutes", Parachute.Max, Parachute.Index, "", { }, true, function(Hovered, Active, Selected, Index)
                Parachute.Index = Index
                if Active then
                    SelectedOption = 5;
                    DrawAdvancedText(0.863, 0.809, 0.005, 0.0028, 0.4, 'Texture Index: ' .. Parachute.TextureIndex .. "/" .. GetNumberOfPedTextureVariations(PlayerPedId(), 5, Parachute.Index),  255, 255, 255, 255, 6, 0)
                    SetPedComponentVariation(PlayerPedId(), 5, Parachute.Index, Parachute.TextureIndex, 0)
                end
                if Selected then 
                    if Parachute.TextureIndex > (GetNumberOfPedTextureVariations(PlayerPedId(), 5, Parachute.Index)-1) then 
                        Parachute.TextureIndex = 0;
                    else 
                        Parachute.TextureIndex = Parachute.TextureIndex + 1
                    end
                end
            end)
            RageUI.List("Shoes", Shoes.Max, Shoes.Index, "", { }, true, function(Hovered, Active, Selected, Index)
                Shoes.Index = Index
                if Active then
                    SelectedOption = 6;
                    DrawAdvancedText(0.863, 0.809, 0.005, 0.0028, 0.4, 'Texture Index: ' .. Shoes.TextureIndex .. "/" .. GetNumberOfPedTextureVariations(PlayerPedId(), 6, Shoes.Index),  255, 255, 255, 255, 6, 0)
                    SetPedComponentVariation(PlayerPedId(), 6, Shoes.Index, Shoes.TextureIndex, 0)
                end
                if Selected then 
                    if Shoes.TextureIndex > (GetNumberOfPedTextureVariations(PlayerPedId(), 6, Shoes.Index)-1) then 
                        Shoes.TextureIndex = 0;
                    else 
                        Shoes.TextureIndex = Shoes.TextureIndex + 1
                    end
                end
            end)
            RageUI.List("Accessories", Accessory.Max, Accessory.Index, "", { }, true, function(Hovered, Active, Selected, Index)
                Accessory.Index = Index
                if Active then
                    SelectedOption = 7;
                    DrawAdvancedText(0.863, 0.809, 0.005, 0.0028, 0.4, 'Texture Index: ' .. Accessory.TextureIndex .. "/" .. GetNumberOfPedTextureVariations(PlayerPedId(), 7, Accessory.Index),  255, 255, 255, 255, 6, 0)
                    SetPedComponentVariation(PlayerPedId(), 7, Accessory.Index, Accessory.TextureIndex, 0)
                end
                if Selected then 
                    if Accessory.TextureIndex > (GetNumberOfPedTextureVariations(PlayerPedId(), 7, Accessory.Index)-1) then 
                        Accessory.TextureIndex = 0;
                    else 
                        Accessory.TextureIndex = Accessory.TextureIndex + 1
                    end
                end
            end)
            RageUI.List("Under Shirt", Undershirt.Max, Undershirt.Index, "", { }, true, function(Hovered, Active, Selected, Index)
                Undershirt.Index = Index
                if Active then
                    SelectedOption = 8;
                    DrawAdvancedText(0.863, 0.809, 0.005, 0.0028, 0.4, 'Texture Index: ' .. Undershirt.TextureIndex .. "/" .. GetNumberOfPedTextureVariations(PlayerPedId(), 8, Undershirt.Index),  255, 255, 255, 255, 6, 0)
                    SetPedComponentVariation(PlayerPedId(), 8, Undershirt.Index, Undershirt.TextureIndex, 0)
                end
                if Selected then 
                    if Undershirt.TextureIndex > (GetNumberOfPedTextureVariations(PlayerPedId(), 8, Undershirt.Index)-1) then 
                        Undershirt.TextureIndex = 0;
                    else 
                        Undershirt.TextureIndex = Accessory.TextureIndex + 1
                    end
                end
            end)
            RageUI.List("Vest", Kevlar.Max, Kevlar.Index, "", { }, true, function(Hovered, Active, Selected, Index)
                Kevlar.Index = Index
                if Active then
                    SelectedOption = 9;
                    DrawAdvancedText(0.863, 0.809, 0.005, 0.0028, 0.4, 'Texture Index: ' .. Kevlar.TextureIndex .. "/" .. GetNumberOfPedTextureVariations(PlayerPedId(), 9, Kevlar.Index),  255, 255, 255, 255, 6, 0)
                    SetPedComponentVariation(PlayerPedId(), 9, Kevlar.Index, Kevlar.TextureIndex, 0)
                end
                if Selected then 
                    if Kevlar.TextureIndex > (GetNumberOfPedTextureVariations(PlayerPedId(), 9, Kevlar.Index)-1) then 
                        Kevlar.TextureIndex = 0;
                    else 
                        Kevlar.TextureIndex = Kevlar.TextureIndex + 1
                    end
                end
            end)
            RageUI.List("Badges", Badge.Max, Badge.Index, "", { }, true, function(Hovered, Active, Selected, Index)
                Badge.Index = Index
                if Active then
                    SelectedOption = 10;
                    DrawAdvancedText(0.863, 0.809, 0.005, 0.0028, 0.4, 'Texture Index: ' .. Badge.TextureIndex .. "/" .. GetNumberOfPedTextureVariations(PlayerPedId(), 10, Badge.Index),  255, 255, 255, 255, 6, 0)
                    SetPedComponentVariation(PlayerPedId(), 10, Badge.Index, Badge.TextureIndex, 0)
                end
                if Selected then 
                    if Badge.TextureIndex >= (GetNumberOfPedTextureVariations(PlayerPedId(), 10, Badge.Index)-1) then 
                        Badge.TextureIndex = 0;
                    else 
                        Badge.TextureIndex = Badge.TextureIndex + 1
                    end
                end
            end)
            RageUI.List("Jackets", Torso2.Max, Torso2.Index, "", { }, true, function(Hovered, Active, Selected, Index)
                Torso2.Index = Index
                if Active then
                    SelectedOption = 11;
                    DrawAdvancedText(0.863, 0.809, 0.005, 0.0028, 0.4, 'Texture Index: ' .. Torso2.TextureIndex .. "/" .. GetNumberOfPedTextureVariations(PlayerPedId(), 11,  tonumber(Torso2.Index)),  255, 255, 255, 255, 6, 0)
                    SetPedComponentVariation(PlayerPedId(), 11, Torso2.Index, Torso2.TextureIndex, 0)
                end
                if Selected then 
                    if Torso2.TextureIndex >= (GetNumberOfPedTextureVariations(PlayerPedId(), 11, Torso2.Index)-1) then 
                        Torso2.TextureIndex = 0;
                    else 
                        Torso2.TextureIndex = Torso2.TextureIndex + 1
                    end
                end
            end)
            RageUI.List("Hats", Hats.Max, Hats.Index, "", { }, true, function(Hovered, Active, Selected, Index)
                Hats.Index = Index
                if Active then
                    SelectedOption = "hats";
                    DrawAdvancedText(0.863, 0.809, 0.005, 0.0028, 0.4, 'Texture Index: ' .. Hats.TextureIndex .. "/" .. GetNumberOfPedPropTextureVariations(PlayerPedId(), 0, Hats.Index),  255, 255, 255, 255, 6, 0)
                    SetPedPropIndex(PlayerPedId(), 0, Hats.Index, Hats.TextureIndex, 0)
                end
                if Selected then 
                    if Hats.TextureIndex >= (GetNumberOfPedPropTextureVariations(PlayerPedId(), 0, Hats.Index)-1) then 
                        Hats.TextureIndex = 0;
                    else 
                        Hats.TextureIndex = Hats.TextureIndex + 1
                    end
                end
            end)
            RageUI.List("Glasses", Glasses.Max, Glasses.Index, "", { }, true, function(Hovered, Active, Selected, Index)
                Glasses.Index = Index
                if Active then
                    SelectedOption = "glasses";
                    DrawAdvancedText(0.863, 0.809, 0.005, 0.0028, 0.4, 'Texture Index: ' .. Glasses.TextureIndex .. "/" .. GetNumberOfPedPropTextureVariations(PlayerPedId(), 1, Glasses.Index),  255, 255, 255, 255, 6, 0)
                    SetPedPropIndex(PlayerPedId(), 1, Glasses.Index, Glasses.TextureIndex, 0)
                end
                if Selected then 
                    if Glasses.TextureIndex >= (GetNumberOfPedPropTextureVariations(PlayerPedId(), 1, Glasses.Index)-1) then 
                        Glasses.TextureIndex = 0;
                    else 
                        Glasses.TextureIndex = Glasses.TextureIndex + 1
                    end
                end
            end)
            RageUI.List("Earings", Earings.Max, Earings.Index, "", { }, true, function(Hovered, Active, Selected, Index)
                Earings.Index = Index
                if Active then
                    SelectedOption = "earings";
                    DrawAdvancedText(0.863, 0.809, 0.005, 0.0028, 0.4, 'Texture Index: ' .. Earings.TextureIndex .. "/" .. GetNumberOfPedPropTextureVariations(PlayerPedId(), 2, Earings.Index),  255, 255, 255, 255, 6, 0)
                    SetPedPropIndex(PlayerPedId(), 2, Earings.Index, Earings.TextureIndex, 0)
                end
                if Selected then 
                    if Earings.TextureIndex >= (GetNumberOfPedPropTextureVariations(PlayerPedId(), 2, Earings.Index)-1) then 
                        Earings.TextureIndex = 0;
                    else 
                        Earings.TextureIndex = Earings.TextureIndex + 1
                    end
                end
            end)
            RageUI.List("Watches", Watches.Max, Watches.Index, "", { }, true, function(Hovered, Active, Selected, Index)
                Watches.Index = Index
                if Active then
                    SelectedOption = "watches";
                    DrawAdvancedText(0.863, 0.809, 0.005, 0.0028, 0.4, 'Texture Index: ' .. Watches.TextureIndex .. "/" .. GetNumberOfPedPropTextureVariations(PlayerPedId(), 6, Watches.Index),  255, 255, 255, 255, 6, 0)
                    SetPedPropIndex(PlayerPedId(), 6, Watches.Index, Watches.TextureIndex, 0)
                end
                if Selected then 
                    if Watches.TextureIndex >= (GetNumberOfPedPropTextureVariations(PlayerPedId(), 6, Watches.Index)-1) then 
                        Watches.TextureIndex = 0;
                    else 
                        Watches.TextureIndex = Watches.TextureIndex + 1
                    end
                end
            end)
            RageUI.List("Bracelets", Bracelets.Max, Bracelets.Index, "", { }, true, function(Hovered, Active, Selected, Index)
                Bracelets.Index = Index
                if Active then
                    SelectedOption = "bracelets";
                    DrawAdvancedText(0.863, 0.809, 0.005, 0.0028, 0.4, 'Texture Index: ' .. Bracelets.TextureIndex .. "/" .. GetNumberOfPedPropTextureVariations(PlayerPedId(), 7, Bracelets.Index),  255, 255, 255, 255, 6, 0)
                    SetPedPropIndex(PlayerPedId(), 7, Bracelets.Index, Bracelets.TextureIndex, 0)
                end
                if Selected then 
                    if Bracelets.TextureIndex >= (GetNumberOfPedPropTextureVariations(PlayerPedId(), 7, Bracelets.Index)-1) then 
                        Bracelets.TextureIndex = 0;
                    else 
                        Bracelets.TextureIndex = Bracelets.TextureIndex + 1
                    end
                end
            end)
        end)
    end
end)

local cfg = module("cfg/skinshops")
local skinshops = cfg.skinshops 


Citizen.CreateThread(function()
    for i,v in pairs(skinshops) do 
        local x,y,z = v[2], v[3], v[4]
        local Blip = AddBlipForCoord(x, y, z)
        SetBlipSprite(Blip, 73)
        SetBlipDisplay(Blip, 4)
        SetBlipScale(Blip, 0.9)
        SetBlipColour(Blip, 2)
        SetBlipAsShortRange(Blip, true)
        AddTextEntry("MAPBLIP", 'Clothing Store')
        BeginTextCommandSetBlipName("MAPBLIP")
        EndTextCommandSetBlipName(Blip)
        SetBlipCategory(Blip, 1)
    end
end)

Citizen.CreateThread(function()
    while true do 
        Wait(0)
        for i,v in pairs(skinshops) do 
            local x,y,z = v[2], v[3], v[4]
            if not HasStreamedTextureDictLoaded("clothing") then
				RequestStreamedTextureDict("clothing", true)
				while not HasStreamedTextureDictLoaded("clothing") do
					Wait(1)
				end
			else
			    DrawMarker(9, x, y, z, 0.0, 0.0, 0.0, 90.0, 0.0, 0.0, 1.0, 1.0, 1.0, 51, 153, 255, 1.0,false, false, 2, true, "clothing", "clothing", false)
            end 
        end 
    end
end)

local inMarker = false;
Citizen.CreateThread(function()
    while true do 
        Wait(250)
        inMarker = false;
        local ped = PlayerPedId()
        local coords = GetEntityCoords(ped)
        for i,v in pairs(skinshops) do 
            local x,y,z = v[2], v[3], v[4]
            if #(coords - vec3(x,y,z)) <= 1.0 then
                inMarker = true 
                break
            end    
        end
        if not MenuOpen and inMarker then 
            MenuOpen = true
            RageUI.Visible(RMenu:Get('vRPClothing', 'main'), true) 
            Face.Index = GetPedDrawableVariation(ped, 0)
            Face.TextureIndex = GetPedTextureVariation(ped, 0)
            Mask.Index = GetPedDrawableVariation(ped, 1)
            Mask.TextureIndex = GetPedTextureVariation(ped, 1)
            Hair.Index = GetPedDrawableVariation(ped, 2)
            Hair.TextureIndex = GetPedTextureVariation(ped, 2)
            Torso.Index = GetPedDrawableVariation(ped, 3)
            Torso.TextureIndex = GetPedTextureVariation(ped, 3)
            Legs.Index = GetPedDrawableVariation(ped, 4)
            Legs.TextureIndex = GetPedTextureVariation(ped, 4)
            Parachute.Index = GetPedDrawableVariation(ped, 5)
            Parachute.TextureIndex = GetPedTextureVariation(ped, 5)
            Shoes.Index = GetPedDrawableVariation(ped, 6)
            Shoes.TextureIndex = GetPedTextureVariation(ped, 6)
            Accessory.Index = GetPedDrawableVariation(ped, 7)
            Accessory.TextureIndex = GetPedTextureVariation(ped, 7)
            Undershirt.Index = GetPedDrawableVariation(ped, 8)
            Undershirt.TextureIndex = GetPedTextureVariation(ped, 8)
            Kevlar.Index = GetPedDrawableVariation(ped, 9)
            Kevlar.TextureIndex = GetPedTextureVariation(ped, 9)
            Badge.Index = GetPedDrawableVariation(ped, 10)
            Badge.TextureIndex = GetPedTextureVariation(ped, 10)
            Torso2.Index = GetPedDrawableVariation(ped, 11)
            Torso2.TextureIndex = GetPedTextureVariation(ped, 11)
            Hats.Index = GetPedPropIndex(ped, 0)
            Glasses.Index = GetPedPropIndex(ped, 1)
            Earings.Index = GetPedPropIndex(ped, 2)
            Watches.Index = GetPedPropIndex(ped, 6)
            Bracelets.Index = GetPedPropIndex(ped, 7)
            Hats.TextureIndex = GetPedPropTextureIndex(ped, 0)
            Glasses.TextureIndex = GetPedPropTextureIndex(ped, 1)
            Earings.TextureIndex = GetPedPropTextureIndex(ped, 2)
            Watches.TextureIndex = GetPedPropTextureIndex(ped, 6)
            Bracelets.TextureIndex = GetPedPropTextureIndex(ped, 7)
            Face.Max = {}
            Mask.Max = {}
            Hair.Max = {}
            Torso.Max = {}
            Hair.Max = {}
            Torso.Max = {}
            Legs.Max = {}
            Parachute.Max = {}
            Shoes.Max = {}
            Accessory.Max = {}
            Undershirt.Max = {}
            Kevlar.Max = {}
            Badge.Max = {}
            Torso2.Max = {}
            Glasses.Max = {}
            Earings.Max = {}
            Watches.Max = {}
            Bracelets.Max =  {}
            for i=0, GetNumberOfPedDrawableVariations(ped, 0) + 1 do 
                Face.Max[i] = i;
            end 
            for i=0, GetNumberOfPedDrawableVariations(ped, 1) + 1 do 
                Mask.Max[i] = i;
            end 
            for i=0, GetNumberOfPedDrawableVariations(ped, 2) + 1 do 
                Hair.Max[i] = i;
            end
            for i=0, GetNumberOfPedDrawableVariations(ped, 3) + 1 do 
                Torso.Max[i] = i;
            end 
            for i=0, GetNumberOfPedDrawableVariations(ped, 4) + 1 do 
                Legs.Max[i] = i;
            end  
            for i=0, GetNumberOfPedDrawableVariations(ped, 5) + 1 do 
                Parachute.Max[i] = i;
            end 
            for i=0, GetNumberOfPedDrawableVariations(ped, 6) + 1 do 
                Shoes.Max[i] = i;
            end 
            for i=0, GetNumberOfPedDrawableVariations(ped, 7) + 1 do 
                Accessory.Max[i] = i;
            end 
            for i=0, GetNumberOfPedDrawableVariations(ped, 8) + 1 do 
                Undershirt.Max[i] = i;
            end 
            for i=0, GetNumberOfPedDrawableVariations(ped, 9) + 1 do 
                Kevlar.Max[i] = i;
            end 
            for i=0, GetNumberOfPedDrawableVariations(ped, 10) + 1 do 
                Badge.Max[i] = i;
            end 
            for i=0, GetNumberOfPedDrawableVariations(ped, 11) + 1 do 
                Torso2.Max[i] = i;
            end 
            Hats.Max[-1] = -1
            Glasses.Max[-1] = -1
            Earings.Max[-1] = -1
            Watches.Max[-1] = -1
            Bracelets.Max[-1] = -1
            -- Hot fix for weird native behaviour
            if Hats.TextureIndex == -1 then 
                Hats.TextureIndex = 0
            end
            if Glasses.TextureIndex == -1 then 
                Glasses.TextureIndex = 0
            end
            if Earings.TextureIndex == -1 then 
                Earings.TextureIndex = 0
            end
            if Watches.TextureIndex == -1 then 
                Watches.TextureIndex = 0
            end
            if Bracelets.TextureIndex == -1 then 
                Bracelets.TextureIndex = 0
            end
            for i=0, GetNumberOfPedPropDrawableVariations(ped, 0) + 1 do 
                Hats.Max[i] = i;
            end 
            for i=0, GetNumberOfPedPropDrawableVariations(ped, 1) + 1 do 
                Glasses.Max[i] = i;
            end 
            for i=0, GetNumberOfPedPropDrawableVariations(ped, 2) + 1 do 
                Earings.Max[i] = i;
            end 
            for i=0, GetNumberOfPedPropDrawableVariations(ped, 6) + 1 do 
                Watches.Max[i] = i;
            end 
            for i=0, GetNumberOfPedPropDrawableVariations(ped, 7) + 1 do 
                Bracelets.Max[i] = i;
            end 
        end
        if not inMarker and MenuOpen then
            RageUI.ActuallyCloseAll()
            RageUI.Visible(RMenu:Get('vRPClothing', 'clothingsubmenu'), false)
            RageUI.Visible(RMenu:Get('vRPClothing', 'changegendersubmenu'), false)  
            RageUI.Visible(RMenu:Get('vRPClothing', 'main'), false)
            MenuOpen = false
        end
    end
end)