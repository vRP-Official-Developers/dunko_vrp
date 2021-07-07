exports.runcmd = (fivemexports, client, message, params) => {
    if (!params[0] || !parseInt(params[0]) || !params[1]) {
        return message.reply('Invalid args! Correct term is: ' + process.env.PREFIX + 'addcar [permid] [spawn code]')
    }
    fivemexports.ghmattimysql.execute("INSERT INTO vrp_user_vehicles (user_id, vehicle) VALUES(?, ?)", [params[0], params[1]], (result) => {
        if (result) {
            let embed = {
                "title": "Added Car",
                "description": `\nSuccess! Added Car ID: ${params[0]} SpawnCode: ${params[1]}`,
                "color": 5301186,
                "footer": {
                    "text": "vRP • Made by JamesUK#6793"
                },
                "timestamp": new Date()
            }
            message.channel.send({ embed })
        } else {
            let embed = {
                "title": "Added Car",
                "description": `\nFailed! This car for UserID: ${params[0]} SpawnCode: ${params[1]} already exists`,
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
    name: "addcar",
    perm: 3
}