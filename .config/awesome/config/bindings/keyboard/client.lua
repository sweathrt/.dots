-- Client keyboard bindings
local awful = require("awful")
local keys  = require("config.keys")

local M = {}

function M.init()
    client.connect_signal("request::default_keybindings", function()
        awful.keyboard.append_client_keybindings({
            awful.key({ keys.modkey }, "f",
                function (c)
                    c.fullscreen = not c.fullscreen
                    c:raise()
                end,
                { description = "toggle fullscreen", group = "client" }),

            awful.key({ keys.modkey }, "q", function (c) c:kill()                         end,
                    { description = "close", group = "client" }),

            awful.key({ keys.modkey, "Control" }, "space", awful.client.floating.toggle                     ,
                    { description = "toggle floating", group = "client" }),

            awful.key({ keys.modkey, "Control" }, "Return", function (c) c:swap(awful.client.getmaster()) end,
                    { description = "move to master", group = "client" }),

            awful.key({ keys.modkey }, "o", function (c) c:move_to_screen()               end,
                    { description = "move to screen", group = "client" }),

            awful.key({ keys.modkey }, "t", function (c) c.ontop = not c.ontop            end,
                    { description = "toggle keep on top", group = "client" }),

            awful.key({ keys.modkey }, "n",
                function (c)
                    c.minimized = true
                end ,
                { description = "minimize", group = "client" }),

            awful.key({ keys.modkey }, "m",
                function (c)
                    c.maximized = not c.maximized
                    c:raise()
                end ,
                { description = "(un)maximize", group = "client" }),

            awful.key({ keys.modkey, "Control" }, "m",
                function (c)
                    c.maximized_vertical = not c.maximized_vertical
                    c:raise()
                end ,
                { description = "(un)maximize vertically", group = "client" }),

            awful.key({ keys.modkey, "Shift" }, "m",
                function (c)
                    c.maximized_horizontal = not c.maximized_horizontal
                    c:raise()
                end ,
                { description = "(un)maximize horizontally", group = "client" }),
        })
    end)
end

return M
