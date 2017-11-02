--[[
Native Scoreboard
Copyright (C) 2017  Jordan Dalton

This program is free software: you can redistribute it and/or modify
it under the terms of the GNU General Public License as published by
the Free Software Foundation, either version 3 of the License, or
(at your option) any later version.

This program is distributed in the hope that it will be useful,
but WITHOUT ANY WARRANTY; without even the implied warranty of
MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
GNU General Public License for more details.
You should have received a copy of the GNU General Public License
along with this program.  If not, see <http://www.gnu.org/licenses/>.
]]

-- Where do you want the menu to appear?
local conf = {
    x = "left", -- "left","right", center
    y = 0.36, -- Change to what you want (maximum value should be 0.65, otherwise you will have to change "playersPerPage")

    left = 0.13,
    right = 0.85, -- looks about right for the width used.
    center = 0.5
}

--[[
variables to keep track of stuff..
]]
local listOn = false -- whether the player has the list open
local scaleform = nil -- The scaleform id

local maxPlayers = 32 -- The maximum number of players for this server
local playersPerPage = 14 -- The number of players to put onto a "page", max 14

local currentPage = 0 -- The current "page" the player has open
local maxPages = 1 -- The maximum number of pages needed to show all the players

--[[
static var HUD_COLOUR_PURE_WHITE = 0;
static var HUD_COLOUR_WHITE = 1;
static var HUD_COLOUR_BLACK = 2;
static var HUD_COLOUR_GREY = 3;
static var HUD_COLOUR_GREYLIGHT = 4;
static var HUD_COLOUR_GREYDARK = 5;
static var HUD_COLOUR_RED = 6;
static var HUD_COLOUR_REDLIGHT = 7;
static var HUD_COLOUR_REDDARK = 8;
static var HUD_COLOUR_BLUE = 9;
static var HUD_COLOUR_BLUELIGHT = 10;
static var HUD_COLOUR_BLUEDARK = 11;
static var HUD_COLOUR_YELLOW = 12;
static var HUD_COLOUR_YELLOWLIGHT = 13;
static var HUD_COLOUR_YELLOWDARK = 14;
static var HUD_COLOUR_ORANGE = 15;
static var HUD_COLOUR_ORANGELIGHT = 16;
static var HUD_COLOUR_ORANGEDARK = 17;
static var HUD_COLOUR_GREEN = 18;
static var HUD_COLOUR_GREENLIGHT = 19;
static var HUD_COLOUR_GREENDARK = 20;
static var HUD_COLOUR_PURPLE = 21;
static var HUD_COLOUR_PURPLELIGHT = 22;
static var HUD_COLOUR_PURPLEDARK = 23;
static var HUD_COLOUR_PINK = 24;
]]
local darkColours = {2, 5, 8, 11, 20, 23} -- These colours are too dark to see, feel free to remove/add some if you want

--[[
	Main thread. Checks for control presses and does stuff accordingly
]]
Citizen.CreateThread(function()
    while true do
        Citizen.Wait(0)

        -- When the player presses the INPUT_PHONE control (default up arrow) then, display the list.
        if IsControlPressed(0,243) --[[ INPUT_PHONE ]] then
            if not listOn then

                listOn = true
                -- Reset page to 0 when they re-open the list
                currentPage = 0

                -- Gets a new scaleform id and, generate the player list
                initScaleform()

                -- Play the "back" sound (it sounds like the other sounds that are played when in-game menus are opened)
                PlaySoundFrontend(PlayerId(), "BACK", "HUD_FRONTEND_DEFAULT_SOUNDSET", true )

                -- Whilst they have the list open
                while listOn do
                    Wait(0)

                    -- Draw the List
                    draw()

                    -- If they press INPUT_PHONE_RIGHT or INPUT_PHONE_LEFT, change the page the player is looking at
                    if(IsControlJustPressed(0,175))--[[ INPUT_PHONE_RIGHT ]] then
                        currentPage = (currentPage + 1) % maxPages

                        -- re-generate the player list
                        initScaleform()

                        -- Play a nice sound :)
                        PlaySoundFrontend(PlayerId(), "NAV_LEFT_RIGHT", "HUD_FRONTEND_DEFAULT_SOUNDSET", true)

                    elseif IsControlJustPressed(0,174) --[[ INPUT_PHONE_LEFT ]] then
                        currentPage = (currentPage - 1) % maxPages

                        initScaleform()

                        PlaySoundFrontend(PlayerId(), "NAV_LEFT_RIGHT", "HUD_FRONTEND_DEFAULT_SOUNDSET", true)

                    end

                    -- If they've let go of INPUT_PHONE, close the list
                    if(IsControlPressed(0, 27) == false) then
                        listOn = false
                        break
                    end
                end
            end
        end
    end
