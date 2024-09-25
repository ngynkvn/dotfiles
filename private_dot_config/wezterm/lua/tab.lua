local wezterm = require("wezterm")
-- This function returns the suggested title for a tab.
-- It prefers the title that was set via `tab:set_title()`
-- or `wezterm cli set-tab-title`, but falls back to the
-- title of the active pane in that tab.
local function tab_title(tab_info)
	local title = tab_info.tab_title
	-- if the tab title is explicitly set, take that
	if title and #title > 0 then
		return title
	end
	-- Otherwise, use the title from the active pane
	-- in that tab
	return tab_info.active_pane.title
end

local M = {
	replace = {
		vim = {
			format = { Foreground = { AnsiColor = "Green" } },
			icon = wezterm.nerdfonts.linux_neovim,
		},
		python = {
			format = { Foreground = { AnsiColor = "Yellow" } },
			icon = wezterm.nerdfonts.dev_python,
		},
	},
	_fmt = function(title, find, format, icon)
		local _, j = title:find(find)
		if j == nil then
			return nil
		end
		-- NOTE: looks like a bug, submit a PR / issue.
		return {
			format,
			{ Text = icon },
			"ResetAttributes",
			{ Text = title:sub(j + 1) },
		}
	end,
}
wezterm.on("format-tab-title", function(tab, tabs, panes, config, hover, max_width)
	---@type string
	local title = tab_title(tab)
	for cmd, replace in pairs(M.replace) do
		local formatted = M._fmt(title, cmd, replace.format, replace.icon)
		if formatted ~= nil then
			return wezterm.format(formatted)
		end
	end
end)
