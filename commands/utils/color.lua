local http = require('coro-http')
local json = require('json')
local discordia = require('discordia')
discordia.extensions()

return {
    name = 'color',
    prefixed = true,
    exec = function(msg, args)
        coroutine.wrap(function()
            table.remove(args, 1)
            if not args[1] then return msg:reply("<@"..msg.author.id.."> Informe um código hex!") end
            
            args[1] = string.gsub(args[1], "#", "")
            local _, body = http.request('GET', 'https://api.popcat.xyz/color/'..args[1])
            local res = json.decode(body)
        
            if res['error'] then
                msg:reply("<@"..msg.author.id.."> código hex inválido!")
                return
            end
        
            msg:reply{
                embed = {
                    title = msg.author.name,
                    thumbnail = {
                        url = res['color_image']
                    },
                    fields = {
                        {name = "Código hex", value = res["hex"], inline = true},
                        {name = "Nome da cor", value = res["name"], inline = true},
                        {name = "Código rgb", value = res["rgb"], inline = true}
                    },
                    color = discordia.Color.fromHex(res["hex"]).value
                }
            }
        end)()
    end
}