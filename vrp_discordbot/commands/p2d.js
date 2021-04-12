exports.runcmd = (fivemexports, client, message, params) => {
    if (params[0] && parseInt(params[0])) {
        fivemexports.ghmattimysql.execute("SELECT * FROM `vrp_user_ids` WHERE user_id = ?", [params[0]], (result) => {
            if (result.length > 0) {
                for (i = 0; i < result.length; i++) {
                    if (result[i].identifier.includes('discord')) {
                        let embed = {
                            "title": "Perm to Discord",
                            "description": `\nSuccess! PermID to Discord. This user is: <@${result[i].identifier.split(":")[1]}>`,
                            "color": 5301186,
                            "footer": {
                                "text": "vRP • Made by JamesUK#6793"
                            },
                            "timestamp": new Date()
                        }
                        message.channel.send({ embed })
                    }
                }
            } else {
                let embed = {
                    "title": "Perm to Discord",
                    "description": `\Failed! There is no Discord linked to this PermID!`,
                    "color": 5301186,
                    "footer": {
                        "text": "vRP • Made by JamesUK#6793"
                    },
                    "timestamp": new Date()
                }
                message.channel.send({ embed })
            }
        });
    } else {
        let embed = {
            "title": "Perm to Discord",
            "description": `\Failed! You need to enter a valid PermID!`,
            "color": 5301186,
            "footer": {
                "text": "vRP • Made by JamesUK#6793"
            },
            "timestamp": new Date()
        }
        message.channel.send({ embed })
    }
}

exports.conf = {
    name: "p2d",
    perm: 1
}