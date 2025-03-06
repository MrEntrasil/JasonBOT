-- / Packages \
local discordia = require('discordia')
local luadb = require('luadb')
-- \          /

-- / Modules \
local config = require('./env')
local commandhandler = require('./commandhandler')
-- \         /

local db = luadb.new('main')
local client = discordia.Client()
local custom_assert = function(condition, func)
    if not condition then
        func()
    end
end

discordia.extensions()
commandhandler:load('./commands')

client:on('ready', function()
    print('Client starting...')
end)

client:on('messageCreate', function(msg)
    if msg.author.bot then return end
    custom_assert(db:exists('users', msg.author.id), function()
        db:FindAndSet('users', msg.author.id, {
            coin = 0,
            blacklist = false
        })
    end)
    custom_assert(db:exists('guilds', msg.guild.id), function()
        db:FindAndSet('guilds', msg.guild.id, {
            premium = false,
            prefix = 'gg!'
        })
    end)
    
    local split = discordia.extensions.string.split(msg.content, " ")
    local maincolor = discordia.Color.fromHex("#FF3C00").value
    local guilddb = db:FindAndGet('guilds', msg.guild.id)
    local userdb = db:FindAndGet('users', msg.author.id)
    if not guilddb then return end
    if not userdb then return end
    if userdb.blacklist then return end

    for i = 1, #commandhandler.commands do
        local command = commandhandler.commands[i]

        if command.prefixed == true then
            if split[1] == guilddb.prefix..command.name then
                return command.exec(msg, split, maincolor)
            end
        else
            if split[1] == command.name then
                return command.exec(msg, split, maincolor)
            end
        end
    end
end)

client:run('Bot '..config.token)