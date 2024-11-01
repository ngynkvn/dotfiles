local wezterm = require("wezterm") --[[@as Wezterm]]

local M = {}
-- stylua: ignore
M.icons = {
	["git"]     = {icon = wezterm.nerdfonts.dev_git,             color = "Red"},
	["go"]      = {icon = wezterm.nerdfonts.seti_go,             color = "Blue"},
	["lua"]     = {icon = wezterm.nerdfonts.seti_lua,            color = "Blue"},
	["fish"]    = {icon = wezterm.nerdfonts.md_fish,             color = "Lime"},
	["nvim"]    = {icon = wezterm.nerdfonts.linux_neovim,        color = "Green"},
	["vim"]     = {icon = wezterm.nerdfonts.linux_neovim,        color = "Green"},
	["btop"]    = {icon = wezterm.nerdfonts.md_chart_areaspline, color = "Yellow"},
	["lazygit"] = {icon = wezterm.nerdfonts.cod_github,          color = "Yellow"},
	["python"]  = {icon = wezterm.nerdfonts.cod_github,          color = "Yellow"},
}

---@param tab MuxTabObj
---@param max_width number
function M.title(tab, max_width)
	local title = (tab.tab_title and #tab.tab_title > 0) and tab.tab_title or tab.active_pane.title
	local process, other = title:match("^(%S+)%s*%-?%s*%s*(.*)$")

	if M.icons[process] then
		local i = M.icons[process]
		title = wezterm.format({ { Foreground = { AnsiColor = i.color } }, { Text = i.icon } }) .. " " .. (other or "")
	end

	return " " .. title .. " "
end

---@param config Config
function M.setup(config)
	config.use_fancy_tab_bar = true
	config.tab_bar_at_bottom = true
	config.hide_tab_bar_if_only_one_tab = false

	---@diagnostic disable-next-line: missing-fields
	config.window_frame = {
		font = wezterm.font_with_fallback({
			{ family = "Iosevka", weight = "Regular" },
			{
				family = "Symbols Nerd Font Mono",
				weight = "Regular",
				stretch = "Normal",
				style = "Normal",
				scale = 0.8,
			},
		}),
		font_size = 14.0,
		active_titlebar_bg = "#111111",
	}

	wezterm.on("format-tab-title", function(tab, tabs, panes, config, hover, max_width)
		local title = M.title(tab, max_width)

		local ret = tab.is_active
				and {
					{ Attribute = { Intensity = "Bold" } },
					{ Attribute = { Italic = true } },
				}
			or {}
		ret[#ret + 1] = { Text = title }
		---@diagnostic disable-next-line: return-type-mismatch
		return ret
	end)
end

return M
