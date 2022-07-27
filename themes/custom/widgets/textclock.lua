local _M  = {}
local textclock = {}
local wibox = require'wibox'
function _M.textclock()
    return wibox.widget.textclock()
end
return _M.textclock
