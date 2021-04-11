exports.runcmd = (fivemexports, client, message, params) => {
    if (!params[0]) {
        return message.reply('Invalid args! Correct term is: ' + process.env.PREFIX + 'groups [permid]')
    }
    fivemexports.ghmattimysql.execute("SELECT * FROM `vrp_user_data` WHERE user_id = ?", [params[0]], (result) => {
        if (result.length > 0) {
            let embed = {
                "title": "Fetched User Groups",
                "description": `\n\nSuccess! Fetched Groups For UserId ${params[0]}\n\n` + "```" + JSON.stringify(JSON.parse(result[0].dvalue).groups) + "```",
                "color": 5301186,
                "footer": {
                    "text": "vRP • Made by JamesUK#6793"
                },
                "timestamp": new Date()
            }
            message.channel.send({ embed })
        } else {
            message.reply('No groups for this user.')
        }
    });
}

exports.conf = {
    name: "groups",
    perm: 2
}