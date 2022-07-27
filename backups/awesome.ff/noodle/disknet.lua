local awful = require("awful")
local gears = require("gears")
local wibox = require("wibox")
local beautiful = require("beautiful")

local disknet = wibox.widget{
    text = "free disk space",
    align  = 'center',
    valign = 'center',
    widget = wibox.widget.textbox
}

awesome.connect_signal("evil::disknet", function (used, total)
    disknet.markup = "NAS:         " .. tostring(total - used) .. " TB free"
end)

return disknet