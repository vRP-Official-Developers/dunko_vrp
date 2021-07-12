exports.runcmd = (fivemexports, client, message, params) => {
    let embed = {
        "title": "Discord Bot Commands",
        "description": `.addcar [permid] [spawncode]\n.addgroup [permid] [group name]\n.ban [permid] [time (hours)] [reason]\n.hmc [spawncode]\n.d2p [@user]\n.delcar [permid] [spawncode]\n.groups [permid]\n.kick [permid] [reason]/n.p2d [permid]\n.removegroup [permid] [group]\n.removewarning [warning-id]\n.status\n.top5\n.unban [permid]\n.userinfo [permid]\n.warn [permid] [reason]\n.warnings [permid]`,
        "color": 5301186,
        "footer": {
            "text": "vRP • Made by JamesUK#6793"
        },
        "timestamp": new Date()
    }
    message.channel.send({ embed })
}

exports.conf = {
    name: "help",
    perm: 0
}
