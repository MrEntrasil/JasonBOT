local staff = {
    ['893615754040197201'] = true
}

return {
    name = "eval",
    prefixed = true,
    exec = function(msg, _, color)
        Message = msg
        Luadb = require('luadb')
        local content = msg.content
        content = string.gsub(content, "gg!eval ", "")
        content = string.gsub(content, "```lua", "")
        content = string.gsub(content, "```", "")

        local author = msg.author
        if not staff[author.id] then return end
    
        local _, result = pcall(function()
            return assert(load(content))()
        end)
    
        if not string.find(content, "message:reply") then
            msg:reply{
                embed = {
                    title = "⌨ | Eval",
                    fields = {
                        {name = "Entrada:", value = string.format("```lua\n"..tostring(content).."```", result)},
                        {name = "Saída:", value = string.format("```lua\n"..tostring(result).."```", result)}
                    },
                    color = color
                }
            }
        end

        ---@type nil
        Message = nil
        ---@type nil
        Luadb = nil
    end
}