const { SlashCommandBuilder } = require("discord.js");

exports.data = new SlashCommandBuilder()
    .setName("addcar")
    .setDescription("Add a car to a player's garage.")
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
    const result = await client.query("INSERT INTO vrp_user_vehicles (user_id, vehicle) VALUES(?, ?)", [permid, spawncode])
    let embed = {
        "title": "Added Car",
        "description": result ? `\nSuccess! Added Car ID: ${permid} SpawnCode: ${spawncode}` : `\nFailed! This car for UserID: ${permid} SpawnCode: ${spawncode} already exists`,
        "color": 5301186,
        "footer": {
            "text": "vRP • Made by JamesUK#6793"
        },
        "timestamp": new Date()
    }
    return interaction.editReply({ embeds: [embed] })
}
