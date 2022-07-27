--[[
    A random rice. i guess.
    source: https://github.com/saimoomedits/dotfiles
]]


pcall (require, "luarocks.loader")


-- home variable 🏠
home_var        = os.getenv("HOME")


-- user preferences ⚙️
user_likes      = {

    -- aplications
    term        = "kitty",
    editor      = "kitty -e " .. "nvim",
    code        = "vscode",
    web         = "firefox",
    music       = "kitty --class 'music' --config-file " .. home_var .. "/.config/alacritty/ncmpcpp.yml -e ncspot ",
    files       = "dolphin",


    -- your profile
    username = os.getenv("USER"):gsub("^%l", string.upper),
    userdesc = "@AwesomeWM"
}



-- theme 🖌️
require("theme")

-- configs ⚙️
require("config")

-- miscallenous ✨
require("misc")

-- signals 📶
require("signal")

-- ui elements 💻
require("layout")
