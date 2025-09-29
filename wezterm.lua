local wezterm = require('wezterm')
local act = wezterm.action
local config = {}

-- for windows

config.automatically_reload_config = true

-- 字形
-- https://github.com/ryanoasis/nerd-fonts/releases/download/v3.4.0/Hack.zip
-- https://fonts.google.com/noto/specimen/Noto+Color+Emoji

config.font = wezterm.font_with_fallback {
	'Hack Nerd Font Mono',
	"PingFang TC",
	"Noto Color Emoji",
}
config.font_size = 16
config.color_scheme = 'Tomorrow Night Eighties'
config.initial_cols = 160
config.initial_rows = 50
config.use_fancy_tab_bar = true
-- config.hide_tab_bar_if_only_one_tab = true
config.text_background_opacity = 1.0
config.window_background_opacity = 1.0
config.scrollback_lines = 1500
config.freetype_load_flags = "DEFAULT"
-- config.enable_mouse_reporting = true
config.window_close_confirmation = 'NeverPrompt'
config.window_decorations = 'RESIZE'
config.default_cursor_style = 'SteadyBar'
-- 修正 windows 貼上到 wezterm 多空行
config.canonicalize_pasted_newlines = 'LineFeed'

-- 歐洲語系的鍵盤才會用到 dead keys
config.use_dead_keys = false

config.keys = {
    {
        key = 't',
        mods = 'CTRL',
        action = wezterm.action.SpawnTab 'CurrentPaneDomain',
    },
    {
        key = 'w',
        mods = 'CTRL',
        action = wezterm.action.CloseCurrentTab { confirm = true },
    },
	
}

-- 在定義 config.keys 之後，使用 table.insert 將新的設定加入。

-- F1 到 F12 的 Tab 切換設定
for i = 1, 12 do
  -- i-1 是 Tab 的索引 (從 0 開始)
  table.insert(config.keys, {
    key = 'F' .. tostring(i),
    mods = 'ALT', -- Alt + F1-F12 鍵
    action = act.ActivateTab(i - 1),
  })
end



config.mouse_bindings = {
    -- 滑鼠右鍵行為綁定為貼上
    {
      event = { Down = { streak = 1, button = 'Right' } },
      mods = 'NONE', -- 沒有額外按鍵
      action = wezterm.action.PasteFrom 'Clipboard',
    },
  }

-- 設定預設的 domain 為你的 Debian 發行版
-- config.default_domain = 'WSL:Debian'

return config

