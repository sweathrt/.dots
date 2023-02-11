local awful     = require("awful")
local beautiful = require("beautiful")
local wibox     = require("wibox")
local lain      = require("lain")
local keys      = require("config.keys")
local tags      = require("config.tags")
local vars      = require("config.vars")

local M = {}

function M.init()
    -- Move all off-screen windows to the visible area
    screen.connect_signal("property::geometry", function(s, old_geom)
        local geom = s.geometry

        if geom.x == old_geom.x and geom.y == old_geom.y then
            return
        end

        for _, c in pairs(client.get(s)) do
            if c.floating then
                awful.placement.no_offscreen(c)
            end
        end
    end)

    -- Create the wibox for each screen and add it
    screen.connect_signal("request::desktop_decoration", function(s)
        -- Set quake application
        if not s.quake then
            s.quake = lain.util.quake {
                app = vars.terminal,
            }
        end

        -- Add tags if there are none
        if #s.tags == 0 then
            awful.tag(tags.names, s, tags.layouts)
        end

        -- Create a promptbox for each screen
        s.mypromptbox = awful.widget.prompt()

        -- Create an imagebox widget which will contain an icon indicating which layout we're using.
        -- We need one layoutbox per screen.
        s.mylayoutbox = awful.widget.layoutbox {
            screen  = s,
            buttons = {
                awful.button({ }, 1, function () awful.layout.inc( 1) end),
                awful.button({ }, 3, function () awful.layout.inc(-1) end),
                awful.button({ }, 4, function () awful.layout.inc(-1) end),
                awful.button({ }, 5, function () awful.layout.inc( 1) end),
            }
        }

        -- Create a taglist widget
        s.mytaglist = awful.widget.taglist {
            screen  = s,
            filter  = awful.widget.taglist.filter.all,
            buttons = {
                awful.button({ }, 1, function(t) t:view_only() end),
                awful.button({ keys.modkey }, 1, function(t)
                                                if client.focus then
                                                    client.focus:move_to_tag(t)
                                                end
                                            end),
                awful.button({ }, 3, awful.tag.viewtoggle),
                awful.button({ keys.modkey }, 3, function(t)
                                                if client.focus then
                                                    client.focus:toggle_tag(t)
                                                end
                                            end),
                awful.button({ }, 4, function(t) awful.tag.viewprev(t.screen) end),
                awful.button({ }, 5, function(t) awful.tag.viewnext(t.screen) end),
            }
        }

        -- Create a tasklist widget
        s.mytasklist = awful.widget.tasklist {
            screen  = s,
            filter  = awful.widget.tasklist.filter.currenttags,
            buttons = {
                awful.button({ }, 1, function (c)
                    c:activate { context = "tasklist", action = "toggle_minimization" }
                end),
                awful.button({ }, 3, function() awful.menu.client_list { theme = { width = 250 } } end),
                awful.button({ }, 4, function() awful.client.focus.byidx(-1) end),
                awful.button({ }, 5, function() awful.client.focus.byidx( 1) end),
            }
        }

        -- Keyboard map indicator and switcher
        local kb_layout = awful.widget.keyboardlayout()
        -- Create a textclock widget
        local clock = wibox.widget.textclock()

        -- Create the wibox
        s.mywibox = awful.wibar {
            position = "top",
            screen   = s,
            widget   = {
                layout = wibox.layout.align.horizontal,
                { -- Left widgets
                    layout = wibox.layout.fixed.horizontal,
                    --[[ mylauncher, ]]
                    s.mytaglist,
                    s.mypromptbox,
                },
                s.mytasklist, -- Middle widget
                { -- Right widgets
                    layout = wibox.layout.fixed.horizontal,
                    kb_layout,
                    wibox.widget.systray(),
                    clock,
                    s.mylayoutbox,
                },
            }
        }

        -- Set wibar
        --[[ if s._wibox then s._wibox:remove() end ]]
        --[[ beautiful.at_screen_connect(s) ]]
        --[[ awesome.register_xproperty("_NET_WM_NAME", "string") ]]
        --[[ s._wibox:set_xproperty("_NET_WM_NAME", "Wibar") ]]
    end)
end

return M
