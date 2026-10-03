const { SlashCommandBuilder } = require("discord.js");

exports.data = new SlashCommandBuilder()
    .setName("removecar")
    .setDescription("Remove a car from a player's garage.")
    .addIntegerOption(option => option
        .setName("permid")
        .setDescription("The player's PermID")
        .setMinValue(1)
        .setMaxValue(2147483647)
        .setRequired(true))
    .addStringOption(option => option
        .setName("spawncode")
        .setDescription("The spawn code of the car")
        .setMaxLength(64)
        .setRequired(true))

exports.conf = {
    perm: 3
}

exports.execute = async(fivemexports, client, interaction) => {
    const permid = interaction.options.getInteger("permid", true)
    const spawncode = interaction.options.getString("spawncode", true).trim()
    if (!spawncode) {
        return interaction.editReply("Invalid args! Please enter a spawn code.")
    }
    const result = await client.query("DELETE FROM vrp_user_vehicles WHERE user_id = ? AND vehicle = ?", [permid, spawncode])
    if (!result) throw new Error("Failed to remove the car from vrp_user_vehicles")
    const removed = result.affectedRows === undefined || result.affectedRows > 0
    let embed = {
        "title": "Remove Car",
        "description": removed ? `\nSuccess! Removed Car ID: ${permid} SpawnCode: ${spawncode}` : `\nFailed! This car for UserID: ${permid} SpawnCode: ${spawncode} already is gone!`,
        "color": 5301186,
        "footer": {
            "text": "vRP • Made by JamesUK#6793"
        },
        "timestamp": new Date()
    }
    return interaction.editReply({ embeds: [embed] })
}
