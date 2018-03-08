Citizen.CreateThread(function()
    local items = { "Item 1", "Item 2", "Item 3", "Item 4", "Item 5" }
    local currentItemIndex = 1
    local selectedItemIndex = 1
    local checkbox = true

    WarMenu.CreateMenu('test', 'Test title')
    WarMenu.CreateSubMenu('closeMenu', 'test', 'Are you sure?')

    while true do
        if WarMenu.IsMenuOpened('test') then
            if WarMenu.CheckBox('Checkbox', checkbox, function(checked)
                    checkbox = checked
                end) then
                    -- Do your stuff here
            elseif WarMenu.ComboBox('Combobox', items, currentItemIndex, selectedItemIndex, function(currentIndex, selectedIndex)
                    currentItemIndex = currentIndex
                    selectedItemIndex = selectedIndex

                    -- Do your stuff here if current index was changed (don't forget to check it)
                end) then
                    -- Do your stuff here if current item was activated
            elseif WarMenu.MenuButton('Exit', 'closeMenu') then
            end

            WarMenu.Display()
        elseif WarMenu.IsMenuOpened('closeMenu') then
            if WarMenu.Button('Yes') then
                WarMenu.CloseMenu()
            elseif WarMenu.MenuButton('No', 'test') then
            end

            WarMenu.Display()
        elseif IsControlJustReleased(0, 244) then --M by default
            WarMenu.OpenMenu('test')
        end

        Citizen.Wait(0)
    end
end)