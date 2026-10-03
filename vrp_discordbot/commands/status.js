const { SlashCommandBuilder } = require("discord.js");

exports.data = new SlashCommandBuilder()
    .setName("status")
    .setDescription("Show the server status.")

exports.conf = {
    perm: 0
}

exports.execute = async(fivemexports, client, interaction) => {
    let embed = {
        "title": "Status",
        "description": `\nPlayers: ${GetNumPlayerIndices()}\n\nBot Developed by the vRPDevTeam(JamesUK)\n\nThank you for using and playing this server!\n\nThe IP is: connect ${client.ip}`,
        "color": 5301186,
        "footer": {
            "text": "vRP • Made by JamesUK#6793"
        },
        "timestamp": new Date()
    }
    return interaction.editReply({ embeds: [embed] })
}
