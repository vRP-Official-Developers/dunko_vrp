const Discord = require('discord.js');
const { Client, Collection, Events, GatewayIntentBits, MessageFlags, ApplicationCommandOptionType } = Discord;
const client = new Client({
    intents: [GatewayIntentBits.Guilds]
});
const path = require('path')
const resourcePath = global.GetResourcePath ?
    global.GetResourcePath(global.GetCurrentResourceName()) : __dirname
const env = require('dotenv').config({ path: path.join(resourcePath, './.env') })
const fs = require('fs');
const settingsjson = require(resourcePath + '/settings.js')
const paramsPath = path.join(resourcePath, 'params.json')
const token = String((env.parsed && env.parsed.TOKEN) || process.env.TOKEN || "").trim()
client.path = resourcePath
client.ip = settingsjson.settings.ip
client.commands = new Collection();
client.query = (sql, params) => new Promise(resolve => exports.ghmattimysql.execute(sql, params || [], resolve))

client.once(Events.ClientReady, async() => {
    console.log(`[^1JamesUK Discord Bot^7]: Logged in as ${client.user.tag}! Players: ${GetNumPlayerIndices()}`);
    try {
        loadCommands()
        await registerCommands()
    } catch (err) {
        console.log(`[^1JamesUK Discord Bot^7]: Error! Failed to load the slash commands: ${err.message}`)
    }
    if (settingsjson.settings.StatusEnabled) startStatus()
});

client.on(Events.Error, (err) => {
    console.log(`[^1JamesUK Discord Bot^7]: Discord client error: ${err.message}`)
});

let bank = 0
let wallet = 0
let userids = 0
let statusRunning = false

const refreshEconomy = () => client.query("SELECT COALESCE(SUM(bank),0) AS bank, COALESCE(SUM(wallet),0) AS wallet, COUNT(*) AS users FROM vrp_user_moneys", []).then((result) => {
    if (!result || !result[0]) return console.log(`[^1JamesUK Discord Bot^7]: Could not load the economy totals for the status page.`)
    bank = result[0].bank
    wallet = result[0].wallet
    userids = result[0].users
}).catch(err => console.log(`[^1JamesUK Discord Bot^7]: Could not load the economy totals for the status page: ${err.message}`))

const readParams = () => {
    try {
        return JSON.parse(fs.readFileSync(paramsPath, 'utf8')) || {}
    } catch (err) {
        return {}
    }
}

const findChannel = (guild, value) => {
    let channel = guild.channels.cache.get(String(value)) || guild.channels.cache.find(c => c.name === value && c.isTextBased())
    return channel && channel.isTextBased() ? channel : undefined
}

const updateStatus = async() => {
    let guild = client.guilds.cache.get(settingsjson.settings.GuildID)
    if (!guild) return console.log(`[^1JamesUK Discord Bot^7]: Status is enabled but not configured correctly and will not work as intended.`)
    let channel = findChannel(guild, settingsjson.settings.StatusChannel)
    if (!channel) return console.log(`[^1JamesUK Discord Bot^7]: Status channel is not available / cannot be found.`)
    let params = readParams()
    let totalSeconds = Math.floor(client.uptime / 1000);
    let hours = Math.floor(totalSeconds / 3600);
    let minutes = Math.floor((totalSeconds % 3600) / 60);
    let status = {
        "color": 4289797,
        "fields": [{
                "name": "Players",
                "value": `${GetNumPlayerIndices()}/${GetConvarInt("sv_maxclients",32)}`,
                "inline": true
            },
            {
                "name": "Amount of £ in economy (bank)",
                "value": `${bank}`,
                "inline": true
            },
            {
                "name": "Amount of £ in economy (wallet)",
                "value": `${wallet}`,
                "inline": true
            },
            {
                "name": "Uptime",
                "value": `${hours} hours, ${minutes} minutes`,
                "inline": true
            },
            {
                "name": "All Time Users",
                "value": `${userids} users have joined since release`,
                "inline": true
            }
        ],
        "description": `Connect to the server with: ${client.ip}`,
        "title": "Server Status"
    }
    let msg = params.messageid ? await channel.messages.fetch(String(params.messageid)).catch(() => undefined) : undefined
    if (msg && msg.author.id === client.user.id) {
        await msg.edit({ embeds: [status] })
        return
    }
    let sent = await channel.send({ content: 'Status Page JamesUK#6793 Starting..', embeds: [status] })
    params.messageid = sent.id
    fs.writeFile(paramsPath, JSON.stringify(params), (err) => {
        if (err) console.log(`[^1JamesUK Discord Bot^7]: Could not save the status message ID to params.json: ${err.message}`)
    });
}

const startStatus = () => {
    refreshEconomy()
    setInterval(refreshEconomy, 60000);
    setInterval(() => {
        if (statusRunning) return
        statusRunning = true
        updateStatus().catch(err => console.log(`[^1JamesUK Discord Bot^7]: Could not update the status page: ${err.message}`)).finally(() => {
            statusRunning = false
        })
    }, 15000);
}

/*
    WAIT BEFORE YOU REMOVE THE CREDITS THINK ABOUT ALL THE HARDWORK THAT HAS GONE INTO THIS! 

    DEVELOPERS EVERY DAY HAVE THEIR WORK STOLEN OR CLAIMED BY OTHERS.

    IT'S TIME FOR CHANGE. PEOPLE WILL JUST STOP RELEASING THINGS IF YOU STEAL THEIR WORK. 

    - JamesUK#6793

*/

