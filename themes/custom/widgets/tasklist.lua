local _M = {}
local create_tasklist = {}
local awful = require'awful'
local gears = require("gears")
local wibox = require("wibox")
local beautiful = require("beautiful")
local xresources = require("beautiful.xresources")
local dpi = xresources.apply_dpi

function _M.create_tasklist(s)
   return awful.widget.tasklist{
      screen = s,
      filter = awful.widget.tasklist.filter.currenttags,
      buttons = {
         awful.button{
            modifiers = {},
            button    = 1,
            on_press  = function(c)
               c:activate{context = 'tasklist', action = 'toggle_minimization'}
            end,
         },
         awful.button{
            modifiers = {},
            button    = 3,
            on_press  = function() awful.menu.client_list{theme = {width = 250}}   end,
         },
         awful.button{
            modifiers = {},
            button    = 4,
            on_press  = function() awful.client.focus.byidx(-1) end
         },
         awful.button{
            modifiers = {},
            button    = 5,
            on_press  = function() awful.client.focus.byidx(1) end
         },
      },
      style = {
        bg = "#11000FF",
        font = "Ubuntu mono 10",
        disable_icon = false
      },
      layout = {
        layout = wibox.layout.fixed.horizontal,
        align = "center",
        width = dpi(20)
      },
      widget_template = {
          {
              {
                  id = "text_role",
                  align = " center",
                  valign = "center",
                  widget = wibox.widget.textbox,

              },
              left = dpi(15),
              right = dpi(15),
              top  = dpi(2),
              bottom = dpi(2),
              widget = wibox.container.margin,
            },
         --   shape = helpers.rrect(dpi(20)),
        --   border_width = dpi(1),
          --  border_color = x.color6,
            id = "bg_role",
           --  id = "background_role",
          --  shape = gears.shape.rounded_bar,
            widget = wibox.container.background,
          }
      }
end
return _M.create_tasklist
