var AsciiTable = require('ascii-table');
exports.runcmd = (fivemexports, client, message, params) => {
    fivemexports.ghmattimysql.execute("SELECT * FROM vrp_user_moneys ORDER BY bank DESC", [], (result) => {
        if (result) {
            var table = new AsciiTable('Top 5 Richest Bank')
            table.setHeading('UserID', 'Amount')
            for (i = 0; i < result.length; i++) {
                if (i < 6) {
                    table.addRow(result[i].user_id, result[i].bank)
                }
            }
            message.channel.send('```ascii\n' + table.toString() + '```')
        }
    })
}

exports.conf = {
    name: "top5",
    perm: 0
}