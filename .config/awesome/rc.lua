-- If LuaRocks is installed, make sure that packages installed through it are
-- found (e.g. lgi). If LuaRocks is not installed, do nothing.
pcall(require, "luarocks.loader")

-- Standard awesome library
local gears = require("gears")
local awful = require("awful")
require("awful.autofocus")
-- Widget and layout library
local wibox = require("wibox")
-- Theme handling library
local beautiful = require("beautiful")
-- Notification library
local naughty = require("naughty")
-- Enable hotkeys help widget for VIM and other apps
-- when client with a matching name is opened:
require("awful.hotkeys_popup.keys")

-- {{{ Error handling
-- Check if awesome encountered an error during startup and fell back to
-- another config (This code will only ever execute for the fallback config)
if awesome.startup_errors then
    naughty.notify({
        preset = naughty.config.presets.critical,
        title = "Oops, there were errors during startup!",
        text = awesome.startup_errors
    })
end

-- Handle runtime errors after startup
do
    local in_error = false
    awesome.connect_signal("debug::error", function(err)
        -- Make sure we don't go into an endless error loop
        if in_error then return end
        in_error = true

        naughty.notify({
            preset = naughty.config.presets.critical,
            title = "Oops, an error happened!",
            text = tostring(err)
        })
        in_error = false
    end)
end
-- }}}


-- {{{ Variable definitions
-- Themes define colours, icons, font and wallpapers.
beautiful.init(gears.filesystem.get_themes_dir() .. "default/theme.lua")

-- This is used later as the default terminal and editor to run.
terminal = "kitty"
-- editor = os.getenv("EDITOR") or "nano"
editor = "nvim"
editor_cmd = terminal .. " -e " .. editor

-- Default modkey.
-- Usually, Mod4 is the key with a logo between Control and Alt.
-- If you do not like this or do not have such a key,
-- I suggest you to remap Mod4 to another key using xmodmap or other tools.
-- However, you can use another modifier like Mod1, but it may interact with others.
modkey = "Mod4"

beautiful.useless_gap = 15


--  █░░ ▄▀█ █░█ █▄░█ █▀▀ █░█
--  █▄▄ █▀█ █▄█ █░▀█ █▄▄ █▀█

awful.spawn.with_shell("picom")
awful.spawn.once("gnome-keyring-daemon -sd")

-- authentication dialogue for GUI apps
awful.spawn.once("/home/roy/dotfiles/my-scripts/polkitkdeauth.sh")

-- systray app for
awful.spawn.once("blueman-applet")

-- front-end that allows to manage removable media
awful.spawn("pkill udiskie")
awful.spawn.once("udiskie --no-automount --smart-tray")

-- systray app for Network/Wifi
awful.spawn.once("nm-applet --indicator")

-- Bar
awful.spawn("killall polybar")
awful.spawn.once("polybar")

-- things we should add
-- 1. bar
-- 2. clipboard manager which handles texts and images
-- 3. wallpayper deamon
-- 3.5 (maybe) battery notifications


-- █ █▄░█ █▀█ █░█ ▀█▀
-- █ █░▀█ █▀▀ █▄█ ░█░

awful.spawn("setxkbmap -layout 'us,ir' -option 'grp:win_space_toggle'")


-- █░░ ▄▀█ █▄█ █▀█ █░█ ▀█▀ █▀
-- █▄▄ █▀█ ░█░ █▄█ █▄█ ░█░ ▄█

-- Table of layouts to cover with awful.layout.inc, order matters.
awful.layout.layouts = {
    awful.layout.suit.tile,
    awful.layout.suit.tile.left,
    -- awful.layout.suit.floating,
    -- awful.layout.suit.tile.bottom,
    -- awful.layout.suit.tile.top,
    -- awful.layout.suit.fair,
    -- awful.layout.suit.fair.horizontal,
    -- awful.layout.suit.spiral,
    -- awful.layout.suit.spiral.dwindle,
    -- awful.layout.suit.max,
    -- -- awful.layout.suit.max.fullscreen,
    -- awful.layout.suit.magnifier,
    -- awful.layout.suit.corner.nw,
    -- awful.layout.suit.corner.ne,
    -- awful.layout.suit.corner.sw,
    -- awful.layout.suit.corner.se,
}
-- }}}


-- Enable sloppy focus, so that focus follows mouse.
client.connect_signal("mouse::enter", function(c)
    c:emit_signal("request::activate", "mouse_enter", { raise = false })
end)

client.connect_signal("focus", function(c) c.border_color = beautiful.border_focus end)
client.connect_signal("unfocus", function(c) c.border_color = beautiful.border_normal end)
-- }}}

client.connect_signal("focus", function(c)
    c.border_color = beautiful.border_focus


    if c.name == "htop-flt" then
        c.opacity = 1
    else
        c.opacity = 0.98
    end
end)
client.connect_signal("unfocus", function(c)
    c.border_color = beautiful.border_normal
    c.opacity = 0.95
end)


-- █▀ █▀█ █░█ █▀█ █▀▀ █▀▀
-- ▄█ █▄█ █▄█ █▀▄ █▄▄ ██▄

require("rc.Menu")
require("rc.Wibar")
require("rc.KeyBindings")
require("rc.WindowRules")
