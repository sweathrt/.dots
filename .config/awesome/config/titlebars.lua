-- Add a titlebar if titlebars_enabled is set to true in the rules.
-- (see 'config.vars.titlebars')
local awful = require("awful")
local wibox = require("wibox")

local M = {}

function M.init()
    client.connect_signal("request::titlebars", function(c)
        -- buttons for the titlebar
        local buttons = {
            awful.button({ }, 1, function()
                c:activate { context = "titlebar", action = "mouse_move"  }
            end),
            awful.button({ }, 3, function()
                c:activate { context = "titlebar", action = "mouse_resize"}
            end),
        }

        awful.titlebar(c).widget = {
            layout = wibox.layout.align.horizontal,
            { -- Left
                layout  = wibox.layout.fixed.horizontal,
                awful.titlebar.widget.iconwidget(c),
                buttons = buttons
            },
            { -- Middle
                layout  = wibox.layout.flex.horizontal,
                { -- Title
                    halign = "center",
                    widget = awful.titlebar.widget.titlewidget(c)
                },
                buttons = buttons
            },
            { -- Right
                layout = wibox.layout.fixed.horizontal(),
                awful.titlebar.widget.floatingbutton (c),
                awful.titlebar.widget.maximizedbutton(c),
                awful.titlebar.widget.stickybutton   (c),
                awful.titlebar.widget.ontopbutton    (c),
                awful.titlebar.widget.closebutton    (c),
            }
        }
    end)
end

return M
