-- Pull in the wezterm API
local wezterm = require("wezterm")

-- This will hold the configuration.
local config = wezterm.config_builder()

-- This is where you actually apply your config choices

-- For example, changing the color scheme:
config.color_scheme = "AdventureTime"

-- colors
config.color_scheme = "nord"
config.window_background_opacity = 0.93
-- font
config.font = wezterm.font("Cica")
config.font_size = 16.0

-- keybinds
config.disable_default_key_bindings = true
config.leader = { key = "t", mods = "CTRL", timeout_milliseconds = 2000 }
config.keys = require("keybinds").keys
config.key_tables = require("keybinds").key_tables

-- tab bar
config.use_fancy_tab_bar = false
config.tab_bar_at_bottom = true
config.tab_max_width = 100

-- tabline.wez
local tabline = wezterm.plugin.require("https://github.com/michaelbrusegard/tabline.wez")
tabline.setup({
	options = {
		-- theme = "catppuccin-mocha",
		theme = "cyberpunk",
		-- theme = "Cobalt Neon",
		section_separators = {
			left = wezterm.nerdfonts.ple_upper_left_triangle,
			right = wezterm.nerdfonts.ple_lower_right_triangle,
		},
		component_separators = {
			left = wezterm.nerdfonts.ple_forwardslash_separator,
			right = wezterm.nerdfonts.ple_forwardslash_separator,
		},
		tab_separators = {
			left = wezterm.nerdfonts.ple_upper_left_triangle,
			right = wezterm.nerdfonts.ple_lower_right_triangle,
		},
		-- color_overrides = {
		theme_overrides = {
			tab = {
				active = { fg = "#091833", bg = "#59c2c6" },
			},
		},
	},
	sections = {
		tab_active = {
			"index",
			{ "process", padding = { left = 0, right = 1 } },
			"",
			{ "cwd", padding = { left = 1, right = 0 } },
			{ "zoomed", padding = 1 },
		},
		tab_inactive = {
			"index",
			{ "process", padding = { left = 0, right = 1 } },
			"󰉋",
			{ "cwd", padding = { left = 1, right = 0 } },
			{ "zoomed", padding = 1 },
		},
	},
})

-- and finally, return the configuration to wezterm
return config
