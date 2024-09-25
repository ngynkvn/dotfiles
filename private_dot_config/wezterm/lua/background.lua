local wezterm = require("wezterm")

return {
	{
		source = { Gradient = { preset = "Greys" } },
		width = "100%",
		height = "100%",
	},
	{
		source = { File = wezterm.home_dir .. "/.local/share/background/noise-2.png" },
		hsb = { brightness = 0.1 },
		height = 700,
		width = 700,
	},
}
