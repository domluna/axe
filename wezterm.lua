-- Pull in the wezterm API
local wezterm = require 'wezterm'

-- This table will hold the configuration.
local config = {}

-- In newer versions of wezterm, use the config_builder which will
-- help provide clearer error messages
if wezterm.config_builder then
  config = wezterm.config_builder()
end

-- This is where you actually apply your config choices

-- For example, changing the color scheme:
config.font = wezterm.font 'IBM Plex Mono'
-- config.font = wezterm.font 'JuliaMono'
-- config.color_scheme = 'ayu'
config.color_scheme = 'Gruvbox Dark (Gogh)'
-- config.color_scheme = 'Chalk (Gogh)'

config.enable_wayland = true
config.mouse_bindings = {
  -- Ctrl-Shift-C to copy
  {
    event = { Up = { streak = 1, button = 'Left' } },
    mods = 'CTRL|SHIFT',
    action = wezterm.action {
      CopyTo = 'Clipboard',
    },
  },

  -- Ctrl-Shift-V to paste
  {
    event = { Down = { streak = 1, button = 'Middle' } },
    mods = 'CTRL|SHIFT',
    action = wezterm.action { PasteFrom = 'Clipboard' },
  },
}

config.audible_bell = 'Disabled'
-- and finally, return the configuration to wezterm
return config
