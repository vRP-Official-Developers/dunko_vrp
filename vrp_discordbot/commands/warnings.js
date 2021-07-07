var AsciiTable = require('ascii-table');
const Discord = require('discord.js');
const fs = require('fs');

exports.runcmd = (fivemexports, client, message, params) => {
    if (!params[0] || !parseInt(params[0])) {
        return message.reply('Invalid args! Correct term is: ' + process.env.PREFIX + 'warnings [permid]')
    }
    fivemexports.ghmattimysql.execute("SELECT * FROM `vrp_warnings` WHERE user_id = ?", [params[0]], (result) => {
        var table = new AsciiTable('F10 Warnings')
        table.setHeading('Warning ID', 'Warning Type', 'Duration', 'Reason', 'Admin', 'Date')
        for (i = 0; i < result.length; i++) {
            var date = new Date(+result[i].warning_date)
            table.addRow(result[i].warning_id, result[i].warning_type, result[i].duration, result[i].reason, result[i].admin, date.toDateString())
        }
        message.channel.send('```ascii\n' + table.toString() + '```').catch(err => {
            fs.writeFile(`${client.path}/warnings_${params[0]}.txt`, table.toString(), function(err) {
                message.channel.send(`Well this is horrifying this F10 is too large for Discord, ${message.author}`, { files: [`${client.path}/warnings_${params[0]}.txt`] }).then(ss => {
                    fs.unlinkSync(`${client.path}/warnings_${params[0]}.txt`)
                })
            });
        })
    });
}

exports.conf = {
    name: "warnings",
    perm: 1
}