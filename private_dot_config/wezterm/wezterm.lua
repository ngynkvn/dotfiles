local wezterm = require("wezterm") --[[@as Wezterm]]
local config = wezterm.config_builder()

require("lua/tab").setup(config)
require("lua/keys").setup(config)
config.colors = require("lua/colors")
config.background = require("lua/background")

config.window_decorations = "RESIZE"
config.tab_bar_at_bottom = true

-- Pixels
config.window_padding = {
	left = 0,
	right = 2,
	top = "0.25cell",
	bottom = 0,
}

-- I'm very indecisive
local font = {} -- [[@type FontAttributes]]
font = { family = "Lilex" }
font = { family = "Input Mono Narrow" }
font = { family = "Input Mono Condensed" }
font = {
	family = "Monaspace Neon Var",
	weight = 400,
	harfbuzz_features = { "ss01", "ss02", "ss03", "ss04", "ss05", "ss06", "ss07", "ss08", "ss09", "liga", "calt" },
}
font = {
	family = "Iosevka Term",
}
-- Dim inactive pane
config.inactive_pane_hsb = { saturation = 0.9, brightness = 0.8 }
-- Fonts
config.font = wezterm.font(font)
config.font_size = 18
config.font_rules = {
	{
		-- Make bold really stand out
		intensity = "Bold",
		font = wezterm.font(font, { foreground = "#f1a26e" }),
	},
}

-- Cursor
config.default_cursor_style = "BlinkingBlock"
config.animation_fps = 1
config.cursor_blink_ease_in = "Constant"
config.cursor_blink_ease_out = "Constant"
config.cursor_blink_rate = 800

if wezterm.target_triple == "x86_64-pc-windows-msvc" then
	config.default_domain = "WSL:Ubuntu-22.04"
end

return config
