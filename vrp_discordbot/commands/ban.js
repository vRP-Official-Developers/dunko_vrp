exports.runcmd = (fivemexports, client, message, params) => {
    if (!params[0] || !params[1]) {
        return message.reply('Invalid args! Correct term is: ' + process.env.PREFIX + 'kick [permid] [reason]')
    }
    const reason = params.slice(1).join(' ');
    fivemexports.vrp.vrpbot('getUserSource', [parseInt(params[0])], function(d) {
        let newval = fivemexports.vrp.vrpbot('kick', [d, `You were kicked from the server via Discord for: ${reason} | Kicking Admin: ${message.author.username} (${message.author.id})`])
        message.reply(`Success! Kicked Player: ${params[0]} UserID`)
    })
}

exports.conf = {
    name: "kick",
    perm: 2
}