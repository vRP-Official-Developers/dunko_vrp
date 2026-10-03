const { SlashCommandBuilder } = require("discord.js");

exports.data = new SlashCommandBuilder()
    .setName("help")
    .setDescription("List the bot's commands.")

exports.conf = {
    perm: 0
}

exports.execute = async(fivemexports, client, interaction) => {
    const lines = client.commands
        .map(command => command.data.toJSON())
        .sort((a, b) => a.name.localeCompare(b.name))
        .map(json => ["/" + json.name]
            .concat((json.options || []).map(option => option.required ? `[${option.name}]` : `(${option.name})`))
            .join(" "))
    let embed = {
        "title": "Discord Bot Commands",
        "description": lines.join("\n") + "\n\n[ ] = required, ( ) = optional",
        "color": 5301186,
        "footer": {
            "text": "vRP • Made by JamesUK#6793"
        },
        "timestamp": new Date()
    }
    return interaction.editReply({ embeds: [embed] })
}
