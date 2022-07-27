---------------------------------------------------------------------------
-- A widget to display either plain or HTML text.
--
--
--
--![Usage example](../images/AUTOGEN_wibox_widget_defaults_textbox.svg)
--
-- @usage
-- wibox.widget{
--     markup = &#34This <i>is</i> a <b>textbox</b>!!!&#34,
--     align  = &#34center&#34,
--     valign = &#34center&#34,
--     widget = wibox.widget.textbox
-- }
--
-- @author Uli Schlachter
-- @author dodo
-- @copyright 2010, 2011 Uli Schlachter, dodo
-- @widgetmod wibox.widget.textbox
-- @supermodule wibox.widget.base
---------------------------------------------------------------------------

local base = require("wibox.widget.base")
local gdebug = require("gears.debug")
local beautiful = require("beautiful")
local lgi = require("lgi")
local gtable = require("gears.table")
local Pango = lgi.Pango
local PangoCairo = lgi.PangoCairo
local setmetatable = setmetatable

local textbox = { mt = {} }

--- The textbox font.
--
-- @beautiful beautiful.font
-- @param string

--- Set the DPI of a Pango layout
local function setup_dpi(box, dpi)
    assert(dpi, "No DPI provided")
    if box._private.dpi ~= dpi then
        box._private.dpi = dpi
        box._private.ctx:set_resolution(dpi)
        box._private.layout:context_changed()
    end
end

--- Setup a pango layout for the given textbox and dpi
local function setup_layout(box, width, height, dpi)
    box._private.layout.width = Pango.units_from_double(width)
    box._private.layout.height = Pango.units_from_double(height)
    setup_dpi(box, dpi)
end

-- Draw the given textbox on the given cairo context in the given geometry
function textbox:draw(context, cr, width, height)
    setup_layout(self, width, height, context.dpi)
    cr:update_layout(self._private.layout)
    local _, logical = self._private.layout:get_pixel_extents()
    local offset = 0
    if self._private.valign == "center" then
        offset = (height - logical.height) / 2
    elseif self._private.valign == "bottom" then
        offset = height - logical.height
    end
    cr:move_to(0, offset)
    cr:show_layout(self._private.layout)
end

local function do_fit_return(self)
    local _, logical = self._private.layout:get_pixel_extents()
    if logical.width == 0 or logical.height == 0 then
        return 0, 0
    end
    return logical.width, logical.height
end

-- Fit the given textbox
function textbox:fit(context, width, height)
    setup_layout(self, width, height, context.dpi)
    return do_fit_return(self)
end

--- Get the preferred size of a textbox.
--
-- This returns the size that the textbox would use if infinite space were
-- available.
--
-- @method get_preferred_size
-- @tparam integer|screen s The screen on which the textbox will be displayed.
-- @treturn number The preferred width.
-- @treturn number The preferred height.
function textbox:get_preferred_size(s)
    local dpi
    if s then
        dpi = screen[s].dpi
    else
        gdebug.deprecate("textbox:get_preferred_size() requires a screen argument", {deprecated_in=5, raw=true})
        dpi = beautiful.xresources.get_dpi()
    end

    return self:get_preferred_size_at_dpi(dpi)
end

--- Get the preferred height of a textbox at a given width.
--
-- This returns the height that the textbox would use when it is limited to the
-- given width.
--
-- @method get_height_for_width
-- @tparam number width The available width.
-- @tparam integer|screen s The screen on which the textbox will be displayed.
-- @treturn number The needed height.
function textbox:get_height_for_width(width, s)
    local dpi
    if s then
        dpi = screen[s].dpi
    else
        gdebug.deprecate("textbox:get_preferred_size() requires a screen argument", {deprecated_in=5, raw=true})
        dpi = beautiful.xresources.get_dpi()
    end
    return self:get_height_for_width_at_dpi(width, dpi)
end

