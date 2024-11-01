local wezterm = require("wezterm")
-- https://github.com/wez/wezterm/discussions/5369
local M = {
	fonts = {
		{ family = "Lilex" },
		{ family = "Input Mono Condensed" },
		{
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
		},
		{
			family = "Iosevka Term",
			weight = 500,
			harfbuzz_features = { "liga", "calt" },
		},
	},
}

function M.register(opts)
	for _, v in ipairs(opts or {}) do
		local name = v.name or v.mod
		M.fonts[name] = v
	end
end

function M.select(config, name)
	local font = M.fonts[name]
	config.font = wezterm.font_with_fallback({
		font,
		{ family = "Symbols Nerd Font Mono", weight = "Regular", stretch = "Normal", style = "Normal", scale = 0.8 },
	})
end

function M.selector_action(window, pane)
	local choices = {}
	for k, spec in pairs(M.fonts) do
		table.insert(choices, { label = spec.family, id = tostring(k) })
	end
	table.sort(choices, function(a, b)
		return a.label < b.label
	end)

	window:perform_action(
		wezterm.action.InputSelector({
			action = wezterm.action_callback(function(window, pane, id)
				local overrides = window:get_config_overrides() or {}
				M.select(overrides, tonumber(id))
				window:set_config_overrides(overrides)
			end),
			title = "Font Selector",
			choices = choices,
			fuzzy = true,
		}),
		pane
	)
end

return M
