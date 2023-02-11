local global = require("config.bindings.mouse.global")
local client = require("config.bindings.mouse.client")

local M = {}

function M.init()
    global.init()
    client.init()
end

return M
