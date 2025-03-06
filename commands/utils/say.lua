return {
    name = 'say',
    prefixed = true,
    exec = function(msg, args)
        table.remove(args, 1)
        if not args[1] then return msg:reply('Digite uma mensagem para ser enviada') end
        local text = table.concat(args, ' ')
        local client = msg.guild:getMember('1112357815479181373')

        if text:find("https://") or text:find("http://") or text:find(".gg") or text:find(".com") then
            msg:reply("<@"..msg.author.id.."> Vsfd com esse link")
            return
        end
        if text:len() > 500 then
            return msg:reply('O bot só pode enviar textos que tem até 500 caracteries!')
        end

        if client:hasPermission('administrator') then
            msg:delete()
        end

        msg:reply(text)
    end
}