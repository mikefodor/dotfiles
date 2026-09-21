local wezterm = require("wezterm")

local config = wezterm.config_builder()
local act = wezterm.action

config.font = wezterm.font("JetBrainsMono Nerd Font Mono")
config.font_size = 16

-- Remove copying text by only highlighting it
config.mouse_bindings = {
	{
		event = { Up = { streak = 1, button = "Left" } },
		mods = "NONE",
		action = act.Nop,
	},
}

config.leader = { key = "Space", mods = "CTRL", timeout_milliseconds = 1000 }

config.keys = {
	-- { key = "w", mods = "CMD", action = act.DisableDefaultAssignment },
	{
		key = "w",
		mods = "CMD",
		action = wezterm.action_callback(function(window)
			window:set_right_status(wezterm.format({
				{ Foreground = { Color = "orange" } },
				{ Text = "That doesn't close WezTerm tabs" },
			}))
			-- Clear notification after 3 seconds
			wezterm.time.call_after(3, function()
				window:set_right_status("")
			end)
		end),
	},

	-- Create and Close tab
	{ key = "t", mods = "LEADER", action = act.SpawnTab("CurrentPaneDomain") },
	{ key = "w", mods = "LEADER", action = act.CloseCurrentTab({ confirm = true }) },

	{
		key = "r",
		mods = "LEADER",
		action = act.PromptInputLine({
			description = "Name of the tab",
			action = wezterm.action_callback(function(window, line)
				if line then
					window:active_tab():set_title(line)
				end
			end),
		}),
	},

	-- Move between tabs left and right
	{ key = "h", mods = "LEADER|CTRL", action = act.ActivateTabRelative(-1) },
	{ key = "l", mods = "LEADER|CTRL", action = act.ActivateTabRelative(1) },

	-- Split window into panes
	{
		key = "|",
		mods = "LEADER",
		action = act.SplitPane({
			direction = "Right",
			size = { Percent = 50 },
		}),
	},
	{
		key = "-",
		mods = "LEADER",
		action = act.SplitPane({
			direction = "Down",
			size = { Percent = 50 },
		}),
	},

	-- Navigate panes
	{ key = "h", mods = "LEADER", action = act.ActivatePaneDirection("Left") },
	{ key = "l", mods = "LEADER", action = act.ActivatePaneDirection("Right") },
	{ key = "j", mods = "LEADER", action = act.ActivatePaneDirection("Down") },
	{ key = "k", mods = "LEADER", action = act.ActivatePaneDirection("Up") },

	-- Copy mode
	{ key = "v", mods = "LEADER", action = act.ActivateCopyMode },
}

return config
