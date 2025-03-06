return {
    name = "avatar",
    prefixed = true,
    exec = function(msg, args, color)
        table.remove(args, 1)
        if not args[1] then table.insert(args, 1, msg.author.id) end
        local author = msg.author
        local guild = msg.guild
        local member = guild:getMember(args[1])
        if not member then return msg:reply("Não foi possível encontrar o membro neste servidor!") end

        msg:reply{
            embed = {
                image = {
                    name = member.name,
                    url = member.avatarURL
                },
                color = color
            }
        }
    end
}