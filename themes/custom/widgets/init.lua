local _M = {}
local awful = require'awful'
local hotkeys_popup = require'awful.hotkeys_popup'
local beautiful = require'beautiful'
local wibox = require'wibox'
local apps = require'config.apps'
local mod = require'bindings.mod'
function _M.create_promptbox() return awful.widget.prompt() end

_M.create_layoutbox = require'widgets.layoutbox'
_M.create_taglist = require'widgets.taglist'
_M.titlebar = require'widgets.fenetre'
_M.create_tasklist = require'widgets.tasklist'
_M.mainmenu = require'widgets.menu'
_M.keyboardlayout = awful.widget.keyboardlayout()
_M.textclock = require'widgets.textclock'
_M.create_wibox = require'widgets.topbar'



return _M
