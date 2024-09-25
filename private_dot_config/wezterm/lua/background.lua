local wezterm = require("wezterm")

return {
	{
		source = { Color = "Black" },
		width = "100%",
		height = "100%",
	},
	{
		source = { File = wezterm.home_dir .. "/.local/share/background/noise-2.png" },
		hsb = { brightness = 0.2 },
		opacity = 0.9,
		height = 700,
		width = 700,
	},
}
