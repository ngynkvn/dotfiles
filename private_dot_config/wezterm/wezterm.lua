local wezterm = require("wezterm")
local config = wezterm.config_builder()

config.colors = require("lua/colors")
config.background = require("lua/background")

-- Window
config.window_frame = {
	font = wezterm.font("JetBrainsMono Nerd Font", { weight = "Light" }),
	font_size = 12.0,
	active_titlebar_bg = "#110011",
	inactive_titlebar_bg = "#110011",
}
config.window_decorations = "RESIZE"
config.use_fancy_tab_bar = true
config.tab_bar_at_bottom = true
-- TODO: https://wezfurlong.org/wezterm/config/lua/config/tab_bar_style.html

-- Pixels
config.window_padding = {
	left = 8,
	right = 8,
	top = 8,
	bottom = 8,
}

-- Fonts
config.font = wezterm.font("JetBrainsMono Nerd Font", { weight = "ExtraLight" })
config.font_size = 14.0
-- Make bold really stand out
config.font_rules = {
	{
		intensity = "Bold",
		font = wezterm.font("JetBrainsMono Nerd Font", { foreground = "#f1a26e" }),
	},
}

-- Cursor
config.default_cursor_style = "BlinkingBlock"
config.animation_fps = 1
config.cursor_blink_ease_in = "Constant"
config.cursor_blink_ease_out = "Constant"
config.cursor_blink_rate = 720

return config
