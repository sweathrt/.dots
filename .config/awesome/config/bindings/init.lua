local mouse    = require("config.bindings.mouse")
local keyboard = require("config.bindings.keyboard")

local M = {}

function M.init()
    mouse.init()
    keyboard.init()
end

return M
