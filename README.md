# Dunko vRP

Welcome to Dunko vRP.

Current: V6.6

# Donate/Patreon

PayPal: https://www.paypal.com/cgi-bin/webscr?cmd=_s-xclick&hosted_button_id=APB93LKHVULFS

Patreon: https://www.patreon.com/dunko

# Discord

If you need help, head over to my Discord:  https://discord.gg/kAfBuJG

# Installation

**GET A SERVER THROUGH ZAP HOSTING WITH 10% DISCOUNT CODE: ***Dunko*** --- Click the banner below! They offer a 1 click install of my pack, no messing about with databases or manually installing the files, 1 click and you're ready to go!**

<a href='https://zap-hosting.com/dunko'><img src="https://i.imgur.com/F8U53VC.jpg"></a></img>

**GET A SERVER THROUGH ZAP HOSTING WITH 10% DISCOUNT CODE: ***Dunko*** --- Click the banner above! They offer a 1 click install of my pack, no messing about with databases or manually installing the files, 1 click and you're ready to go!**

1) Copy the folders inside MASTER to your FXServer/Resources folder. DO NOT COPY THE MASTER FOLDER ITSELF.

2) Copy server.cfg & Start_Server.cmd to your main FXServer folder.

3) Go to vrp/cfg/base.lua and enter your database details

4) (Optional) Whilst in vrp/cfg/base.lua go to line 25 and change "en" to your language

5) (Optional) Go to vrp_basic_mission/cfg/missions.lua line 4 change "en" to your language

6) Go to server.cfg and enter your database details.

7) Whilst in server.cfg go to line 118 and set your server name, make sure it’s inside the quotations.

8) Whilst in server.cfg go to line 148 and enter your server key, you can get one from here.

9) Open Start_Server.cmd with Notepad++ and put in the directory you have your server in.

# My Server

Name: Dunko vRP V6.6 - Preview/Test Server - discord.gg/kAfBuJG - Sponsored by Zap-Hosting.com

Direct Connect: 134.255.216.169:30120

# What's new

# V6.6

- Added Finnish translation - Thanks @Baavoz
- Added vrp_barrier cop/ems permissions
- Added Chinese translation
- Added vrp_chopshop
- Added Trash Collection job - server owners need to add their own trash locations in vrp/cfg/item_transformers.lua
- Added Judge role - this is an admin selected role only
- Added Forger job
- Added K9 script (Left ALT + Z to open menu) - Credit xander1998
- Added death spawn location, change in cfg/player_state.lua - Thanks @OriginalGamers
- Added more EMS roles, similar to the way PD is ran - Thanks @OriginalGamers
- Added driving licence as a seizable item for Police
- Added Police mission
- Added EMS mission
- Added vrp_ubermission - Press DEL to start
- Added ability to walk whilst hands are up - Thanks @Sil3nx
- Added warmenu
- Added vrp_dvcar - Thanks @.P4NDAzz
- Added vrp_carfix - Thanks @.P4NDAzz
- Added more houses/garages up north - Thanks @Baker
- Added mission translations - Thanks to @Yeeellow (Ger), @GamerRO (Ro), @Leo SHK (Pt), @ThaNightHawk (Dan), @[31-4690] Emil Holmstedt (Swe), @Lysy (Pl), @ZORK (Ar), @AlfieThePuggle (Es), @Naifen_Luna (Ru, Fr & It)
- Added Extras 1 and 2 to the clothes shop - this is for belts to change (i.e. cops) - Thanks @D. Owens
- Added modified version of vrp_hotkeys - Thanks @jackazzking69
- Added F1 = Open Admin Menu (WIP) - This will show empty to those who don't have admin perms
- Added F2 = Opens Police Menu (WIP) - This will show empty to those who don't have police perms
- Added Drag / Cuff / Fine / Jail / Spikes to F2 menu for quick access
- Added Blips permission to cops/ems (F1 > Blips) - this will show all users on your minimap
- Changed Credit Cards to Stolen Credit Cards - this is to avoid people trying to say the cards are thiers
- Changed the style menu, reverted from the tron style and made it look better
- Changed the menu to be inside a phone - Thanks @.P4NDAzz
- Changed lock car hotkey to F3
- Changed it now allow menu use whilst in a coma due to the fact you can now call an ambulance/revive without it
- Set correct paycheck amount in groups
- Set correct death notification as you can now revive by pressing E if no EMS are online
- Fixed max length issue with some MySQL setups - this should stop @registration errors
- Fixed map blips for jobs, Drug Dealer etc
- Fixed Cargo Pilot job - you can now collect Cargo
- Fixed Plane & Helicopter garages (for Cargo/Airline pilot) map blips
- Fixed gathering, it should no longer ever be empty
- Disabled FiveM userlist
- Disabled Santa job
- Disabled Admin God Mode due to bugs
- Updated the mission texts for all jobs which have them, it now tells them exactly what to do and how
- Updated F5 & F6 keys to Num+ and Num- so they work in police cars - Thanks @OriginalGamers
- Updated Advanced Fuel and enabled petrol cans, it also no longer uses cents - Thanks @OriginalGamers
- Updated the installation instructions on how to change mission text language
- Modified Luxvehcontrol so backspace and UP don't interfere with menus - Thanks @OriginalGamers

