exports.runcmd = (fivemexports, client, message, params) => {
    if (!params[0] || !params[1]) {
        return message.reply('Invalid args! Correct term is: ' + process.env.PREFIX + 'warn [permid] [reason]')
    }
    const reason = params.slice(1).join(' ');
    let newval = fivemexports.vrp.vrpbot('GiveWarning', [params[0], message.author.username, reason])
    message.reply(`Success! Warned Player: ${params[0]} UserID`)
}

exports.conf = {
    name: "warn",
    perm: 1
}