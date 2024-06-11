local wezterm = require("wezterm")
local act = wezterm.action
local config = {}
----------------
--> Settings <--
----------------
config.font = wezterm.font({ family = "Operator Mono Lig" })
config.font_size = 19
config.window_background_opacity = 0.75
config.text_background_opacity = 1.0
config.adjust_window_size_when_changing_font_size = false
config.animation_fps = 60
config.cursor_blink_ease_in = "Linear"
config.cursor_blink_ease_out = "Linear"
config.cursor_blink_rate = 1100
config.window_decorations = "RESIZE"
config.default_cursor_style = "BlinkingUnderline"
config.automatically_reload_config = true
config.enable_tab_bar = false
config.audible_bell = "Disabled"
config.window_close_confirmation = "NeverPrompt"

config.colors = {
	foreground = "#CBE0F0",
	background = "#011423",
	cursor_bg = "#47FF9C",
	cursor_border = "#47FF9C",
	cursor_fg = "#011423",
	selection_bg = "#706b4e",
	selection_fg = "#f3d9c4",
	ansi = { "#214969", "#E52E2E", "#44FFB1", "#FFE073", "#0FC5ED", "#a277ff", "#24EAF7", "#24EAF7" },
	brights = { "#214969", "#E52E2E", "#44FFB1", "#FFE073", "#A277FF", "#a277ff", "#24EAF7", "#24EAF7" },
}
config.window_padding = {
	left = 2,
	right = 2,
	top = 8,
	bottom = 8,
}
config.inactive_pane_hsb = {
	saturation = 1.0,
	brightness = 1.0,
}
config.foreground_text_hsb = {
	hue = 1.0,
	saturation = 1.0,
	brightness = 1.0,
}
config.enable_wayland = false
return config
