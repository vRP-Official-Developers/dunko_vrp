var AsciiTable = require('ascii-table');
const { AttachmentBuilder, SlashCommandBuilder } = require("discord.js");

exports.data = new SlashCommandBuilder()
    .setName("warnings")
    .setDescription("Show a player's F10 warnings.")
    .addIntegerOption(option => option
        .setName("permid")
        .setDescription("The player's PermID")
        .setMinValue(1)
        .setMaxValue(2147483647)
        .setRequired(true))

exports.conf = {
    perm: 1
}

exports.execute = async(fivemexports, client, interaction) => {
    const permid = interaction.options.getInteger("permid", true)
    const result = await client.query("SELECT * FROM `vrp_warnings` WHERE user_id = ?", [permid])
    if (!result) throw new Error("Failed to load vrp_warnings")
    if (result.length === 0) {
        return interaction.editReply("This user has no F10 warnings.")
    }
    var table = new AsciiTable('F10 Warnings')
    table.setHeading('Warning ID', 'Warning Type', 'Duration', 'Reason', 'Admin', 'Date')
    for (const row of result) {
        const date = new Date(+row.warning_date)
        table.addRow(row.warning_id, row.warning_type, row.duration, row.reason, row.admin, date.toDateString())
    }
    const text = table.toString()
    const content = '```ascii\n' + text + '```'
    if (content.length <= 2000) {
        return interaction.editReply({ content })
    }
    const file = new AttachmentBuilder(Buffer.from(text, "utf8"), { name: `warnings_${permid}.txt` })
    return interaction.editReply({ content: `Well this is horrifying this F10 is too large for Discord, ${interaction.user}`, files: [file] })
}
