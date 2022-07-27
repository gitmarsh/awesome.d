-- Provides:
-- evil::spotify
--      artist (string)
--      song (string)
--      status (string) [playing | paused | stopped]
local awful = require("awful")

local function emit_info(playerctl_output)
    local artist = playerctl_output:match('xesam:artist(.*) xesam:title')
    local title = playerctl_output:match('xesam:title(.*) mpris:length')
    -- Use the lower case of status
    local status = playerctl_output:match('mpris:length(.*)'):lower()
    status = string.gsub(status, '^%s*(.-)%s*$', '%1')

    awesome.emit_signal("evil::spotify", artist, title, status)
end

-- Sleeps until spotify changes state (pause/play/next/prev)
local spotify_script = [[
  sh -c '
    playerctl -p ncspot metadata --format 'xesam:artist{{artist}}, xesam:title{{title}}, mpris:length{{status}}' --follow
  ']]

-- Kill old playerctl process
awful.spawn.easy_async_with_shell("ps x | grep \"playerctl -p ncspot metadata\" | grep -v grep | awk '{print $1}' | xargs kill", function ()
    -- Emit song info with each line printed
    awful.spawn.with_line_callback(spotify_script, {
        stdout = function(line)
            emit_info(line)
        end
    })
end)
