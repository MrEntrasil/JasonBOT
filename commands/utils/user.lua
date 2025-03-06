return {
    name = 'user',
    prefixed = true,
    exec = function(msg, args)
        table.remove(args, 1)
        local senha = math.random(1, 3)
        local password
        local bot = "❌"
    
        if senha == 1 then
            password = "Eu sou o Spider-Man"
        elseif senha == 2 then
            password = "Eu sou o Iron-Man"
        elseif senha == 3 then
            password = "Eu sou inevitável"
        end
    
        if not args[1] then
            args[1] = msg.author.id
        end
    
        local Member = msg.guild:getMember(args[1])
    
        if not Member then
            msg:reply("Usuário não válido/id necessário.")
            return
        end
    
        if Member.bot then
            bot = "✅"
        end
    
        msg:reply{
            embed = {
                fields = {
                    {name = "Nome:", value = Member.username, inline = true},
                    {name = "Id:", value = args[1], inline = true},
                    {name = "Nome com tag:", value = Member.user.name.."#0000", inline = true},
                    {name = "Senha da conta:", value = password, inline = true},
                    {name = "É um bot?", value = bot, inline = true},
                },
                thumbnail = {
                    url = Member.avatarURL
                },
                color = Member:getColor().value
            }
        }
    end
}