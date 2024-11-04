local wezterm = require("wezterm")
-- https://github.com/wez/wezterm/discussions/5369
local M = {
	fonts = {
		Lilex = require("font-config.lilex"),
		["Victor Mono"] = require("font-config.victor-mono"),
		["Input Mono Condensed"] = require("font-config.input-mono"),
		["Monaspace Neon Var"] = require("font-config.monaspace-neon"),
		["Iosevka Term"] = require("font-config.iosevka-term"),
		["CartographCF Nerd Font Mono"] = require("font-config.cartograph-cf"),
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
	font(config)
end

function M.selector_action(window, pane)
	local choices = {}
	for k, _ in pairs(M.fonts) do
		table.insert(choices, { label = k })
	end
	table.sort(choices, function(a, b)
		return a.label < b.label
	end)

	window:perform_action(
		wezterm.action.InputSelector({
			action = wezterm.action_callback(function(window, pane, id, label)
				local overrides = window:get_config_overrides() or {}
				M.select(overrides, label)
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
