local wezterm = require("wezterm") --[[@as Wezterm]]
local M = {}

local DisabledDefaults = {
	{ "m", "CMD" },
	{ "%", "ALT|CTRL" },
	{ '"', "ALT|CTRL" },
	{ '"', "SHIFT|ALT|CTRL" },
	{ "'", "SHIFT|ALT|CTRL" },
	{ "%", "SHIFT|ALT|CTRL" },
	{ "5", "SHIFT|ALT|CTRL" },
}

function M.setup(config)
	config.keys = {
		{ key = "d", mods = "CMD", action = wezterm.action.SplitHorizontal({ domain = "CurrentPaneDomain" }) },
		{ key = "d", mods = "CMD|SHIFT", action = wezterm.action.SplitVertical({ domain = "CurrentPaneDomain" }) },
		--{ key = "\\", mods = "CMD|SHIFT", action = wezterm.action.SplitHorizontal({ domain = "CurrentPaneDomain" }) },

		{ key = "h", mods = "ALT", action = wezterm.action.ActivatePaneDirection("Left") },
		{ key = "j", mods = "ALT", action = wezterm.action.ActivatePaneDirection("Down") },
		{ key = "k", mods = "ALT", action = wezterm.action.ActivatePaneDirection("Up") },
		{ key = "l", mods = "ALT", action = wezterm.action.ActivatePaneDirection("Right") },

		{ key = "h", mods = "ALT|SHIFT", action = wezterm.action.AdjustPaneSize({ "Left", 1 }) },
		{ key = "j", mods = "ALT|SHIFT", action = wezterm.action.AdjustPaneSize({ "Down", 1 }) },
		{ key = "k", mods = "ALT|SHIFT", action = wezterm.action.AdjustPaneSize({ "Up", 1 }) },
		{ key = "l", mods = "ALT|SHIFT", action = wezterm.action.AdjustPaneSize({ "Right", 1 }) },

		{ key = "h", mods = "CMD", action = wezterm.action.ActivateTabRelative(-1) },
		{ key = "l", mods = "CMD", action = wezterm.action.ActivateTabRelative(1) },

		{ key = "h", mods = "CMD|SHIFT", action = wezterm.action.MoveTabRelative(-1) },
		{ key = "l", mods = "CMD|SHIFT", action = wezterm.action.MoveTabRelative(1) },

		{ key = "p", mods = "CMD|SHIFT", action = wezterm.action.ActivateCommandPalette },
		{ key = "n", mods = "CMD|SHIFT", action = wezterm.action.ShowTabNavigator },
	}
	for _, value in ipairs(DisabledDefaults) do
		local key, mods = value[1], value[2]
		table.insert(config.keys, { key = key, mods = mods, action = wezterm.action.DisableDefaultAssignment })
	end
end
return M
