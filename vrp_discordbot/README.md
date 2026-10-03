# IMPORTANT NOTICE

Ensure you untick the "Public Bot" option when using the vRP Discord Bot to prevent unauthorised users controlling your server. (https://discord.com/developers/applications)

![Public Bot Discord unticking option screen](https://i.gyazo.com/699d4fd2ce3d8b922f2f1220954b3f1e.png)

# vRP Discord Bot

A Discord bot for vRP that runs inside your FiveM server as a resource. It uses Discord slash commands (discord.js v14), so there is no command prefix any more: type `/` in your Discord server to see the commands.

Made by JamesUK#6793. Give credit where credit is due!

## Requirements

- A recent FXServer artifact that supports `node_version '22'` in the resource manifest (discord.js v14 needs Node 18 or newer, the bot runs on FiveM's Node 22 runtime).
- The `yarn` system resource must be running (it is part of the default cfx-server-data resources). It installs the bot's packages automatically the first time the resource starts. If you can't use it, run `npm install` inside the `vrp_discordbot` folder yourself with Node 18 or newer.
- `vrp` and `ghmattimysql` must be started before `vrp_discordbot`.

## Setup

1. Go to https://discord.com/developers/applications, create an application and add a bot to it. Untick "Public Bot" (see the notice above).
2. Copy `.env.example` to `.env` in the `vrp_discordbot` folder and set `TOKEN` to your bot token:

   ```
   TOKEN=your-bot-token-here
   ```

   Never share your `.env` or commit it to git. If the token is missing the bot prints an error in the server console and does not log in.
3. Invite the bot to your Discord server with **both** the `bot` and `applications.commands` scopes. In the Developer Portal go to OAuth2 > URL Generator, tick `bot` and `applications.commands`, then open the generated link. Without `applications.commands` the slash commands can't be registered.
4. The bot does not need any privileged gateway intents. You do **not** need to turn on the Message Content, Server Members or Presence intents.
5. Edit `settings.js`:
   - `GuildID` (required): the ID of your Discord server. The bot only registers its commands in, and only responds to, this server. Turn on Developer Mode in Discord (User Settings > Advanced) and right click your server > Copy Server ID.
   - `Level1Perm`, `Level2Perm`, `Level3Perm`: the roles for each permission level (3 is the highest). Role IDs are recommended (right click a role > Copy Role ID). A role name also works, but only if exactly one role in your server has that name. If a member has more than one of these roles, the highest level wins.
   - `StatusEnabled` and `StatusChannel`: turns the live status message on or off, and the channel it is posted in (channel ID or channel name). The bot needs permission to view the channel, send messages, embed links and read message history there.
   - `ip`: the address players connect with, shown in `/status` and the status message.
6. Add `ensure vrp_discordbot` to your server.cfg after `vrp` and `ghmattimysql`, then restart the server. The console shows `Registered ... slash commands` once the bot is ready.

## Commands

Levels: 0 = everyone, 1 = `Level1Perm`, 2 = `Level2Perm`, 3 = `Level3Perm`. Higher levels can use every command below their level too.

| Command | Level | Description |
| --- | --- | --- |
| `/help` | 0 | List the bot's commands |
| `/status` | 0 | Show the player count and the server IP |
| `/top5` | 0 | Show the 5 richest players by bank balance |
| `/hmc spawncode` | 0 | Show how many of a car are owned in the city |
| `/warn permid reason` | 1 | Give a player an F10 warning |
| `/warnings permid` | 1 | Show a player's F10 warnings |
| `/userinfo permid` | 1 | Show a player's money and ban info |
| `/d2p user` | 1 | Find the PermID linked to a Discord user |
| `/p2d permid` | 1 | Find the Discord user linked to a PermID |
| `/ban permid hours [reason]` | 2 | Ban a player for a number of hours |
| `/unban permid` | 2 | Unban a player |
| `/kick permid reason` | 2 | Kick a player who is online |
| `/groups permid` | 2 | Show a player's groups |
| `/addcar permid spawncode` | 3 | Add a car to a player's garage |
| `/removecar permid spawncode` | 3 | Remove a car from a player's garage |
| `/addgroup permid group` | 3 | Add a group to a player |
| `/removegroup permid group` | 3 | Remove a group from a player |
| `/removewarning warningid` | 3 | Remove an F10 warning |

Commands can be run by anyone in the server, but the bot checks their roles and replies "You do not have permission to use this command." (only visible to them) if their level is too low. To also hide commands from members in the Discord menu, use Server Settings > Integrations > your bot.

`/addgroup` and `/removegroup` edit the player's saved data in the database, so use them while the player is offline. If the player is online, vRP overwrites the change the next time it saves their data.

## Updating from the old prefix version

- The `PREFIX` setting and the old `!command` messages are gone, use the slash commands instead.
- `.env` is no longer included in the repository (it is ignored by git so your token can't be committed), only `.env.example` is. Back up your `.env` before updating, then make sure `vrp_discordbot/.env` exists afterwards with your `TOKEN=` line. `PREFIX=` is no longer used and can be removed.
- Re-invite the bot with the `applications.commands` scope if you originally invited it with only the `bot` scope.
- Set `GuildID` and the three permission roles in `settings.js` if you haven't already.

Support at: https://discord.gg/E3JzgrNqNg
