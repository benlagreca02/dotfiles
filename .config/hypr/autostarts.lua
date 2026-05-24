-- hl.on("hyprland.start", function () 
--   hl.exec_cmd(terminal)
--   hl.exec_cmd("nm-applet")
--   hl.exec_cmd("waybar & hyprpaper & firefox")
-- end)


hl.on("hyprland.start", function () 
    -- I'd like to change htis at some point, but load current theme
    hl.exec_cmd("hyprpaper")
    hl.exec_cmd("wal -f $(cat ~/.local/currtheme)")
    hl.exec_cmd("waybar-autoreload")
    hl.exec_cmd("hypridle")
    hl.exec_cmd("dunst")
    hl.exec_cmd("hyprsunset")
    hl.exec_cmd("kanshi")
end)
