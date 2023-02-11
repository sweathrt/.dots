-- Client rules
local awful = require("awful")
local ruled = require("ruled")
local vars  = require("config.vars")

local M = {}

function M.init()
    ruled.client.connect_signal("request::rules", function()
        -- All clients will match this rule.
        ruled.client.append_rule {
            id         = "global",
            rule       = { },
            properties = {
                focus     = awful.client.focus.filter,
                raise     = true,
                screen    = awful.screen.preferred,
                placement = awful.placement.no_overlap + awful.placement.no_offscreen
            }
        }

        -- Floating clients.
        ruled.client.append_rule {
            id       = "floating",
            rule_any = {
                instance = { "copyq", "pinentry" },
                class    = {
                    "Arandr", "Blueman-manager", "Gpick", "Kruler", "Sxiv",
                    "Tor Browser", "Wpa_gui", "veromix", "xtightvncviewer"
                },
                -- Note that the name property shown in xprop might be set slightly after creation of the client
                -- and the name shown there might not match defined rules here.
                name    = {
                    "Event Tester",  -- xev.
                    "Media viewer"
                },
                role    = {
                    "AlarmWindow",    -- Thunderbird's calendar.
                    "ConfigManager",  -- Thunderbird's about:config.
                    "pop-up",         -- e.g. Google Chrome's (detached) Developer Tools.
                }
            },
            properties = { floating = true }
        }

        -- Add titlebars to normal clients and dialogs
        ruled.client.append_rule {
            id         = "titlebars",
            rule_any   = { type = { "normal", "dialog" } },
            properties = { titlebars_enabled = vars.titlebars }
        }

        -- Set LibreWolf to always map on the tag named "3" on screen 1.
        ruled.client.append_rule {
            rule       = { class = "LibreWolf" },
            properties = { screen = 1, tag = "3" }
        }
    end)

    -- Enable sloppy focus, so that focus follows mouse.
    if vars.sloppy_focus then
        client.connect_signal("mouse::enter", function(c)
            c:activate { context = "mouse_enter", raise = false }
        end)
    end
end

return M
