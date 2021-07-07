exports.runcmd = (fivemexports, client, message, params) => {
    if (!params[0] || !parseInt(params[0])) {
        return message.reply('Invalid args! Correct term is: ' + process.env.PREFIX + 'removewarning [warningid]')
    }
    fivemexports['ghmattimysql'].execute("DELETE FROM vrp_warnings WHERE warning_id = ?", [parseInt(params[0])])
    let embed = {
        "title": "Removed Warning",
        "description": `\nSuccess! Removed Warning ID: ${params[0]}`,
        "color": 5301186,
        "footer": {
            "text": "vRP • Made by JamesUK#6793"
        },
        "timestamp": new Date()
    }
    message.channel.send({ embed })
}

exports.conf = {
    name: "removewarning",
    perm: 3
}