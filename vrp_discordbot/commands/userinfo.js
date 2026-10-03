const { SlashCommandBuilder } = require("discord.js");

exports.data = new SlashCommandBuilder()
    .setName("userinfo")
    .setDescription("Show a player's money and ban info.")
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
    const result = await client.query("SELECT * FROM vrp_user_moneys WHERE user_id = ?", [permid])
    if (!result) throw new Error("Failed to load vrp_user_moneys")
    const userdata = await client.query("SELECT * FROM `vrp_users` WHERE id = ?", [permid])
    if (!userdata) throw new Error("Failed to load vrp_users")
    if (result.length === 0 || userdata.length === 0) {
        return interaction.editReply("No user found with that PermID.")
    }
    let bank = result[0].bank
    let wallet = result[0].wallet
    let bandata = ""
    if (userdata[0].banned == 1) {
        let bantime = String(userdata[0].bantime)
        let expires = /^\d+$/.test(bantime) ? new Date(Number(bantime) * 1000) : "Never"
        bandata = `Banned: ${userdata[0].banned}\n\nReason: ${userdata[0].banreason}\n\nBanAdmin: ${userdata[0].banadmin}\n\nBan Expires: ${expires}`
    }
    let embed = {
        "title": "User Info",
        "description": `\nUser Info For: ${permid}\nBank: ${bank}\nWallet: ${wallet}\n\n${bandata}`,
        "color": 5301186,
        "footer": {
            "text": "vRP • Made by JamesUK#6793"
        },
        "timestamp": new Date()
    }
    return interaction.editReply({ embeds: [embed] })
}
