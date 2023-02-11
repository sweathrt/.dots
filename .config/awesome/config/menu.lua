-- Create the main menu --
local beautiful     = require("beautiful")
local hotkeys_popup = require("awful.hotkeys_popup").widget
local menubar       = require("menubar")
local vars          = require("config.vars")
local freedesktop   = require("freedesktop")

local M = {}

function M.init()
    local awesomemenu = {
       { "Hotkeys", function() return false, hotkeys_popup.show_help end },
       { "Manual", vars.terminal .. " -e man awesome" },
       { "Edit config", vars.editor_cmd .. " " .. awesome.conffile },
       { "Restart", awesome.restart },
       { "Quit", function() awesome.quit() end },
    }

    M.mainmenu = freedesktop.menu.build({
        before = {
            { "Awesome", awesomemenu, beautiful.awesome_icon },
            -- other triads can be put here
        },
        sub_menu = "Applications",
        after = {
            { "Terminal", vars.terminal, menubar.utils.lookup_icon('terminal') },
            -- other triads can be put here
        },
        skip_items = { "Avahi", "XDvi", "Qt" }
    })

    -- Set the Menubar terminal for applications that require it
    menubar.utils.terminal = vars.terminal
end

return M
