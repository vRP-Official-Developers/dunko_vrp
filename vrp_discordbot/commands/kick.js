const { SlashCommandBuilder } = require("discord.js");

exports.data = new SlashCommandBuilder()
    .setName("kick")
    .setDescription("Kick a player from the server.")
    .addIntegerOption(option => option
        .setName("permid")
        .setDescription("The player's PermID")
        .setMinValue(1)
        .setMaxValue(2147483647)
        .setRequired(true))
    .addStringOption(option => option
        .setName("reason")
        .setDescription("The reason for the kick")
        .setMaxLength(1000)
        .setRequired(true))

exports.conf = {
    perm: 2
}

exports.execute = async(fivemexports, client, interaction) => {
    const permid = interaction.options.getInteger("permid", true)
    const reason = interaction.options.getString("reason", true)
    const source = await new Promise(resolve => fivemexports.vrp.vrpbot('getUserSource', [permid], resolve))
    if (!source) {
        return interaction.editReply('This user is not online!')
    }
    fivemexports.vrp.vrpbot('kick', [source, `You were kicked from the server via Discord for: ${reason} | Kicking Admin: ${interaction.user.username} (${interaction.user.id})`])
    let embed = {
        "title": "Kicked User",
        "description": `\nSuccess! Kicked User with PermID: ${permid}`,
        "color": 5301186,
        "footer": {
            "text": "vRP • Made by JamesUK#6793"
        },
        "timestamp": new Date()
    }
    return interaction.editReply({ embeds: [embed] })
}
