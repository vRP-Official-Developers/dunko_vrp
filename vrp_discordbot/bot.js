const Discord = require('discord.js');
const client = new Discord.Client();
const path = require('path')
const resourcePath = global.GetResourcePath ?
    global.GetResourcePath(global.GetCurrentResourceName()) : global.__dirname
require('dotenv').config({ path: path.join(resourcePath, './.env') })
const fs = require('fs');
const settingsjson = require(resourcePath + '/settings.js')

client.path = resourcePath
client.ip = settingsjson.settings.ip
client.on('ready', () => {
    console.log(`[^1JamesUK Discord Bot^7]: Logged in as ${client.user.tag}! Players: ${GetNumPlayerIndices()}`);
    init()
});

let bank = 0
let wallet = 0
let userids = 0
exports.ghmattimysql.execute("SELECT * FROM vrp_user_moneys", [], (result) => {
    for (i = 0; i < result.length; i++) {
        bank = parseInt(bank) + parseInt(result[0].bank)
    }
    for (i = 0; i < result.length; i++) {
        wallet = parseInt(wallet) + parseInt(result[0].wallet)
    }
    userids = result.length
})
setInterval(() => {
    exports.ghmattimysql.execute("SELECT * FROM vrp_user_moneys", [], (result) => {
        for (i = 0; i < result.length; i++) {
            bank = parseInt(bank) + parseInt(result[0].bank)
        }
        for (i = 0; i < result.length; i++) {
            wallet = parseInt(wallet) + parseInt(result[0].wallet)
        }
        userids = result.length
    })
}, 60000);

if (settingsjson.settings.StatusEnabled) {
    setInterval(() => {
        if (!client.guilds.get(settingsjson.settings.GuildID)) return console.log(`[^1JamesUK Discord Bot^7]: Status is enabled but not configured correctly and will not work as intended.`)
        let channelid = client.guilds.get(settingsjson.settings.GuildID).channels.find(r => r.name === settingsjson.settings.StatusChannel);
        if (!channelid) return console.log(`[^1JamesUK Discord Bot^7]: Status channel is not available / cannot be found.`)
        let settingsjsons = require(resourcePath + '/params.json')
        let totalSeconds = (client.uptime / 1000);
        totalSeconds %= 86400;
        let hours = Math.floor(totalSeconds / 3600);
        totalSeconds %= 3600;
        let minutes = Math.floor(totalSeconds / 60);
        channelid.fetchMessage(settingsjsons.messageid).then(msg => {
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
                        "value": `${userids} users has joined since release`,
                        "inline": true
                    }
                ],
                "description": `Connect to the server with: ${client.ip}`,
                "title": "Server Status"
            }
            msg.edit({ embed: status })
        }).catch(err => {
            channelid.send('Status Page JamesUK#6793 Starting..').then(id => {
                settingsjsons.messageid = id.id
                fs.writeFile(`${resourcePath}/params.json`, JSON.stringify(settingsjsons), function(err) {});
                return
            })
        })
    }, 15000);
}



/*
    WAIT BEFORE YOU REMOVE THE CREDITS THINK ABOUT ALL THE HARDWORK THAT HAS GONE INTO THIS! 

    DEVELOPERS EVERY DAY HAVE THEIR WORK STOLEN OR CLAIMED BY OTHERS.

    IT'S TIME FOR CHANGE. PEOPLE WILL JUST STOP RELEASING THINGS IF YOU STEAL THEIR WORK. 

    - JamesUK#6793

*/


client.commands = new Discord.Collection();

const init = async() => {
    fs.readdir(resourcePath + '/commands/', (err, files) => {
        if (err) console.error(err);
        console.log(`[^1JamesUK Discord Bot^7]: Loading a total of ${files.length} commands.`);
        files.forEach(f => {
            let command = require(`${resourcePath}/commands/${f}`);
            client.commands.set(command.conf.name, command);
        });
    });
}

client.getPerms = function(msg) {

    let settings = settingsjson.settings
    let lvl1 = msg.guild.roles.find(r => r.name === settings.Level1Perm);
    let lvl2 = msg.guild.roles.find(r => r.name === settings.Level2Perm);
    let lvl3 = msg.guild.roles.find(r => r.name === settings.Level3Perm);
    if (!lvl1 || !lvl2 || !lvl3) {
        console.log(`[^1JamesUK Discord Bot^7]: Your permissions are not setup correctly and the bot will not function as intended.\nStatus: Level 1 Perm is: ${lvl1}, Level 2 Perm is: ${lvl2}, Level 3 Perm is ${lvl3}`)
    }

    // hot fix for Discord role caching 
    const guild = client.guilds.get(msg.guild.id);
    if (guild.members.has(msg.author.id)) {
        guild.members.delete(msg.author.id);
    }
    const member = guild.members.get(msg.author.id);
    // hot fix for Discord role caching 

    let level = 0;
    if (msg.member.roles.has(lvl1.id)) {
        level = 1;
    } else if (msg.member.roles.has(lvl2.id)) {
        level = 2;
    } else if (msg.member.roles.has(lvl3.id)) {
        level = 3;
    }
    return level
}

client.on('message', (message) => {
    let client = message.client;
    if (message.author.bot) return;
    if (!message.content.startsWith(process.env.PREFIX)) return;
    let command = message.content.split(' ')[0].slice(process.env.PREFIX.length);
    let params = message.content.split(' ').slice(1);
    let cmd;
    let permissions = client.getPerms(message)
    if (client.commands.has(command)) {
        cmd = client.commands.get(command);
    }
    if (cmd) {
        if (permissions < cmd.conf.perm) return;
        try {
            cmd.runcmd(exports, client, message, params, permissions);
        } catch (err) {
            let embed = {
                "title": "Error Occured!",
                "description": "\nAn error occured. Contact JamesUK#6793 in vRP with the code:\n\n```" + err.message + "\n```",
                "color": 13632027
            }
            message.channel.send({ embed })
        }
    }
});

client.login(process.env.TOKEN)