const loadCommands = () => {
    let commandsPath = path.join(resourcePath, 'commands')
    let files = fs.readdirSync(commandsPath).filter(f => f.endsWith('.js'))
    console.log(`[^1JamesUK Discord Bot^7]: Loading a total of ${files.length} commands.`);
    files.forEach(f => {
        let command = require(path.join(commandsPath, f));
        if (!command.data || !command.conf || typeof command.conf.perm !== 'number' || typeof command.execute !== 'function') {
            return console.log(`[^1JamesUK Discord Bot^7]: Skipped ${f} as it is not a valid slash command.`)
        }
        client.commands.set(command.data.name, command);
    });
}

const registerCommands = async() => {
    let guild = client.guilds.cache.get(settingsjson.settings.GuildID)
    if (!guild) {
        return console.log(`[^1JamesUK Discord Bot^7]: Error! The bot is not in the Discord server with GuildID ${settingsjson.settings.GuildID}. Check GuildID in settings.js and invite the bot with the bot and applications.commands scopes, then restart the resource.`)
    }
    try {
        let registered = await guild.commands.set(client.commands.map(command => command.data.toJSON()))
        console.log(`[^1JamesUK Discord Bot^7]: Registered ${registered.size} slash commands in ${guild.name}.`)
    } catch (err) {
        console.log(`[^1JamesUK Discord Bot^7]: Error! Could not register the slash commands in ${guild.name}: ${err.message}. Make sure the bot was invited with the bot and applications.commands scopes.`)
    }
}

client.getPerms = function(interaction) {

    let settings = settingsjson.settings
    let guild = interaction.guild
    let member = interaction.member
    if (!guild || guild.id !== settings.GuildID || !member || !member.roles || !member.roles.cache) return 0
    let findRole = (value) => {
        if (!value) return undefined
        let role = guild.roles.cache.get(String(value))
        if (role) return role
        let matches = guild.roles.cache.filter(r => r.name === value)
        return matches.size === 1 ? matches.first() : undefined
    }
    let lvl1 = findRole(settings.Level1Perm);
    let lvl2 = findRole(settings.Level2Perm);
    let lvl3 = findRole(settings.Level3Perm);
    if (!lvl1 || !lvl2 || !lvl3) {
        console.log(`[^1JamesUK Discord Bot^7]: Your permissions are not setup correctly and the bot will not function as intended.\nStatus: Level 1 Perm is: ${lvl1 ? lvl1.name : lvl1}, Level 2 Perm is: ${lvl2 ? lvl2.name : lvl2}, Level 3 Perm is ${lvl3 ? lvl3.name : lvl3}`)
    }

    let level = 0;
    if (lvl3 && member.roles.cache.has(lvl3.id)) {
        level = 3;
    } else if (lvl2 && member.roles.cache.has(lvl2.id)) {
        level = 2;
    } else if (lvl1 && member.roles.cache.has(lvl1.id)) {
        level = 1;
    }
    return level
}

const validOptions = (cmd, interaction) => {
    let specs = cmd.data.toJSON().options || []
    return interaction.options.data.every(option => {
        let spec = specs.find(s => s.name === option.name)
        if (!spec || spec.type !== option.type) return false
        if (spec.type === ApplicationCommandOptionType.Integer && !Number.isSafeInteger(option.value)) return false
        if (spec.min_value !== undefined && option.value < spec.min_value) return false
        if (spec.max_value !== undefined && option.value > spec.max_value) return false
        if (spec.max_length !== undefined && Array.from(String(option.value)).length > spec.max_length) return false
        return true
    })
}

client.on(Events.InteractionCreate, async(interaction) => {
    if (!interaction.isChatInputCommand()) return;
    if (interaction.guildId !== settingsjson.settings.GuildID) return;
    let cmd = client.commands.get(interaction.commandName);
    if (!cmd) return;
    let permissions = client.getPerms(interaction)
    if (permissions < cmd.conf.perm) {
        return interaction.reply({ content: "You do not have permission to use this command.", flags: MessageFlags.Ephemeral }).catch(err => console.log(`[^1JamesUK Discord Bot^7]: ${err.message}`));
    }
    if (!validOptions(cmd, interaction)) {
        return interaction.reply({ content: "Invalid arguments! Check the command options and try again.", flags: MessageFlags.Ephemeral }).catch(err => console.log(`[^1JamesUK Discord Bot^7]: ${err.message}`));
    }
    try {
        await interaction.deferReply();
        await cmd.execute(exports, client, interaction, permissions);
    } catch (err) {
        console.log(`[^1JamesUK Discord Bot^7]: Error running /${interaction.commandName}: ${err && err.stack ? err.stack : err}`);
        let embed = {
            "title": "Error Occured!",
            "description": "\nAn error occured while running this command. The details have been logged to the server console.",
            "color": 13632027
        }
        let reply = interaction.deferred || interaction.replied ?
            interaction.editReply({ content: "", embeds: [embed] }) :
            interaction.reply({ embeds: [embed], flags: MessageFlags.Ephemeral })
        await reply.catch(e => console.log(`[^1JamesUK Discord Bot^7]: ${e.message}`));
    }
});

if (!token || token === "TOKEN") {
    console.log(`[^1JamesUK Discord Bot^7]: Error! No bot token found. Copy .env.example to .env in ${resourcePath}, set TOKEN to your Discord bot token and restart the resource.`);
} else {
    client.login(token).catch(err => console.log(`[^1JamesUK Discord Bot^7]: Error! Could not log in to Discord: ${err.message}`));
}
