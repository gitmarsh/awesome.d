local awful = require("awful")
local beautiful = require("beautiful")
local menubar = require("menubar")
local awful_menu = awful.menu
local apps = require'config.apps'
local mod = require'bindings.mod'
local menu_gen   = menubar.menu_gen
local menu_utils = menubar.utils
local icon_theme = require('menubar.icon_theme')
local hotkeys_popup = require('awful.hotkeys_popup').widget
local terminal = 'kitty'
local web_browser = 'firefox'
local file_manager = 'dolphin'
local text_editor = 'code'
local editor_cmd = 'kitty -e nvim'
-- other configuration stuff here
awesome_menu = {
	{ 
		'Hotkeys',
		function()
			hotkeys_popup.show_help(nil, awful.screen.focused())
		end,
		menubar.utils.lookup_icon('keyboard')
	},
	{ 
		'Restart',
		awesome.restart,
		menubar.utils.lookup_icon('system-restart')
	},
	{
		'End Session',
		function()
			awesome.emit_signal('module::exit_screen:show')
		end,
		menubar.utils.lookup_icon('system-shutdown') 
    },
	{
		'Quit',
		function() awesome.quit() end,
		menubar.utils.lookup_icon('system-log-out')
	}
}

local default_app_menu = {
	{
		'Web Browser',
		web_browser,
		menubar.utils.lookup_icon("firefox")
	},
	{
		'File Manager',
		file_manager,
		menubar.utils.lookup_icon("dolphin")
	},
    {
        'Email',
        "thunderbird",
        menubar.utils.lookup_icon("thunderbird")
    }
}

local settings_menu = {
    {
        'Sound',
        "pavucontrol", 
        menubar.utils.lookup_icon("pavucontrol")
    },
    {
        'Display',
        "arandr", 
        menubar.utils.lookup_icon("arandr")
    },
    {
        'Graphics',
        "nvidia-settings",
        menubar.utils.lookup_icon("nvidia-settings")
    },
    {
        'Themes',
        "kvantummanager",
        menubar.utils.lookup_icon("kvantummanager")
    },
    {
        'Network',
        "chrome",
        menubar.utils.lookup_icon('network_settings')
    },
    {
        'Bluetooth',
        "blueberry",
        menubar.utils.lookup_icon('blueberry')
    }
}
local media_menu = {
    {
        'Spotify Client',
        "spotify",
        menubar.utils.lookup_icon("spotify")
    },
    {
        'Spotify cli',
        "kitty -e ncspot",
        menubar.utils.lookup_icon("ncspot")
    },
    {
        'Media',
        "jellyfinmediaplayer",
        menubar.utils.lookup_icon("jellyfin-media-player")
    },
    {
        'Photo Viewer',
        "gwenview",
        menubar.utils.lookup_icon("gwenview")
    }
}
local game_menu = {
    {
        'Steam',
        "steam",
        menubar.utils.lookup_icon("steam")
    },
    {
        'Discord',
        "discord",
        menubar.utils.lookup_icon("discord"),
    },
}
-- Screenshot menu
local screenshot_menu = {
	{
		'Full',
		function()
			gears.timerstart_new(
				0.1,
				function()
					awful.spawn.easy_async_with_shell(apps.utils.full_screenshot)
				end
			)
		end,
		menubar.utils.lookup_icon('accessories-screenshot')
	},
	{
		'Area',
		function() 
			gears.timer.start_new(
				0.1,
				function()
					awful.spawn.easy_async_with_shell(apps.utils.area_screenshot)
				end,
				menubar.utils.lookup_icon('accessories-screenshot')
			)
		end,
		menubar.utils.lookup_icon('accessories-screenshot')
	}
}

mainmenu = awful.menu(
{
    items = 
    {
        {
            "Awesome", awesome_menu, beautiful.awesome_icon 
        }, 
        {
            "File Manager",  "dolphin" 
        }, 
        {
            "Web Browser", "firefox" 
        }, 
        {
            "Email", "thunderbird" 
        }, 
        {
            "Media", media_menu 
        }, 
        {
            "Games", game_menu 
        }, 
        {
            "Phone", "kdeconnect-sms", menubar.utils.lookup_icon("kdeconnect") 
        }, 
        {
            "Screenshot", screenshot_menu 
        }, 
        {
            "Settings", settings_menu 
        }, 
        {
            "System Monitor", "kitty -e btop" 
        },
        {
            "Terminal", terminal 
        }
    }
}
)
return mainmenu
