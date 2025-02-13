local wezterm = require("wezterm") --[[@as Wezterm]]
local fonts = require("fonts")

local config = wezterm.config_builder() ---@class Config
require("lua/tab").setup(config)
require("lua/keys").setup(config)
config.color_scheme = "catppuccin-mocha"
--config.colors = require("lua/colors")
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
-- Fonts
require("font-config.iosevka-term")(config)
config.inactive_pane_hsb = { saturation = 0.9, brightness = 0.8 }

-- Cursor
config.default_cursor_style = "BlinkingBlock"
config.animation_fps = 1
config.cursor_blink_ease_in = "Constant"
config.cursor_blink_ease_out = "Constant"
config.cursor_blink_rate = 800

if wezterm.target_triple == "x86_64-pc-windows-msvc" then
	config.default_domain = "WSL:Ubuntu-22.04"
end

wezterm.on("augment-command-palette", function(window, pane)
	return {
		{
			brief = "Font Switcher",
			-- TODO: font icon?
			icon = "md_format_font",
			action = wezterm.action_callback(fonts.selector_action),
		},
	}
end)

return config
