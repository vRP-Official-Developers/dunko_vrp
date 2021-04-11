exports.runcmd = (fivemexports, client, message, params) => {
    if (message.mentions.members.first()) {
        let user = message.mentions.members.first()
        fivemexports.ghmattimysql.execute("SELECT * FROM `vrp_user_ids` WHERE identifier = ?", ["discord:" + user.id], (result) => {
            if (result.length > 0) {
                let embed = {
                    "title": "Discord to Perm ID!",
                    "description": `\nThe PermID for this user is: ${result[0].user_id}`,
                    "color": 5301186,
                    "footer": {
                        "text": "vRP • Made by JamesUK#6793"
                    },
                    "timestamp": new Date()
                }
                message.channel.send({ embed })
            } else {
                message.reply('No account is linked for this user.')
            }
        });
    } else {
        message.reply('You need to mention someone!')
    }
}

exports.conf = {
    name: "d2p",
    perm: 1
}