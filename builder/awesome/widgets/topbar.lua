local _M = {}
local create_wibox = {}
local awful = require'awful'
local apps = require'config.apps'
local mod = require'bindings.mod'
local hotkeys_popup = require'awful.hotkeys_popup'
local beautiful = require'beautiful'
local wibox = require'wibox'


function _M.create_wibox(s)
   return awful.wibar{
      screen = s,
      position = 'top',
      widget = {
         layout = wibox.layout.align.horizontal,
         -- left widgets
         {
            layout = wibox.layout.fixed.horizontal,
            _M.launcher,
            s.taglist,
            s.promptbox,
         },
         -- middle widgets
         s.tasklist,
         -- right widgets
         {
            layout = wibox.layout.fixed.horizontal,
            _M.keyboardlayout,
            wibox.widget.systray(),
            _M.textclock,
            s.layoutbox,
         }
      }
   }
end
return _M.create_wibox
