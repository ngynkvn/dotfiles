local wezterm = require("wezterm") --[[@as Wezterm]]
return function(config)
	local font = { family = "Victor Mono", weight = 600 }
	config.font = wezterm.font_with_fallback({
		font,
		{ family = "Symbols Nerd Font Mono", weight = "Regular", stretch = "Normal", style = "Normal", scale = 0.8 },
	})
	config.font_size = 16
	config.font_rules = {
		-- Make bold really stand out
		{ intensity = "Bold", font = wezterm.font(font, { foreground = "#f1a26e" }) },
		{
			--intensity = "Normal",
			italic = true,
			font = wezterm.font(font, { style = "Oblique", weight = 400 }),
		},
	}
end
