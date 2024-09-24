local wezterm = require("wezterm")

local config = wezterm.config_builder()

config.window_frame = {
	-- The font used in the tab bar.
	font = wezterm.font("JetBrainsMono Nerd Font", { weight = "Light" }),
	font_size = 12.0,
	-- The overall background color of the tab bar when the window is focused
	active_titlebar_bg = "#110011",
	-- The overall background color of the tab bar when the window is not focused
	inactive_titlebar_bg = "#110011",
}

config.background = {
	{
		source = { Color = "black" },
		height = "100%",
		width = "100%",
	},
	-- {
	-- 	source = {
	-- 		Gradient = {
	-- 			preset = "Magma",
	-- 			orientation = {
	-- 				--Linear = { angle = -45.0 },
	-- 				Radial = { radius = 2.25, cx = 0.2, cy = 0.2 },
	-- 			},
	-- 		},
	-- 	},
	-- 	hsb = { brightness = 0.01, saturation = 0.05 },
	-- 	height = "100%",
	-- 	width = "100%",
	-- 	opacity = 0.02,
	-- },
	{
		source = {
			File = wezterm.home_dir .. "/.local/background/noise.jpg",
		},
		hsb = { brightness = 0.02, saturation = 0.2 },
		opacity = 0.25,
		repeat_y = "Mirror",
		attachment = { Parallax = 0.2 },
	},
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

config.colors = require("lua/colors")
config.font = wezterm.font("JetBrainsMono Nerd Font", { weight = "ExtraLight" })
config.font_size = 14.0

config.default_cursor_style = "BlinkingBlock"
config.animation_fps = 1
config.cursor_blink_ease_in = "Constant"
config.cursor_blink_ease_out = "Constant"
config.cursor_blink_rate = 720

return config
