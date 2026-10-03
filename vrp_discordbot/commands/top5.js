var AsciiTable = require('ascii-table');
const { SlashCommandBuilder } = require("discord.js");

exports.data = new SlashCommandBuilder()
    .setName("top5")
    .setDescription("Show the 5 richest players by bank balance.")

exports.conf = {
    perm: 0
}

exports.execute = async(fivemexports, client, interaction) => {
    const result = await client.query("SELECT user_id, bank FROM vrp_user_moneys ORDER BY bank DESC LIMIT 5", [])
    if (!result) throw new Error("Failed to load vrp_user_moneys")
    if (result.length === 0) {
        return interaction.editReply("There are no users yet.")
    }
    var table = new AsciiTable('Top 5 Richest Bank')
    table.setHeading('UserID', 'Amount')
    for (const row of result) {
        table.addRow(row.user_id, row.bank)
    }
    return interaction.editReply('```ascii\n' + table.toString() + '```')
}
