local _M = {}
local create_taglist = {}
local awful = require'awful'
local gears = require("gears")
local wibox = require("wibox")
local beautiful = require("beautiful")
local xresources = require("beautiful.xresources")
local dpi = xresources.apply_dpi
local mod = require'bindings.mod'


function _M.create_taglist(s)
   return awful.widget.taglist{
      screen = s,
      filter = awful.widget.taglist.filter.all,
      buttons = {
         awful.button{
            modifiers = {},
            button    = 1,
            on_press  = function(t) t:view_only() end,
         },
         awful.button{
            modifiers = {mod.super},
            button    = 1,
            on_press  = function(t)
               if client.focus then
                  client.focus:move_to_tag(t)
               end
            end,
         },
         awful.button{
            modifiers = {},
            button    = 3,
            on_press  = awful.tag.viewtoggle,
         },
         awful.button{
            modifiers = {mod.super},
            button    = 3,
            on_press  = function(t)
               if client.focus then
                  client.focus:toggle_tag(t)
               end
            end
         },
         awful.button{
            modifiers = {},
            button    = 4,
            on_press  = function(t) awful.tag.viewprev(t.screen) end,
         },
         awful.button{
            modifiers = {},
            button    = 5,
            on_press  = function(t) awful.tag.viewnext(t.screen) end,
         },
      },
      style = {
        font = "Ubuntu mono 18",
        fg = "#aaaaaaa",

     },
      layout = {
        layout = wibox.layout.fixed.horizontal
      },
      widget_template = {
          {
              {
                  align = " center",
                  valign = "center",
              },
              left = dpi(150),
              right = dpi(150),
              top  = dpi(5),
              bottom = dpi(5),
              widget = wibox.container.margin,
            },
         --   shape = helpers.rrect(dpi(20)),
           border_width = dpi(200),
          --  border_color = x.color6,
            id = "bg_role",
            id = "background_role",
            shape = gears.shape.rounded_bar,
            widget = wibox.container.background,
          }
   }
end
return _M.create_taglist
