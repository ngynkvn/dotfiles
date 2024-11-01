local wezterm = require("wezterm") --[[@as Wezterm]]
return function(config)
	local font = {
		family = "Monaspace Neon Var",
		attributes = {
			weight = 400,
			harfbuzz_features = {
				"ss01",
				"ss02",
				"ss03",
				"ss04",
				"ss05",
				"ss06",
				"ss07",
				"ss08",
				"ss09",
				"liga",
				"calt",
			},
		},
	}
	config.font = wezterm.font_with_fallback({
		font,
		{ family = "Symbols Nerd Font Mono", weight = "Regular", stretch = "Normal", style = "Normal", scale = 0.8 },
	})
	config.font_size = 16
	config.font_rules = {
		-- Make bold really stand out
		{ intensity = "Bold", font = wezterm.font(font, { foreground = "#f1a26e" }) },
	}
end
