local awful = require("awful")

local M = {}

function M.init()
    M.names = { "", "", "","", "", ""}
    --[[ M.names = { "", "", "", "", "", "", "", "", "" } ]]
    --[[ M.names = { "I", "II", "III", "IV", "V", "VI", "VII" } ]]

    awful.layout.append_default_layouts({
        awful.layout.suit.tile,
        --[[ awful.layout.suit.tile.left, ]]
        --[[ awful.layout.suit.tile.bottom, ]]
        --[[ awful.layout.suit.tile.top, ]]
        awful.layout.suit.max,
        --[[ awful.layout.suit.max.fullscreen, ]]
        awful.layout.suit.floating,
        --[[ awful.layout.suit.fair, ]]
        --[[ awful.layout.suit.fair.horizontal, ]]
        --[[ awful.layout.suit.spiral, ]]
        --[[ awful.layout.suit.spiral.dwindle, ]]
        --[[ awful.layout.suit.magnifier, ]]
        --[[ awful.layout.suit.corner.nw, ]]
    })

    M.layouts = {
        awful.layout.suit.max,
        awful.layout.suit.max,
        awful.layout.suit.max,
        awful.layout.suit.tile,
        awful.layout.suit.tile,
        awful.layout.suit.tile,
        awful.layout.suit.tile,
        awful.layout.suit.tile,
        awful.layout.suit.tile
    }

    M.main_layout = awful.layout.suit.tile
end

return M
