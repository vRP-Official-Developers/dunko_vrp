const { SlashCommandBuilder } = require("discord.js");

exports.data = new SlashCommandBuilder()
    .setName("hmc")
    .setDescription("Show how many of a car are owned in the city.")
    .addStringOption(option => option
        .setName("spawncode")
        .setDescription("The spawn code of the car")
        .setMaxLength(64)
        .setRequired(true))

exports.conf = {
    perm: 0
}

exports.execute = async(fivemexports, client, interaction) => {
    const spawncode = interaction.options.getString("spawncode", true).trim()
    if (!spawncode) {
        return interaction.editReply("Invalid args! Please enter a spawn code.")
    }
    const result = await client.query("SELECT COUNT(*) AS count FROM vrp_user_vehicles WHERE vehicle = ?", [spawncode.toLowerCase()])
    if (!result) throw new Error("Failed to load vrp_user_vehicles")
    const count = result[0] ? result[0].count : 0
    let embed = {
        "title": "Car Count",
        "description": `\nSuccess! There are: ${count} ${spawncode}'s in the city.`,
        "color": 5301186,
        "footer": {
            "text": "vRP • Made by JamesUK#6793"
        },
        "timestamp": new Date()
    }
    return interaction.editReply({ embeds: [embed] })
}
