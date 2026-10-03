const { SlashCommandBuilder } = require("discord.js");

exports.data = new SlashCommandBuilder()
    .setName("d2p")
    .setDescription("Find the PermID linked to a Discord user.")
    .addUserOption(option => option
        .setName("user")
        .setDescription("The Discord user")
        .setRequired(true))

exports.conf = {
    perm: 1
}

exports.execute = async(fivemexports, client, interaction) => {
    const user = interaction.options.getUser("user", true)
    const result = await client.query("SELECT * FROM `vrp_user_ids` WHERE identifier = ?", ["discord:" + user.id])
    if (!result) throw new Error("Failed to load vrp_user_ids")
    if (result.length === 0) {
        return interaction.editReply('No account is linked for this user.')
    }
    let embed = {
        "title": "Discord to Perm ID!",
        "description": `\nThe PermID for this user is: ${result[0].user_id}`,
        "color": 5301186,
        "footer": {
            "text": "vRP • Made by JamesUK#6793"
        },
        "timestamp": new Date()
    }
    return interaction.editReply({ embeds: [embed] })
}