- Hot Keys Added: - Change keys via vrp/client/hotkeys.lua or vrp_hotkeys
- F1 = Open Admin Menu (WIP*)
- F2 = Open Police Menu (WIP*)
- F3 = Lock/Unlock Car
- HOME = Show User List
- LEFT ALT + Z = Open K9 Menu

* WIP = Work in Progress

# V6.5

- Changed Menu Layout - Thanks @Levy
- Added lock car back, press U to lock/unlock your car
- Fixed Ammo "Money Glitch"
- Fixed Driving Licence & Medical Weed blips
- General improvements (this covers things I've added and forgot to list :P)
- Removed Trucker Job
- Added Santa mission
- Added Santa cloakroom & vehicle
- Added Santa job role - This is admin only and has to be given by adding the role "Santa"
- Added further mission translation
- Added vrp_truckerjob - Thanks @D.Shukla
- Added Cargo Pilot job & mission - Thanks @Levy
- Added Airline Pilot job - Thanks @Levy
- Added Mouse for the menu - Thanks @Derps
- Added additional blips for Cargo, Nite Club, Bank Driver, Club, Beach Bar & Blue Airlines
- Added vrp_slotmachine - Thanks @@c 0 d e i n a#2243
- Added Hacker & lawyer job blips
- Added vrp_barrier - Thanks @Shadow
- Added BrockALPR (numpad 5 to activate) - Credit @Brock70
- Added Realistic Vehicle Failure (last minute addition, needs further testing) - Credit @jens_s
- Temp removed Thirst & Hunger, trying to revamp this

# V6.2
- Updated core code
This will hopefully stop people getting the "Identification Error" whist the server has been up for a while, as well as many more things including database calls. It also adds a phone fuction back into the game
- Fixed vrp_basic_mission
- Added more admin menu features from vrp_basic_menu
- Added Pay by Phone from the vrp_basic_menu
- Added Polish, Spanish & Arabic translations

# V6.1
- Removed vrp_lscustoms untill it's fixed
- Removed mugging due to people being people I suppose, took the fun out of the game
- Removed freeze
- Updated vrp_mysql
- Added two missing folder [managers] and [system]
- Added standard lscustoms
- Fixed basic_garage.lua's in both client & modules
- Updated server.cfg


# V6
- Updated server.cfg to have everything you need in it.
- Added three additional languages, Russian, Danish & Lithuanian (8 in total) - set this is vrp/cfg/base.lua
- Added Fishing job - Thanks @Velns 
- Added Fishing mission
- Added Weapons Smuggler job
- Added Weapons Smuggler mission
- Added bank robberies to require at least 2 cops on
- Added Medical Delivery Driver job
- Added Medical Delivery Driver mission
- Added Cocaine & LSD locations to the Informer
- Added "blips" as a resource, including Fishing Spot, Stolen Weapons, Medical Weed & Drug Lab
- Added Ammunation in Paleto Bay
- Added "Unemployed" to the police job selector
- Added Police job selectors in Paleto & Sandy Shores
- Added player names above head (playernames in [gameplay] and vrp_playernames)
- Added Drag via Police Menu
- Added Freeze via Police Menu
- Added Spike strip via Police Menu
- Added Easy Cuff - Removed Handcuff
- Added Easy Fine - Removed Fine
- Added Easy Jail & Easy Un-Jail (put players inside a cell at ALTA PD)
- Added Luxart Vehicle Control (Q, E, R, LEFT ALT)
- Changed Chief of Police to Admin > Add Group only
- Changed item transformers to have a maximum of 100k, this will stop the issue relating to things showing "empty" i.e. drugs
- Fixed drivers licence location
- Fixed Chamber of Commerece location
- Fixed "Loot" being spammable (re: basic mission)
- Fixed police.lua (modules) so that the basic_menu will work
- Updated vrp_basic_mission - Credit @Sighmir 
- Removed EssentialMode as it's no longer needed
- Removed "names-client.lua" from CustomScripts __resource.lua
- Removed vrp_court as it's no longer needed