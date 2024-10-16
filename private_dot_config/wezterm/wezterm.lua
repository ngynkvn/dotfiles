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
config.font_size = 13
config.font_rules = {
	{
		-- Make bold really stand out
		intensity = "Bold",
		font = wezterm.font("JetBrains Mono", { foreground = "#f1a26e" }),
	},
}
config.anti_alias_custom_block_glyphs = false

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
