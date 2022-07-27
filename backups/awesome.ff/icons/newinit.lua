local gears = require("gears")

local function file_exists(path)
    -- Try to open it
    local f = io.open(path)
    if f then
        f:close()
        return true
    end
    return false
end

local icons = {}
icons.image = {}
icons.text = {}

-- TODO Set up weather text icons here instead of in ../noodle/text_weather.lua
-- icons.text.weather = {}

-- Set up text symbols and accent colors to be used in tasklists or docks
-- instead of awful.widget.clienticon
-- Based on the client's `class` property
-- TODO Ability to match using rules instead of just class

-- Available icons
local image_icon_names = {
    "jellyfin",
    "adguardhome",
    "amazon",
    "emby",
    "facebook",
    "firefly",
    "gitea",
    "firefox",
    "youtube",
    "reddit",
    "discord",
    "github",
    "steam",
    "nextcloud",
    "nzbget",
    "pfsense",
    "proxmox",
    "radarr",
    "sonarr",
    "syncthing",
    "truenas",
    "sabnzbd",
}

-- Path to icons
local p

-- Assumes all the icon files end in .png
-- TODO maybe automatically detect icons in icon theme directory
local function set_image_icon(icon_name)
    local i = p..icon_name..".png"
    icons.image[icon_name] = i
end

-- Set all the icon variables
function icons.init(theme_name)
    -- Set the path to image icons
    p = gears.filesystem.get_configuration_dir().."png/"..theme_name.."/"

    for i = 1, #image_icon_names do
        set_image_icon(image_icon_names[i])
    end

    -- Set symbols and accent colors for text icons
end

return srvicons