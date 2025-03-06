local luadb = require('luadb')
local db = luadb.new('main')

return {
    name = "setprefix",
    prefixed = true,
    exec = function (msg, args, color)
        table.remove(args, 1)
        if not args[1] or string.len(args[1]) > 10 then
            return msg:reply('Prefixo muito grande ou não providenciado!')
        end
        local guilddb = db:FindAndGet('guilds', msg.guild.id)
        if not guilddb then return end
        local lastprefix = guilddb.prefix
        local member = msg.guild:getMember(msg.author.id)

        if not member or not member:hasPermission('administrator') then
            return msg:reply('Você não está em um servidor e/ou não tem permissão para usar esse comando!')
        end

        db:FindAndReplace('guilds', msg.guild.id, {
            prefix = args[1]
        })

        msg:reply {
            content = ('<@%s>'):format(msg.author.id),
            embed = {
                title = 'Prefixo atualizado',
                fields = {
                    {name = "Antigo prefixo:", value = ('`%s`'):format(lastprefix), inline = true},
                    {name = "Novo prefixo:", value = ('`%s`'):format(args[1]), inline = true}
                },
                color = color,
                thumbnail = {
                    url = member.avatarURL
                }
            }
        }
    end
}