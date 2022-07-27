local _M = {}
local create_layoutbox = {}
local awful = require'awful'

function _M.create_layoutbox(s)
   return awful.widget.layoutbox{
      screen = s,
      buttons = {
         awful.button{
            modifiers = {},
            button    = 1,
            on_press  = function() awful.layout.inc(1) end,
         },
         awful.button{
            modifiers = {},
            button    = 3,
            on_press  = function() awful.layout.inc(-1) end,
         },
         awful.button{
            modifiers = {},
            button    = 4,
            on_press  = function() awful.layout.inc(-1) end,
         },
         awful.button{
            modifiers = {},
            button    = 5,
            on_press  = function() awful.layout.inc(1) end,
         },
      }
   }
end
return _M.create_layoutbox
