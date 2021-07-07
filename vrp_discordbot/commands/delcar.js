exports.runcmd = (fivemexports, client, message, params) => {
    if (!params[0] || !parseInt(params[0]) || !params[1]) {
        return message.reply('Invalid args! Correct term is: ' + process.env.PREFIX + 'delcar [permid] [spawn code]')
    }
    fivemexports.ghmattimysql.execute("DELETE FROM vrp_user_vehicles WHERE user_id = ? AND vehicle = ?", [params[0], params[1]], (result) => {
        if (result) {
            let embed = {
                "title": "Remove Car",
                "description": `\nSuccess! Removed Car ID: ${params[0]} SpawnCode: ${params[1]}`,
                "color": 5301186,
                "footer": {
                    "text": "vRP • Made by JamesUK#6793"
                },
                "timestamp": new Date()
            }
            message.channel.send({ embed })
        } else {
            let embed = {
                "title": "Remove Car",
                "description": `\nFailed! This car for UserID: ${params[0]} SpawnCode: ${params[1]} already is gone!`,
                "color": 5301186,
                "footer": {
                    "text": "vRP • Made by JamesUK#6793"
                },
                "timestamp": new Date()
            }
            message.channel.send({ embed })
        }
    })
}

exports.conf = {
    name: "removecar",
    perm: 3
}