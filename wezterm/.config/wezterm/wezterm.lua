local wezterm = require("wezterm")
local config = wezterm.config_builder()
local act = wezterm.action

config.font = wezterm.font("JetBrainsMono Nerd Font Mono")
config.font_size = 16
config.color_scheme = "ForestBlue"

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
