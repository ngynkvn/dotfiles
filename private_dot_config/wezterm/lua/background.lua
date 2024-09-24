local wezterm = require("wezterm")

return {
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
