local wezterm = require("wezterm")

local config = wezterm.config_builder()

config.color_scheme = "Tokyo Night"
config.force_reverse_video_cursor = true

config.font = wezterm.font("DankMono Nerd Font")
config.font_size = 19

config.enable_tab_bar = false

config.window_decorations = "RESIZE"

return config
