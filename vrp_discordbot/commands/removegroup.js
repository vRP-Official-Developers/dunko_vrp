const { SlashCommandBuilder } = require("discord.js");

exports.data = new SlashCommandBuilder()
    .setName("removegroup")
    .setDescription("Remove a group from a player.")
    .addIntegerOption(option => option
        .setName("permid")
        .setDescription("The player's PermID")
        .setMinValue(1)
        .setMaxValue(2147483647)
        .setRequired(true))
    .addStringOption(option => option
        .setName("group")
        .setDescription("The name of the group")
        .setMaxLength(64)
        .setRequired(true))

exports.conf = {
    perm: 3
}

exports.execute = async(fivemexports, client, interaction) => {
    const permid = interaction.options.getInteger("permid", true)
    const group = interaction.options.getString("group", true).trim()
    if (!group) {
        return interaction.editReply("Invalid args! Please enter a group name.")
    }
    const result = await client.query("SELECT * FROM `vrp_user_data` WHERE user_id = ? AND dkey = ?", [permid, "vRP:datatable"])
    if (!result) throw new Error("Failed to load vrp_user_data")
    if (result.length === 0) {
        return interaction.editReply("No user found with that PermID.")
    }
    let dvalue = JSON.parse(result[0].dvalue)
    dvalue.groups = Object.assign({}, dvalue.groups)
    let embed = {
        "title": "Removed Group",
        "description": `\nSuccess! Removed Group to: ${permid} Group Name: ${group}`,
        "color": 5301186,
        "footer": {
            "text": "vRP • Made by JamesUK#6793"
        },
        "timestamp": new Date()
    }
    if (!Object.prototype.hasOwnProperty.call(dvalue.groups, group)) {
        embed.description = `\nFailed! UserID: ${permid} is not in the group: ${group}`
        return interaction.editReply({ embeds: [embed] })
    }
    delete dvalue.groups[group]
    const updated = await client.query("UPDATE `vrp_user_data` SET dvalue = ? WHERE user_id = ? AND dkey = ?", [JSON.stringify(dvalue), permid, "vRP:datatable"])
    if (!updated) throw new Error("Failed to update vrp_user_data")
    return interaction.editReply({ embeds: [embed] })
}
