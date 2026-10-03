const { SlashCommandBuilder } = require("discord.js");

exports.data = new SlashCommandBuilder()
    .setName("groups")
    .setDescription("Show a player's groups.")
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
    const result = await client.query("SELECT * FROM `vrp_user_data` WHERE user_id = ? AND dkey = ?", [permid, "vRP:datatable"])
    if (!result) throw new Error("Failed to load vrp_user_data")
    if (result.length === 0) {
        return interaction.editReply('No groups for this user.')
    }
    let groups = JSON.stringify(JSON.parse(result[0].dvalue).groups || {})
    if (groups.length > 3800) groups = groups.slice(0, 3800) + "..."
    let embed = {
        "title": "Fetched User Groups",
        "description": `\n\nSuccess! Fetched Groups For UserId ${permid}\n\n` + "```" + groups + "```",
        "color": 5301186,
        "footer": {
            "text": "vRP • Made by JamesUK#6793"
        },
        "timestamp": new Date()
    }
    return interaction.editReply({ embeds: [embed] })
}
