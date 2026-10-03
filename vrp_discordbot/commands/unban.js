const { SlashCommandBuilder } = require("discord.js");

exports.data = new SlashCommandBuilder()
    .setName("unban")
    .setDescription("Unban a player from the server.")
    .addIntegerOption(option => option
        .setName("permid")
        .setDescription("The player's PermID")
        .setMinValue(1)
        .setMaxValue(2147483647)
        .setRequired(true))

exports.conf = {
    perm: 2
}

exports.execute = async(fivemexports, client, interaction) => {
    const permid = interaction.options.getInteger("permid", true)
    fivemexports.vrp.vrpbot('setBanned', [permid, false])
    let embed = {
        "title": "Unbanned User",
        "description": `\nSuccess! Unbanned User with PermID: ${permid}`,
        "color": 5301186,
        "footer": {
            "text": "vRP • Made by JamesUK#6793"
        },
        "timestamp": new Date()
    }
    return interaction.editReply({ embeds: [embed] })
}
