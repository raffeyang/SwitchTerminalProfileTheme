#!/usr/bin/osascript

-- 读取保存的外观模式
try
    set darkModeEnabled to do shell script "defaults read com.raffeyang.terminal DarkMode"
on error
    set darkModeEnabled to "false" -- 如果出现错误，默认为浅色模式
end try

-- 根据保存的外观模式决定需要应用的终端 Profile
if darkModeEnabled is "1" then
    set desiredProfile to "Basic" -- 替换为你的深色模式的Profile名称
else
    set desiredProfile to "Basic Light" -- 替换为你的浅色模式的Profile名称
end if

tell application "Terminal"
    -- 只在当前设置与期望设置不同时才切换
    set currentProfile to name of default settings
    if currentProfile is not equal to desiredProfile then
        set default settings to settings set desiredProfile
        set every window's current settings to settings set desiredProfile
    end if
end tell
