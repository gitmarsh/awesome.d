---------------------------------------------------------------------------
--- A notification action.
--
-- A notification can have multiple actions to chose from. This module allows
-- to manage such actions. An action object can be shared by multiple
-- notifications.
--
-- @author Emmanuel Lepage Vallee &lt;elv1313@gmail.com&gt;
-- @copyright 2019 Emmanuel Lepage Vallee
-- @coreclassmod naughty.action
---------------------------------------------------------------------------
local gtable  = require("gears.table" )
local gobject = require("gears.object")

local action = {}

--- Create a new action.
-- @constructorfct naughty.action
-- @tparam table args The arguments.
-- @tparam string args.name The name.
-- @tparam string args.position The position.
-- @tparam string args.icon The icon.
-- @tparam naughty.notification args.notification The notification object.
-- @tparam boolean args.selected If this action is currently selected.
-- @return A new action.

-- The action name.
-- @property name
-- @tparam string name The name.
-- @propemits true false

-- If the action is selected.
--
-- Only a single action can be selected per notification. This is useful to
-- implement keyboard navigation.
--
-- @property selected
-- @param boolean
-- @propemits true false

--- The action position (index).
-- @property position
-- @param number
-- @propemits true false

--- The action icon.
-- @property icon
-- @tparam gears.surface|string icon
-- @propemits true false

--- If the action should hide the label and only display the icon.
--
-- 
--
--![Usage example](../images/AUTOGEN_wibox_nwidget_actionlist_icon_only.svg)
--
-- 
--     local notif = naughty.notification {
--         title   = &#34A notification&#34,
--         message = &#34This notification has actions!&#34,
--         actions = {
--             naughty.action {
--                 name = &#34Accept&#34,
--                 icon = beautiful.awesome_icon,
--                 icon_only = true,
--             },
--             naughty.action {
--                 name = &#34Refuse&#34,
--                 icon = beautiful.awesome_icon,
--                 icon_only = true,
--             },
--             naughty.action {
--                 name = &#34Ignore&#34,
--                 icon = beautiful.awesome_icon,
--                 icon_only = true,
--             },
--         }
--     }
--  
--     wibox.widget {
--         notification = notif,
--         widget = naughty.list.actions,
--     }
--
-- @property icon_only
-- @param[opt=false] boolean
-- @propemits true false

--- When a notification is invoked.
--
-- Note that it is possible to call `:invoke()` without a notification object.
-- It is possible the `notification` parameter will be nil.
--
-- @signal invoked
-- @tparam naughty.action action The action.
-- @tparam naughty.notification|nil notification The notification, if known.

function action:get_selected()
    return self._private.selected
end

function action:set_selected(value)
    self._private.selected = value
    self:emit_signal("property::selected", value)
    self:emit_signal("_changed")

    --TODO deselect other actions from the same notification
end

function action:get_position()
    return self._private.position
end

function action:set_position(value)
    self._private.position = value
    self:emit_signal("property::position", value)
    self:emit_signal("_changed")

    --TODO make sure the position is unique
end

for _, prop in ipairs { "name", "icon", "icon_only" } do
    action["get_"..prop] = function(self)
        return self._private[prop]
    end

    action["set_"..prop] = function(self, value)
        self._private[prop] = value
        self:emit_signal("property::"..prop, value)
        self:emit_signal("_changed")
    end
end

--TODO v4.5, remove this.
function action.set_notification()
    -- It didn't work because it prevented actions defined in the rules to be
    -- in multiple notifications at once.
    assert(
        false,
        "Setting a notification object was a bad idea and is now forbidden"
    )
end

--- Execute this action.
--
-- This only emits the `invoked` signal.
--
-- @method invoke
-- @tparam[opt={}] naughty.notification notif A notification object on which
--  the action was invoked. If a notification is shared by many object (like
--  a "mute" or "snooze" action added to all notification), calling `:invoke()`
--  without adding the `notif` context will cause unexpected results.
function action:invoke(notif)
    self:emit_signal("invoked", notif)
end

local function new(_, args)
    args = args or {}
    local ret = gobject { enable_properties = true }

    gtable.crush(ret, action, true)

    local default = {
        -- See "table 1" of the spec about the default name
        name         = args.name or "default",
        selected     = args.selected == true,
        position     = args.position,
        icon         = args.icon,
        notification = args.notification,
        icon_only    = args.icon_only or false,
    }

    rawset(ret, "_private", default)

    gtable.crush(ret, args)

    return ret
end

--
--- Disconnect from a signal.
-- @tparam string name The name of the signal.
-- @tparam function func The callback that should be disconnected.
-- @method disconnect_signal
-- @baseclass gears.object

--- Emit a signal.
--
-- @tparam string name The name of the signal.
-- @param ... Extra arguments for the callback functions. Each connected
--   function receives the object as first argument and then any extra
--   arguments that are given to emit_signal().
-- @method emit_signal
-- @baseclass gears.object

--- Connect to a signal.
-- @tparam string name The name of the signal.
-- @tparam function func The callback to call when the signal is emitted.
-- @method connect_signal
-- @baseclass gears.object

--- Connect to a signal weakly.
--
-- This allows the callback function to be garbage collected and
-- automatically disconnects the signal when that happens.
--
-- **Warning:**
-- Only use this function if you really, really, really know what you
-- are doing.
-- @tparam string name The name of the signal.
-- @tparam function func The callback to call when the signal is emitted.
-- @method weak_connect_signal
-- @baseclass gears.object

return setmetatable(action, {__call = new})
