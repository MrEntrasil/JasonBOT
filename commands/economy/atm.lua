local luadb = require('luadb')
local db = luadb.new('main')

return {
    name = "atm",
    prefixed = true,
    exec = function(msg, args, color)
        table.remove(args, 1)
        local tousrname = args[1]
        if not tousrname then tousrname = msg.author.id end
        local member = msg.guild:getMember(tousrname)

        if not member then
            return msg:reply('Este usuário não está neste servidor ou não existe!')
        end
        local userdb = db:FindAndGet('users', member.id)
        if not userdb then return end

        msg:reply {
            content = ('<@%s>'):format(msg.author.id),
            embed = {
                title = member.name,
                fields = {
                    {name = "🌟 Estrelas:", value = userdb.coin}
                },
                thumbnail = {
                    url = member.avatarURL
                },
                color = color
            }
        }
    end
}