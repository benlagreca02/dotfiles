
require("autostarts")
require("inputAndKeybindings")
require("lookAndFeel")

hl.config({
    misc = {
        force_default_wallpaper  = 0,    -- Set to 0 or 1 to disable the anime mascot wallpapers
        disable_hyprland_logo    = true, -- If true disables the random hyprland logo / anime girl background. :(
        disable_splash_rendering = false,
    },
})

-- My home dock (that I never use) OR my PC
function configureForDockedOrPC()
    local MAIN_MONITOR = "DP-1"
    local SIDE_MONITOR = "HDMI-A-1"
    
    hl.monitor({
        output = MAIN_MONITOR,
        mode = "1920x1080@120",
        position = "0x0",
        scale = 1,
    })

    hl.monitor({
        output = SIDE_MONITOR,
        mode = "1920x1080@60",
        position = "-1920x0",
        scale = 1,
    })

    for i=1,5,1 do
        hl.workspace_rule({workspace = i, monitor = MAIN_MONITOR, persistent = true})
    end
    for i=6,9,1 do
        hl.workspace_rule({workspace = i, monitor = SIDE_MONITOR, persistent = true})
    end
    hl.notification.create({ text = "DOCKED", timeout = 5000, icon = "ok" })
end

-- standalone monitor
function configureForUndocked()
    local BUILTIN_DISPLAY = "eDP-1"

    hl.monitor({
        output = BUILTIN_DISPLAY,
        mode = "1920x1080@60",
        position = "0x0",
        scale = 1.25,
    })


    for i=1,9,1 do
        hl.workspace_rule({workspace = i, monitor = BUILTIN_DISPLAY, persistent = true})
    end
end

-- Determines which configuration to call
-- Just uses monitor count
function confMonitorCallback()
    -- Count monitors
    local mons = hl.get_monitors()
    local numMons = 0
    for _ in pairs(mons) do
        numMons = numMons + 1
    end

    local selected = ""

    if numMons >= 2 then
        configureForDockedOrPC()
        selected = "Docked"
    else
       configureForUndocked()
       selected = "Undocked"
    end

    hl.notification.create({ text = selected, timeout = 5000, icon = "ok" })
end


-- DO NOT use monitor.layout_changed, since we change layout, it will recurse!
hl.on("hyprland.start", confMonitorCallback)
hl.on("monitor.added", confMonitorCallback)
hl.on("monitor.removed", confMonitorCallback)
hl.on("config.reloaded", confMonitorCallback)

