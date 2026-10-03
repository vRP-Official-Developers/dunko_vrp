const { SlashCommandBuilder } = require("discord.js");

exports.data = new SlashCommandBuilder()
    .setName("warn")
    .setDescription("Give a player an F10 warning.")
    .addIntegerOption(option => option
        .setName("permid")
        .setDescription("The player's PermID")
        .setMinValue(1)
        .setMaxValue(2147483647)
        .setRequired(true))
    .addStringOption(option => option
        .setName("reason")
        .setDescription("The reason for the warning")
        .setMaxLength(1000)
        .setRequired(true))

exports.conf = {
    perm: 1
}

exports.execute = async(fivemexports, client, interaction) => {
    const permid = interaction.options.getInteger("permid", true)
    const reason = interaction.options.getString("reason", true)
    fivemexports.vrp.vrpbot('GiveWarning', [permid, interaction.user.username, reason])
    let embed = {
        "title": "Warned User",
        "description": `\nSuccess! Warned User with PermID: ${permid} For: ${reason}`,
        "color": 5301186,
        "footer": {
            "text": "vRP • Made by JamesUK#6793"
        },
        "timestamp": new Date()
    }
    return interaction.editReply({ embeds: [embed] })
}
