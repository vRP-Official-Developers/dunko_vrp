exports.runcmd = (fivemexports, client, message, params) => {
    if (!params[0]) {
        return message.reply('Invalid args! Correct term is: ' + process.env.PREFIX + 'hmc [spawn code]')
    }
    fivemexports.ghmattimysql.execute("SELECT * FROM vrp_user_vehicles WHERE vehicle = ?", [params[0].toLowerCase()], (result) => {
        if (result) {
            let embed = {
                "title": "Car Count",
                "description": `\nSuccess! There are: ${result.length} ${params[0]}'s in the city.`,
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
    name: "hmc",
    perm: 0
}