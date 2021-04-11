exports.runcmd = (fivemexports, client, message, params) => {
    if (!params[0] || !params[1]) {
        return message.reply('Invalid args! Correct term is: ' + process.env.PREFIX + 'ban [permid] [time (hours)] [reason]')
    }
    const reason = params.slice(1).join(' ');
    let newval = fivemexports.vrp.vrpbot('banConsole', [params[0], params[1], `${reason}\n\nBanning Discord Admin: ${message.author.username} (${message.author.id})\n`])
    message.reply(`Success! Banned Player: ${params[0]} UserID`)
}

exports.conf = {
    name: "ban",
    perm: 2
}