-- Global mouse bindings
local awful         = require("awful")
local menu          = require("config.menu")

local M = {}

function M.init()
    awful.mouse.append_global_mousebindings({
        awful.button({ }, 3, function () menu.mainmenu:toggle() end),
        awful.button({ }, 4, awful.tag.viewprev),
        awful.button({ }, 5, awful.tag.viewnext),
    })
end

return M
