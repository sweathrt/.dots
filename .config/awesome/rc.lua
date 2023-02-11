pcall(require, "luarocks.loader")

local gears = require("gears")
local awful = require("awful")
local wibox = require("wibox")
local beautiful = require("beautiful")
local naughty = require("naughty")
local ruled = require("ruled")
local menubar = require("menubar")
local hotkeys_popup = require("awful.hotkeys_popup")

require("awful.hotkeys_popup.keys")
require("awful.autofocus")

local config   = require("config")

-- {{{ Error handling
config.errors.init()
-- }}}

-- {{{ Variable definitions
config.vars.init({
    terminal     = "kitty",
    editor       = os.getenv("EDITOR") or "nvim",
    browser      ="librewolf",
    theme        = "gruvbox",
    titlebars    = false,
    sloppy_focus = false,
})
config.vars.editor_cmd = config.vars.terminal .. " -e " .. config.vars.editor
-- }}}

-- {{{ Modules
config.tags.init()
-- }}}

-- {{{ Bindings
config.keys.init()
config.bindings.init()
-- }}}

-- {{{ Theme 
local theme_path = string.format("%s/.config/awesome/themes/%s/theme.lua", os.getenv("HOME"), config.vars.theme)
beautiful.init(theme_path)
-- }}}

-- {{{ Configs
config.menu.init()
config.wallpaper.init()
config.screens.init()
config.rules.init()
config.titlebars.init()
config.notifications.init()
-- }}}