end)


--[[
	Checks if the value is in the table

	@param val The value to check exists
	@param tbl The table to check
]]
function valueIsIn(val, tbl)
    for _,v in ipairs(tbl) do
        if v == val then
            return true
        end
    end

    return false
end

--[[
	Gets a colour from the supplied string.

	Basically, this uses the jenkins hash function to generate a hash then,
		this is then modulo 24 to make sure it's a valid "HudColor"

	@param name The name of the player to get the colour for

	@return number A number representing the "HudColour"
]]
function getColourForName( name )
    local currentTotal = 0

    -- Jenkins hash function
    for i=1,string.len(name) do
        currentTotal = (currentTotal + string.byte(name, i))
        currentTotal = currentTotal + (currentTotal << 10)
        currentTotal = currentTotal + (currentTotal ~ 6)
    end

    currentTotal = currentTotal + (currentTotal << 3)
    currentTotal = currentTotal ~ (currentTotal >> 11)
    currentTotal = currentTotal + (currentTotal << 15)

    -- Make sure it's between 0 and 24
    currentTotal = currentTotal % 24

    -- If it's a dark colour that can't be seen, just multiply it and try again
    while valueIsIn(currentTotal, darkColours) do
        currentTotal = (currentTotal * 5) % 24
    end

    Citizen.Trace(name .. " = " .. currentTotal)

    return currentTotal
end

--[[
	Gets a table with all the online players

	@return table A table with the (local) ID of all online players
]]
function getPlayers()
    local players = {}
    -- Indecies start at 0 here because of c. So, the "normal" for loop is needed :)
    for i=0,maxPlayers-1 do
        if NetworkIsPlayerActive(i) then
            table.insert(players, i)
        end
    end

    return players
end

--[[
	Initialises the scaleform ready to be used in draw() and generatePage()

	If a scaleform already exists, it sets it as no longer needed.
	It then creates a neww "mp_online_list_card" scaleform and generates the page the user is on.
]]
function initScaleform()

    if scaleform ~= nil then
        SetScaleformMovieAsNoLongerNeeded(scaleform)
        Citizen.Wait(0)
    end

    scaleform = RequestScaleformMovie("mp_online_list_card")
    while not HasScaleformMovieLoaded(scaleform) do
        Citizen.Wait(0)
    end

    -- Generate the page data
    generatePage()

end

