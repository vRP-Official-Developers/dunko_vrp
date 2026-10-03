const { SlashCommandBuilder } = require("discord.js");

exports.data = new SlashCommandBuilder()
    .setName("removewarning")
    .setDescription("Remove an F10 warning.")
    .addIntegerOption(option => option
        .setName("warningid")
        .setDescription("The ID of the warning")
        .setMinValue(1)
        .setRequired(true))

exports.conf = {
    perm: 3
}

exports.execute = async(fivemexports, client, interaction) => {
    const warningid = interaction.options.getInteger("warningid", true)
    const result = await client.query("DELETE FROM vrp_warnings WHERE warning_id = ?", [warningid])
    if (!result) throw new Error("Failed to remove the warning from vrp_warnings")
    const removed = result.affectedRows === undefined || result.affectedRows > 0
    let embed = {
        "title": "Removed Warning",
        "description": removed ? `\nSuccess! Removed Warning ID: ${warningid}` : `\nFailed! There is no warning with ID: ${warningid}`,
        "color": 5301186,
        "footer": {
            "text": "vRP • Made by JamesUK#6793"
        },
        "timestamp": new Date()
    }
    return interaction.editReply({ embeds: [embed] })
}
