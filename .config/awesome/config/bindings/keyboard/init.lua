local global = require("config.bindings.keyboard.global")
local client = require("config.bindings.keyboard.client")

local M = {}

function M.init()
    global.init()
    client.init()
end

return M