--[[
	Generates a "page" of the list
]]
function generatePage()
    -- Get all the online players
    local onlinePlayers = getPlayers()

    --Citizen.Trace("OnlinePlayers: " .. #onlinePlayers)

    -- Get the number of pages we're going to need to display all the players
    maxPages = math.ceil(#onlinePlayers / playersPerPage)

    -- Offest our start position based on the current page opened (page 1 will display the first 14 players)
    local startIndex = (currentPage * playersPerPage) +1 -- Indecies start at 1 :(
    local endIndex = startIndex + playersPerPage

    --Citizen.Trace("Start index: ".. startIndex .. ", End = " .. endIndex)

    local pTable = {}
    -- Getting the players we want
    for k,v in ipairs(onlinePlayers) do
        if k >= startIndex and k < endIndex then
            -- Add them to the player table that is going to be displayed
            table.insert(pTable, v)
        end
    end

    --Citizen.Trace("Currennt Page: " .. currentPage)
    --Citizen.Trace("MaxPages: " .. maxPages)

    -- Add a "subtitle" to the menu
    PushScaleformMovieFunction(scaleform, "ADD_SLOT")

    PushScaleformMovieFunctionParameterInt(0) -- Index.. Needs to be uniqe?
    PushScaleformMovieFunctionParameterInt(0) -- MenuID... No fucking idea

    PushScaleformMovieFunctionParameterInt(0) -- uniqueID... Think it needs to be uniqe to "index"
    PushScaleformMovieFunctionParameterInt(0) -- type.. Something to do with colouring
    PushScaleformMovieFunctionParameterInt(0) -- initialIndex.. (has something to do with right text background?)
    PushScaleformMovieFunctionParameterInt(0) -- isSelectable (is selected).. Changes the colour of the text & background colour (0,1 = selectable, 2 = non-selectable)

    PushScaleformMovieFunctionParameterString("Player Name") -- The text to display, No HTML :(

    PushScaleformMovieFunctionParameterInt(0) -- Shows the rockstar icon
    PushScaleformMovieFunctionParameterInt(0) -- Shows mission icons (e.g. race flag)

    -- The next argument is the right text
    PushScaleformMovieFunctionParameterString("Server ID")
    PopScaleformMovieFunctionVoid()

    -- Add our players to the list :)
    for _,i in ipairs(pTable) do

        PushScaleformMovieFunction(scaleform, "ADD_SLOT")

        PushScaleformMovieFunctionParameterInt(i+1) -- index
        PushScaleformMovieFunctionParameterInt(1) -- menuId

        PushScaleformMovieFunctionParameterInt(i) -- uniqueID
        PushScaleformMovieFunctionParameterInt(2) -- type
        PushScaleformMovieFunctionParameterInt(0) -- initialIndex
        PushScaleformMovieFunctionParameterInt(0) -- isSelectable

        local name = GetPlayerName(i)
        local id = GetPlayerServerId(i)
        --Citizen.Trace("Name(" .. i .. "): " .. GetPlayerName(i))
        -- If for some reason, their name is invalid..
        if name == "**Invalid**" then
            name = "Player_" .. i
            id = i
        end

        PushScaleformMovieFunctionParameterString(name) -- leftText

        PushScaleformMovieFunctionParameterInt(0) -- r* icon
        PushScaleformMovieFunctionParameterInt(0) -- missionIcon

        PushScaleformMovieFunctionParameterString( id ) -- rightText

        -- Since we set "type" to 2, we need to pass the colour of the text as well..
        PushScaleformMovieFunctionParameterInt(getColourForName(name))

        PushScaleformMovieFunctionParameterBool(false) -- Not actually set
        PushScaleformMovieFunctionParameterBool(false) -- Not actually set

        PushScaleformMovieFunctionParameterBool(true) -- Border


        PopScaleformMovieFunctionVoid()
    end
end

--[[
	Draws the scaleform to screen
	Must be called every frame
]]
function draw()
    -- Make sure the title is up-to-date
    PushScaleformMovieFunction(scaleform, "SET_TITLE")
    -- Since current page is 0 to (maxPages -1), we need to add one to make it look right
    PushScaleformMovieFunctionParameterString("Online Players: Page " .. (currentPage+1) .. "/" .. maxPages)
    PopScaleformMovieFunctionVoid()

    local x, y = conf.x, conf.y

    if type(x) == "string" then
        x = conf[x]
    end
    if type(y) == "string" then
        y = conf[y]
    end

    -- Draw in the top right corner of the screen
    DrawScaleformMovie(scaleform, x, y, 0.25, 0.7, 255, 255, 255, 255)
end
