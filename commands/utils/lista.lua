return {
    name = 'lista',
    prefixed = true,
    exec = function(msg, _, color)
        msg:reply {
            embed = {
                content = "<@"..msg.author.id..">",
                title = "⌨ | Lista de comandos",
                fields = {
                    {name = "<prefix>ping", value = "Pong !", inline = false},
                    {name = "<prefix>pong", value = "Ping !", inline = false},
                    {name = "<prefix>say <mensagem>", value = "Faça o bot falar algo", inline = false},
                    {name = "<prefix>help", value = "Central de informações do bot", inline = false},
                    {name = "<@jason>", value = "Veja informações do bot", inline = false},
                    {name = "<prefix>gay", value = "Veja o quanto você é gay", inline = false},
                    {name = "<prefix>setprefix", value = "Defina o prefixo do servidor (apenas para administradores do servidor)", inline = false},
                    {name = "<prefix>atm", value = "Veja seu saldo total de estrelas", inline = false},
                    {name = "<prefix>avatar", value = "Veja a foto de perfil de alguém", inline = false},
                    {name = "<prefix>color", value = "Veja informações de uma cor em código hex", inline = false},
                    {name = "<prefix>user", value = "Veja informações de um usuário", inline = false},
                    {name = "<>", value = "Obrigatório", inline = true},
                    {name = "()", value = "Opcional", inline = true},
                },
                color = color,
                thumbnail = {
                    url = 'https://images-ext-1.discordapp.net/external/9TwT8eUJOfAahURmKgNYBzYem3TD6xNqtcgZa0fSSdQ/https/cdn.discordapp.com/avatars/1112357815479181373/28ba1cbdae9e36ea898bb894cc0284ce.png'
                }
            }
        }
    end
}