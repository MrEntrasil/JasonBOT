local luadb = require('luadb')
local db = luadb.new('main')

return {
    name = 'help',
    prefixed = true,
    exec = function(msg, _, color)
        local guilddb = db:FindAndGet('guilds', msg.guild.id)
        if not guilddb then return end

        msg:reply {
            embed = {
                content = ('<@%s>'):format(msg.author.id),
                title = '⁉ help',
                fields = {
                    {name = "🔨 Produzido em", value = "<:LuaLogo:1205630924377690193> Lua", inline = true},
                    {name = "🚧 Criador/Fundador", value = "MrEntrasil", inline = true},
                    {name = "🚩 País", value = ":flag_br: Brasil", inline = true},
                    {name = "📕 Lista de comandos", value = "`"..guilddb.prefix.."lista`", inline = true},
                    {name = "🔈 Prefixo atual do servidor", value = "`"..guilddb.prefix.."`", inline = true}
                },
                thumbnail = {
                    url = 'https://images-ext-1.discordapp.net/external/9TwT8eUJOfAahURmKgNYBzYem3TD6xNqtcgZa0fSSdQ/https/cdn.discordapp.com/avatars/1112357815479181373/28ba1cbdae9e36ea898bb894cc0284ce.png'
                },
                color = color
            }
        }
    end
}