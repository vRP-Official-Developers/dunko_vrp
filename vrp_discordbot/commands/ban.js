const { SlashCommandBuilder } = require("discord.js");

exports.data = new SlashCommandBuilder()
    .setName("ban")
    .setDescription("Ban a player from the server.")
    .addIntegerOption(option => option
        .setName("permid")
        .setDescription("The player's PermID")
        .setMinValue(1)
        .setMaxValue(2147483647)
        .setRequired(true))
    .addIntegerOption(option => option
        .setName("hours")
        .setDescription("How many hours the ban lasts")
        .setMinValue(1)
        .setMaxValue(999999)
        .setRequired(true))
    .addStringOption(option => option
        .setName("reason")
        .setDescription("The reason for the ban")
        .setMaxLength(1000)
        .setRequired(false))

exports.conf = {
    perm: 2
}

exports.execute = async(fivemexports, client, interaction) => {
    const permid = interaction.options.getInteger("permid", true)
    const hours = interaction.options.getInteger("hours", true)
    const reason = interaction.options.getString("reason") || ""
    fivemexports.vrp.vrpbot('banConsole', [permid, hours, `${reason}\nBanning Discord Admin: ${interaction.user.username} (${interaction.user.id})\n Note this ban was carried out in Discord by the above staff member through the console banning function.`])
    let embed = {
        "title": "Banned User",
        "description": `\nSuccess! Banned User with PermID: ${permid} With ${hours} hours and the reason: ${reason}`,
        "color": 5301186,
        "footer": {
            "text": "vRP • Made by JamesUK#6793"
        },
        "timestamp": new Date()
    }
    return interaction.editReply({ embeds: [embed] })
}
