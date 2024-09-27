local wezterm = require("wezterm") --[[@as Wezterm]]
local config = wezterm.config_builder()

require("lua/tab").setup(config)
config.colors = require("lua/colors")
config.background = require("lua/background")

config.window_decorations = "RESIZE"
config.tab_bar_at_bottom = true

-- Pixels
config.window_padding = {
	left = 4,
	right = 4,
	top = "0.5cell",
	bottom = 0,
}

-- Dim inactive pane
config.inactive_pane_hsb = { saturation = 0.9, brightness = 0.8 }
-- Fonts
config.font = wezterm.font("Lilex Nerd Font", { weight = "Regular" })
config.font_size = 14.0
config.font_rules = {
	{
		-- Make bold really stand out
		intensity = "Bold",
		font = wezterm.font("Lilex Nerd Font", { foreground = "#f1a26e" }),
	},
}

-- Cursor
config.default_cursor_style = "BlinkingBlock"
config.animation_fps = 1
config.cursor_blink_ease_in = "Constant"
config.cursor_blink_ease_out = "Constant"
config.cursor_blink_rate = 800

return config
