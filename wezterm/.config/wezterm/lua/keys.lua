local wezterm = require("wezterm")
local act = wezterm.action

local M = {}

--config.keys = {
-- { key = "w", mods = "CMD", action = act.DisableDefaultAssignment },
function M.apply_to_config(config)
	config.keys = {
		{
			key = "w",
			mods = "CMD",
			action = wezterm.action_callback(function(window, pane)
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
				action = wezterm.action_callback(function(window, pane, line)
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
end

return M
