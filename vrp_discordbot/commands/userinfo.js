exports.runcmd = async(fivemexports, client, message, params) => {
    if (!params[0] && !parseInt(params[0])) {
        return message.reply('Invalid args! Correct term is: ' + process.env.PREFIX + 'userinfo [permid]')
    }
    let bank = undefined;
    let bandata = "";
    let wallet = undefined;
    fivemexports.ghmattimysql.execute("SELECT * FROM vrp_user_moneys WHERE user_id = ?", [params[0]], (result) => {
        if (result) {
            bank = result[0].bank
            wallet = result[0].wallet
            fivemexports.ghmattimysql.execute("SELECT * FROM `vrp_users` WHERE id = ?", [params[0]], (userdata) => {
                if (userdata) {
                    if (userdata[0].banned == 1) {
                        bandata = `Banned: ${userdata[0].banned}\n\nReason: ${userdata[0].banreason}\n\nBanAdmin: ${userdata[0].banadmin}\n\nBan Expires: ${new Date(userdata[0].bantime * 1000)}`
                    }
                    let embed = {
                        "title": "User Info",
                        "description": `\nUser Info For: ${params[0]}\nBank: ${bank}\nWallet: ${wallet}\n\n${bandata}`,
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
    })
}

exports.conf = {
    name: "userinfo",
    perm: 1
}