--
-- I'm moving away from Wezterm.  It has some bugs or behaviors that
-- are impacting my productivity or that I find less than ideal
--   - Bug: Issues with rendering the window.  Sometimes the edge
--     of the pane does not appear to be the actual edge of the pane.
--     I resize the windows which forces the whole window to be redrawn
--     and it fixes the issue
--   - Bug: Gets stuck automatically switching between panes within a
--     tab.  I need to close the tab to keep working which has led to
--     an interruption in work or claude sessions.
--   - Wezterm's multiplexer manages all the windows so when a single
--     window is closed they all close together, then will all be
--     recreated together.  I prefer to have each window be it's own
--     session in the multiplexer

local wezterm = require("wezterm")
local config = wezterm.config_builder()
local act = wezterm.action

config.font = wezterm.font("JetBrainsMono Nerd Font Mono")
config.font_size = 16
config.color_scheme = "ForestBlue"

-- There is a weird thing with the nightly wezterm on macOS 27
-- where the title bar is completely transparent so we want to
-- add some opacity
config.window_background_opacity = 0.99

-- Start mux server so it runs in the background so sessions can be restored
config.unix_domains = {
	{ name = "unix" },
}
config.default_gui_startup_args = { "connect", "unix" }

-- Set leader key to "Space"
config.leader = { key = "Space", mods = "CTRL", timeout_milliseconds = 1000 }

-- Remove copying text by only highlighting it
config.mouse_bindings = {
	{
		event = { Up = { streak = 1, button = "Left" } },
		mods = "NONE",
		action = act.Nop,
	},
}

require("lua.keys").apply_to_config(config)
-- config.status_update_interval = 1000
require("lua.status")

return config
