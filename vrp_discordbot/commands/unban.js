exports.runcmd = (fivemexports, client, message, params) => {
    if (!params[0]) {
        return message.reply('Invalid args! Correct term is: ' + process.env.PREFIX + 'unban [permid]')
    }
    const reason = params.slice(1).join(' ');
    let newval = fivemexports.vrp.vrpbot('setBanned', [params[0], false])
    message.reply(`Success! Unbanned Player: ${params[0]} UserID`)
}

exports.conf = {
    name: "unban",
    perm: 2
}