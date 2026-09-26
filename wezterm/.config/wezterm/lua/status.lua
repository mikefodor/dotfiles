local wezterm = require("wezterm")

wezterm.on("update-status", function(window)
	window:set_right_status(os.date("%H:%M:%S") .. "  ")
end)
