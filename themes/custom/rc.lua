-- awesome_mode: api-level=4:screen=on

-- load luarocks if installed
pcall(require, 'luarocks.loader')

-- load theme
local beautiful = require'beautiful'
local gears = require'gears'
theme_dir = '~/.config/awesome/theme/theme.lua'
beautiful.init(theme_dir)

-- load key and mouse bindings
require'bindings'

-- load rules
require'rules'

-- load signals
require'signals'
