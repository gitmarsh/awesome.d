
local _M = {}
local mainmenu = {}
local awful = require'awful'
local apps = require'config.apps'
local hotkeys_popup = require'awful.hotkeys_popup'
local apps = require'config.apps'
local beautiful = require'beautiful'
local mod = require'bindings.mod'

_M.awesomemenu = {
   {'hotkeys', function() hotkeys_popup.show_help(nil, awful.screen.focused()) end},
   {'manual', apps.manual_cmd},
   {'edit config', apps.editor_cmd .. ' ' .. awesome.conffile},
   {'restart', awesome.restart},
   {'quit', awesome.quit},
}

_M.mainmenu = awful.menu{
   items = {
      {'awesome', _M.awesomemenu, beautiful.awesome_icon},
      {'open terminal', apps.terminal}
   }
}

_M.launcher = awful.widget.launcher{
   image = beautiful.awesome_icon,
   menu = _M.mainmenu
}
return _M.mainmenu

