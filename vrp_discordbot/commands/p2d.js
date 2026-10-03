const { SlashCommandBuilder } = require("discord.js");

exports.data = new SlashCommandBuilder()
    .setName("p2d")
    .setDescription("Find the Discord user linked to a PermID.")
    .addIntegerOption(option => option
        .setName("permid")
        .setDescription("The player's PermID")
        .setMinValue(1)
        .setMaxValue(2147483647)
        .setRequired(true))

exports.conf = {
    perm: 1
}

exports.execute = async(fivemexports, client, interaction) => {
    const permid = interaction.options.getInteger("permid", true)
    const result = await client.query("SELECT * FROM `vrp_user_ids` WHERE user_id = ?", [permid])
    if (!result) throw new Error("Failed to load vrp_user_ids")
    const discordids = [...new Set(result
        .map(row => String(row.identifier || ""))
        .filter(identifier => identifier.startsWith("discord:"))
        .map(identifier => identifier.split(":")[1])
        .filter(id => /^\d+$/.test(id)))]
    let embed = {
        "title": "Perm to Discord",
        "description": discordids.length > 0 ? `\nSuccess! PermID to Discord. This user is: ${discordids.map(id => `<@${id}>`).join(", ")}` : `\nFailed! There is no Discord linked to this PermID!`,
        "color": 5301186,
        "footer": {
            "text": "vRP • Made by JamesUK#6793"
        },
        "timestamp": new Date()
    }
    return interaction.editReply({ embeds: [embed] })
}