--- Get the preferred size of a textbox.
--
-- This returns the size that the textbox would use if infinite space were
-- available.
--
-- @method get_preferred_size_at_dpi
-- @tparam number dpi The DPI value to render at.
-- @treturn number The preferred width.
-- @treturn number The preferred height.
function textbox:get_preferred_size_at_dpi(dpi)
    local max_lines = 2^20
    setup_dpi(self, dpi)
    self._private.layout.width = -1 -- no width set
    self._private.layout.height = -max_lines -- show this many lines per paragraph
    return do_fit_return(self)
end

--- Get the preferred height of a textbox at a given width.
--
-- This returns the height that the textbox would use when it is limited to the
-- given width.
--
-- @method get_height_for_width_at_dpi
-- @tparam number width The available width.
-- @tparam number dpi The DPI value to render at.
-- @treturn number The needed height.
function textbox:get_height_for_width_at_dpi(width, dpi)
    local max_lines = 2^20
    setup_dpi(self, dpi)
    self._private.layout.width = Pango.units_from_double(width)
    self._private.layout.height = -max_lines -- show this many lines per paragraph
    local _, h = do_fit_return(self)
    return h
end

--- Set the text of the textbox.(with
-- [Pango markup](https://docs.gtk.org/Pango/pango_markup.html)).
--
-- @tparam string text The text to set. This can contain pango markup (e.g.
--   `<b>bold</b>`). You can use `gears.string.escape` to escape
--   parts of it.
-- @method set_markup_silently
-- @treturn[1] boolean true
-- @treturn[2] boolean false
-- @treturn[2] string Error message explaining why the markup was invalid.
function textbox:set_markup_silently(text)
    if self._private.markup == text then
        return true
    end

    local attr, parsed = Pango.parse_markup(text, -1, 0)
    -- In case of error, attr is false and parsed is a GLib.Error instance.
    if not attr then
        return false, parsed.message or tostring(parsed)
    end

    self._private.markup = text
    self._private.layout.text = parsed
    self._private.layout.attributes = attr
    self:emit_signal("widget::redraw_needed")
    self:emit_signal("widget::layout_changed")
    self:emit_signal("property::markup", text)
    return true
end

--- Set the HTML text of the textbox.
--
-- The main difference between `text` and `markup` is that `markup` is
-- able to render a small subset of HTML tags. See the
-- [Pango markup](https://docs.gtk.org/Pango/pango_markup.html)) documentation
-- to see what is and isn't valid in this property.
--
-- 
--
--![Usage example](../images/AUTOGEN_wibox_widget_textbox_markup1.svg)
--
-- 
--     local w = wibox.widget {
--         markup = &#34This is some <i>text</i>, <b>HTML tags</b> <u>WILL</u> work.&#34,
--         widget = wibox.widget.textbox,
--     }
--
-- The `wibox.widget.textbox` colors are usually set by wrapping into a
-- `wibox.container.background` widget, but can also be done using the
-- markup:
--
-- 
--
--![Usage example](../images/AUTOGEN_wibox_widget_textbox_markup2.svg)
--
-- 
--     local w = wibox.widget {
--         markup = &#34<span background='#ff0000' foreground='#0000ff'>Some</span>&#34..
--           &#34 nice <span foreground='#00ff00'>colors!</span>&#34,
--         widget = wibox.widget.textbox,
--     }
--
-- @property markup
-- @tparam string markup The text to set. This can contain pango markup (e.g.
--   `<b>bold</b>`). You can use `gears.string.escape` to escape
--   parts of it.
-- @propemits true false
-- @see text

function textbox:set_markup(text)
    local success, message = self:set_markup_silently(text)
    if not success then
        gdebug.print_error(debug.traceback("Error parsing markup: "..message.."\nFailed with string: '"..text.."'"))
    end
end

function textbox:get_markup()
    return self._private.markup
end

--- Set a textbox plain text.
--
-- This property renders the text as-is, it does not interpret it:
--
-- 
--
--![Usage example](../images/AUTOGEN_wibox_widget_textbox_text1.svg)
--
-- 
--     local w = wibox.widget {
--         text   = &#34This is some <i>text</i>, <b>HTML tags</b> will <u>NOT</u> work.&#34,
--         widget = wibox.widget.textbox,
--     }
--
-- One exception are the control characters, which are interpreted:
--
-- 
--
--![Usage example](../images/AUTOGEN_wibox_widget_textbox_text2.svg)
--
-- 
--     local w = wibox.widget {
--         text   = &#34This is some text\nover\nmultiple lines!&#34,
--         widget = wibox.widget.textbox,
--     }
--
-- @property text
-- @tparam string text The text to display. Pango markup is ignored and shown
--  as-is.
-- @propemits true false
-- @see markup

function textbox:set_text(text)
    if self._private.layout.text == text and self._private.layout.attributes == nil then
        return
    end
    self._private.markup = nil
    self._private.layout.text = text
    self._private.layout.attributes = nil
    self:emit_signal("widget::redraw_needed")
    self:emit_signal("widget::layout_changed")
    self:emit_signal("property::text", text)
end

function textbox:get_text()
    return self._private.layout.text
end

--- Set the text ellipsize mode.
--
-- Valid values are:
--
-- * `"start"`
-- * `"middle"`
-- * `"end"`
-- * `"none"`
--
-- See Pango for additional details:
-- [Layout.set_ellipsize](https://docs.gtk.org/Pango/method.Layout.set_ellipsize.html)
--
--
--
--![Usage example](../images/AUTOGEN_wibox_widget_textbox_ellipsize.svg)
--
-- @usage
-- widget{
--     text = &#34This is a very long text, that cannot be displayed fully.&#34,
--     ellipsize = &#34start&#34,
--     widget = wibox.widget.textbox,
-- },
-- widget{
--     text = &#34This is a very long text, that cannot be displayed fully.&#34,
--     ellipsize = &#34end&#34,
--     widget = wibox.widget.textbox,
-- },
-- widget{
--     text = &#34This is a very long text, that cannot be displayed fully.&#34,
--     ellipsize = &#34middle&#34,
--     widget = wibox.widget.textbox,
-- },
-- widget{
--     text = &#34This is a very long text, that cannot be displayed fully.&#34,
--     ellipsize = &#34none&#34,
--     valign = &#34top&#34,
--     widget = wibox.widget.textbox,
-- }
--
-- @property ellipsize
-- @tparam[opt="end"] string mode The ellipsize mode.
-- @propemits true false

function textbox:set_ellipsize(mode)
    local allowed = { none = "NONE", start = "START", middle = "MIDDLE", ["end"] = "END" }
    if allowed[mode] then
        if self._private.layout:get_ellipsize() == allowed[mode] then
            return
        end
        self._private.layout:set_ellipsize(allowed[mode])
        self:emit_signal("widget::redraw_needed")
        self:emit_signal("widget::layout_changed")
        self:emit_signal("property::ellipsize", mode)
    end
end

--- Set a textbox wrap mode.
--
-- Valid values are:
--
-- * **word**
-- * **char**
-- * **word_char**
--
-- 
--
--![Usage example](../images/AUTOGEN_wibox_widget_textbox_wrap1.svg)
--
-- @usage
-- for _, wrap in ipairs {&#34word&#34, &#34char&#34, &#34word_char&#34} do
--     local w = wibox.widget {
--         wrap   = wrap,
--         text   = &#34Notable dinausors: Tyrannosaurus-Rex, Triceratops, Velociraptor, Sauropods, Archaeopteryx.&#34,
--         widget = wibox.widget.textbox,
--     }
-- end
--
-- @property wrap
-- @tparam[opt="word_char"] string mode Where to wrap? After "word", "char" or "word_char".
-- @propemits true false

function textbox:set_wrap(mode)
    local allowed = { word = "WORD", char = "CHAR", word_char = "WORD_CHAR" }
    if allowed[mode] then
        if self._private.layout:get_wrap() == allowed[mode] then
            return
        end
        self._private.layout:set_wrap(allowed[mode])
        self:emit_signal("widget::redraw_needed")
        self:emit_signal("widget::layout_changed")
        self:emit_signal("property::wrap", mode)
    end
end

--- The vertical text alignment.
--
-- This aligns the text within the widget's bounds. In some situations this may
-- differ from aligning the widget with `wibox.container.place`.
--
-- Valid values are:
--
-- * `"top"`
-- * `"center"`
-- * `"bottom"`
--
--
--
--![Usage example](../images/AUTOGEN_wibox_widget_textbox_valign1.svg)
--
-- @usage
-- for _, valign in ipairs {&#34top&#34, &#34center&#34, &#34bottom&#34} do
--     local w = wibox.widget {
--         valign = valign,
--         text   = &#34some text&#34,
--         widget = wibox.widget.textbox,
--     }
-- end
--
-- @property valign
-- @tparam[opt="center"] string mode The vertical alignment
-- @propemits true false

function textbox:set_valign(mode)
    local allowed = { top = true, center = true, bottom = true }
    if allowed[mode] then
        if self._private.valign == mode then
            return
        end
        self._private.valign = mode
        self:emit_signal("widget::redraw_needed")
        self:emit_signal("widget::layout_changed")
        self:emit_signal("property::valign", mode)
    end
end

--- The horizontal text alignment.
--
-- This aligns the text within the widget's bounds. In some situations this may
-- differ from aligning the widget with `wibox.container.place`.
--
-- Valid values are:
--
-- * `"left"`
-- * `"center"`
-- * `"right"`
--
--
--
--![Usage example](../images/AUTOGEN_wibox_widget_textbox_align1.svg)
--
-- @usage
-- for _, align in ipairs {&#34left&#34, &#34center&#34, &#34right&#34} do
--     local w = wibox.widget {
--         align  = align,
--         text   = &#34some text&#34,
--         widget = wibox.widget.textbox,
--     }
-- end
--
-- @property align
-- @tparam[opt="left"] string mode The horizontal alignment
-- @propemits true false

function textbox:set_align(mode)
    local allowed = { left = "LEFT", center = "CENTER", right = "RIGHT" }
    if allowed[mode] then
        if self._private.layout:get_alignment() == allowed[mode] then
            return
        end
        self._private.layout:set_alignment(allowed[mode])
        self:emit_signal("widget::redraw_needed")
        self:emit_signal("widget::layout_changed")
        self:emit_signal("property::align", mode)
    end
end

--- Set a textbox font.
--
-- There is multiple valid font string representation. The most precise is
-- [XFT](https://wiki.archlinux.org/title/X_Logical_Font_Description). It
-- is also possible to use the family name, followed by the face and size
-- such as `Monospace Bold 10`. This script lists the fonts present
-- on your system:
--
--    #!/usr/bin/env lua
--
--    local lgi = require("lgi")
--    local pangocairo = lgi.PangoCairo
--
--    local font_map = pangocairo.font_map_get_default()
--
--    for k, v in pairs(font_map:list_families()) do
--        print(v:get_name(), "monospace?: "..tostring(v:is_monospace()))
--        for k2, v2 in ipairs(v:list_faces()) do
--            print("    ".. v2:get_face_name())
--        end
--    end
--
-- Save this script somewhere on your system, `chmod +x` it and run it. It
-- will list something like:
--
--    Sans    monospace?: false
--        Regular
--        Bold
--        Italic
--        Bold Italic
--
-- In this case, the font could be `Sans 10` or `Sans Bold Italic 10`.
--
-- Here are examples of several font families:
--
--
--
--![Usage example](../images/AUTOGEN_wibox_widget_textbox_font1.svg)
--
--**Usage example output**:
--
--    sans 0 sans NORMAL NORMAL
--    Roboto, Bold 0 Roboto NORMAL NORMAL
--    DejaVu Sans, Oblique 0 DejaVu Sans NORMAL OBLIQUE
--    Noto Mono, Regular 0 Noto Mono NORMAL NORMAL
-- **Usage example:**
--
--
-- 
--    local pango = require(&#34lgi&#34).Pango
--    local fonts = {
--        &#34sans&#34,
--        &#34Roboto, Bold&#34,
--        &#34DejaVu Sans, Oblique&#34,
--        &#34Noto Mono, Regular&#34
--    }
--     
--    for _, font in ipairs(fonts) do
--        local w = wibox.widget {
--            font   = font,
--            text   = &#34The quick brown fox jumps over the lazy dog!&#34,
--            widget = wibox.widget.textbox,
--        }
--         
--        -- Use the low level Pango API to validate the font was parsed properly.
--        local desc = pango.FontDescription.from_string(w.font)
--        print(
--            string.format(
--                &#34%s %d %s %s %s&#34,
--                w.font,
--                desc:get_size(),
--                desc:get_family(),
--                desc:get_variant(),
--                desc:get_style()
--             )
--        )
--    end
--
-- The font size is a number at the end of the font description string:
--
--
--
--![Usage example](../images/AUTOGEN_wibox_widget_textbox_font2.svg)
--
-- 
--    for _, font in ipairs { &#34sans 8&#34, &#34sans 10&#34, &#34sans 12&#34, &#34sans 14&#34 } do
--        local w = wibox.widget {
--            font   = font,
--            text   = &#34The quick brown fox jumps over the lazy dog!&#34,
--            widget = wibox.widget.textbox,
--        }
--    end
--
-- @property font
-- @tparam[opt=beautiful.font] string font The font description as string.
-- @propemits true false
-- @usebeautiful beautiful.font The default font.

function textbox:set_font(font)
    if font == self._private.font then return end

    self._private.font = font

    self._private.layout:set_font_description(beautiful.get_font(font))
    self:emit_signal("widget::redraw_needed")
    self:emit_signal("widget::layout_changed")
    self:emit_signal("property::font", font)
end

function textbox:get_font()
    return self._private.font
end

--- Create a new textbox.
--
-- @tparam[opt=""] string text The textbox content
-- @tparam[opt=false] boolean ignore_markup Ignore the pango/HTML markup
-- @treturn table A new textbox widget
-- @constructorfct wibox.widget.textbox
local function new(text, ignore_markup)
    local ret = base.make_widget(nil, nil, {enable_properties = true})

    gtable.crush(ret, textbox, true)

    ret._private.dpi = -1
    ret._private.ctx = PangoCairo.font_map_get_default():create_context()
    ret._private.layout = Pango.Layout.new(ret._private.ctx)
    ret._private.layout:set_font_description(beautiful.get_font(beautiful.font))

    ret:set_ellipsize("end")
    ret:set_wrap("word_char")
    ret:set_valign("center")
    ret:set_align("left")

    if text then
        if ignore_markup then
            ret:set_text(text)
        else
            ret:set_markup(text)
        end
    end

    return ret
end

function textbox.mt.__call(_, ...)
    return new(...)
end

--- Get geometry of text label, as if textbox would be created for it on the screen.
--
-- @tparam string text The text content, pango markup supported.
-- @tparam[opt=nil] integer|screen s The screen on which the textbox would be displayed.
-- @tparam[opt=beautiful.font] string font The font description as string.
-- @treturn table Geometry (width, height) hashtable.
-- @staticfct wibox.widget.textbox.get_markup_geometry
function textbox.get_markup_geometry(text, s, font)
    font = font or beautiful.font
    local pctx = PangoCairo.font_map_get_default():create_context()
    local playout = Pango.Layout.new(pctx)
    playout:set_font_description(beautiful.get_font(font))
    local dpi_scale = beautiful.xresources.get_dpi(s)
    pctx:set_resolution(dpi_scale)
    playout:context_changed()
    local attr, parsed = Pango.parse_markup(text, -1, 0)
    playout.attributes, playout.text = attr, parsed
    local _, logical = playout:get_pixel_extents()
    return logical
end

return setmetatable(textbox, textbox.mt)

-- vim: filetype=lua:expandtab:shiftwidth=4:tabstop=8:softtabstop=4:textwidth=80
