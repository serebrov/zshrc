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
-- config.color_scheme = 'AdventureTime'


--  line_height = 1.2,
-- config.font = wezterm.font 'JetBrains Mono'
-- => <= >+ >- >| >_ >~ >^ >v
--
-- https://monaspace.githubnext.com/
-- lmimimi
config.font = wezterm.font_with_fallback {
    -- 'Perfect DOS VGA 437',
    'Bitstream Vera Sans Mono',
    -- 'Monaspace Neon',
    -- 'Monaspace Argon',
    -- 'Monaspace Krypton',
    -- 'JetBrains Mono',
    { family = 'Monaco' },
    { family = 'Menlo', scale=1.25 },
    "Symbols Nerd Font Mono",
    "Noto Color Emoji",
}
config.font_size = 14.0
config.color_scheme = 'Github (base16)'

config.window_padding = {
  left = 2,
  right = 2,
  top = 0,
  bottom = 0,
}

-- wezterm.on('update-right-status', function(window, pane)
--   window:set_left_status 'left'
--   window:set_right_status 'right'
-- end)

config.use_fancy_tab_bar = false
config.show_tabs_in_tab_bar = false
config.show_new_tab_button_in_tab_bar = false

-- disable line break icons
-- config.

-- Some default keys, see https://wezfurlong.org/wezterm/config/default-keys.html
--
-- Note: many keys have alternative bindings, and SUPER or CTRL+SHIFT can be
-- used as prefix for most of the keys.
-- Some keybindings have multiple alternatives, like moving between tabs:
-- -- SUPER+SHIFT+{[,]} - previous/next tab
-- -- CTRL+PageUp/PageDown - previous/next tab.
-- -- CTRL-Tab for next tab
--
-- SUPER+n - New window
-- Alt-Enter: Toggle fullscreen
-- SUPER+- / SUPER+= - Increase/decrease font size
-- CTRL+- / CTRL+= - Increase/decrease font size
--
-- SUPER+f - Search
--
-- CTRL+SHIFT+X - Copy mode
-- CTRL+SHIFT+Space - quick select
--
-- CTRL+SHIFT+Arrows - Jump between panes
-- CTRL+SHIFT-ALT+Arrows - Resize panes
--
-- Tabs
-- SUPER+t - New tab
-- SUPER+{1-9} - Switch to tab
-- SUPER+SHIFT+{[,]} - Switch to previous/next tab

-- Adjust keybindings
local alt = "ALT"
local ctrl = "CTRL"
local shift = "SHIFT"
local super = "CMD"
local sep = "|"

local shift_ctrl = shift .. sep .. ctrl
local shift_alt_ctrl = shift .. sep .. alt .. sep .. ctrl

local disable = "DisableDefaultAssignment"

-- Note: Ctrl-W conflicts with Vim bindings (like Ctrl-R Ctrl-W in command mode),
-- so we use Ctrl-Alt as a modifier.
config.leader = { key = 'w', mods = 'CTRL | ALT', timeout_milliseconds = 1000 }

-- Redefine keys to split panes
config.keys = {
  -- Disable standard keymaps
  {
      key = "%",
      mods = shift_alt_ctrl,
      action = disable,
  },
  {
      key = '"',
      mods = shift_alt_ctrl,
      action = disable,
  },

  -- Define new keymaps
  {
      -- key = "v",
      -- mods = shift_ctrl,
      key = '%',
      mods = "LEADER",
      action = wezterm.action.SplitPane({
          direction = "Right",
          size = {
              Percent = 50,
          },
      }),
  },
  {
      -- key = "s",
      -- mods = shift_ctrl,
      key = '"',
      mods = "LEADER",
      action = wezterm.action.SplitPane({
          direction = "Down",
          size = {
              Percent = 50,
          },
      }),
  },
}

-- and finally, return the configuration to wezterm
return config