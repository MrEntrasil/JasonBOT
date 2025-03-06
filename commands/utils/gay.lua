local discordia = require('discordia')

return {
    name = "gay",
    prefixed = true,
    exec = function(msg)
        local member = msg.guild:getMember(msg.author.id)
        local random = math.random(1, 110)
        local msgreply

        if random <= 20 then
            msgreply = ":rainbow_flag:? Você é 20% gay"
        elseif random <= 50 then
            msgreply = ":rainbow_flag: Você é um metade gay. (50%)"
        elseif random <= 70 then
            msgreply = ":rainbow_flag: Você é muito gay vei (70%)"
        elseif random <= 90 then
            msgreply = ":rainbow_flag: Você esta quase em sua forma perfeita (90%)"
        elseif random <= 110 then
            msgreply = ":rainbow_flag::rainbow::rainbow: Você é uma super bixa forma perfeita (110%)"
        end

        if msg.author.id == '893615754040197201' then
            msgreply = "⚪⚫ Você é um super hétero (-1%)"
            return msg:reply {
                embed = {
                    author = {
                        name = msg.author.name,
                        url = msg.author.avatarURL
                    },
                    title = "O quanto você é gay?",
                    description = msgreply,
                    color = discordia.Color.fromRGB(255, 255, 255).value,
                    thumbnail = {
                        url = member.avatarURL
                    }
                }
            }
        end

        msg:reply {
            embed = {
                author = {
                    name = msg.author.name,
                    url = msg.author.avatarURL
                },
                title = "O quanto você é gay?",
                description = msgreply,
                color = discordia.Color.fromRGB(255, 100, 100).value,
                thumbnail = {
                    url = member.avatarURL
                }
            }
        }
    end
}