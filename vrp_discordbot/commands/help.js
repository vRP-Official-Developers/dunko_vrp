exports.runcmd = (fivemexports, client, message, params) => {
    const reason = params.slice(2).join(' ');
    let embed = {
        "title": "Commands For This Bot",
        "description": "Commands Coming Soon",
        "color": 5301186,
        "footer": {
            "text": "vRP • Made by JamesUK#6793"
        },
        "timestamp": new Date()
    }
    message.channel.send({ embed })
}

exports.conf = {
    name: "help"
}
