local awful = require('awful')
local left_panel = require('layout.left-panel')
local top_panel = require('layout.top-panel')
local right_panel = require('layout.right-panel')

-- Create a wibox panel for each screen and add it
screen.connect_signal(
	'request::desktop_decoration',
	function(s)
		if s.index == 1 then
			s.left_panel = left_panel(s)
			s.top_panel = top_panel(s, true)
		else
			s.top_panel = top_panel(s, false)
		end
		s.right_panel = right_panel(s)
		s.right_panel_show_again = false
	end
)
