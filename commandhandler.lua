-- / Luvit Native \
local fs = require("fs")
-- \              /
local commandhandler = {}
commandhandler.commands = {}

function commandhandler:load(cfolder)
    self.commands = {}

    for _, folder in pairs(fs.readdirSync(cfolder)) do
        for _, file in pairs(fs.readdirSync((cfolder..'/%s'):format(folder))) do
            string.gsub(file, ".lua", "")
            local path = cfolder.."/"..folder.."/"..file
            local command = require(path)
    
            table.insert(self.commands, command)
        end
    end
end

return commandhandler