exports.runcmd = (fivemexports, client, message, params) => {
    if (!params[0] || !parseInt(params[0]) || !params[1]) {
        return message.reply('Invalid args! Correct term is: ' + process.env.PREFIX + 'addgroup [permid] [amount]')
    }
    fivemexports.ghmattimysql.execute("SELECT * FROM `vrp_user_data` WHERE user_id = ?", [params[0]], (result) => {
        if (result.length > 0) {
            let dvalue = JSON.parse(result[0].dvalue)
            let groups = dvalue.groups
            groups[params[1]] = true;
            fivemexports.ghmattimysql.execute("UPDATE `vrp_user_moneys` SET wallet = ? WHERE user_id = ?", [JSON.stringify(dvalue), params[0]])
        }
    })
    let embed = {
        "title": "Cash Has Been Set",
        "description": `\nSuccess! Set Money Of: ${params[0]} To ${params[1]}`,
        "color": 5301186,
        "footer": {
            "text": "vRP • Made by JamesUK#6793"
        },
        "timestamp": new Date()
    }
    message.channel.send({ embed })
}

exports.conf = {
    name: "setmoney",
    perm: 3
}
