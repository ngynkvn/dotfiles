local wezterm = require("wezterm")

return {
	{
		source = { Color = "00111a" },
		width = "100%",
		height = "100%",
	},
	{
		source = { File = wezterm.home_dir .. "/.local/share/background/noise-2.png" },
		hsb = { brightness = 0.2 },
		opacity = 0.5,
		height = 700,
		width = 700,
	},
}
