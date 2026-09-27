local wezterm = require("wezterm")
local act = wezterm.action

local M = {}

function M.apply_to_config(config)
	config.key_tables = {
		activate_tab = {},
		move_tab = {},
	}

	-- Set key table for actions to activate tabs
	for i = 0, 9 do
		table.insert(config.key_tables.activate_tab, {
			key = tostring(i),
			action = act.ActivateTab(i - 1),
		})
	end
	table.insert(config.key_tables.activate_tab, {
		key = "Escape",
		action = act.PopKeyTable,
	})

	-- Set key table for actions to moving tabs
	for i = 1, 9 do
		table.insert(config.key_tables.move_tab, {
			key = tostring(i),
			action = act.MoveTab(i - 1),
		})
	end
	table.insert(config.key_tables.activate_tab, {
		key = "Escape",
		action = act.PopKeyTable,
	})

	config.keys = {

		-- Don't delete tab or window on CMD+w.  It's used all the time for
		-- browser tabs and I accidentally delete my terminals too often
		-- with it.
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
		{ key = "w", mods = "LEADER", action = act.CloseCurrentTab({ confirm = false }) },

		{
			key = ",",
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

		-- Activate tabs
		{
			key = "a",
			mods = "LEADER",
			action = act.ActivateKeyTable({
				name = "activate_tab",
				timeout_milliseconds = 3000,
			}),
		},
		-- { key = tostring(i), modes = "LEADER|CTRL", action = act.ActivateTab(i - 1) },

		-- Move tabs
		{
			key = "m",
			mods = "LEADER|CTRL",
			action = act.ActivateKeyTable({
				name = "move_tab",
				timeout_milliseconds = 3000,
			}),
		},

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
