local luadb = require('luadb')
local db = luadb.new('main')

return {
    name = '<@1112357815479181373>',
    prefixed = false,
    exec = function(msg, _, color)
        local guildbd = db:FindAndGet('guilds', msg.guild.id)
        if not guildbd then return end

        msg:reply {
            embed = {
                fields = {
                    {name = msg.author.name, value = "Olá, meu nome é Jason e eu sou um **app** de funcionalidades aleatórias (Utilize `"..guildbd.prefix.."help` para mais informações)"}
                },
                color = color,
                thumbnail = {
                    url = 'https://images-ext-1.discordapp.net/external/9TwT8eUJOfAahURmKgNYBzYem3TD6xNqtcgZa0fSSdQ/https/cdn.discordapp.com/avatars/1112357815479181373/28ba1cbdae9e36ea898bb894cc0284ce.png'
                }
            }
        }
    end
}