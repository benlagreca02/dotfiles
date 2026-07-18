
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

hl.config({
  xwayland = {
    force_zero_scaling = true
  }
})

BUILTIN_DISPLAY = "eDP-1"
LAPTOP_OUTPUT = "HDMI-A-1"
-- TODO will need to add another for laptop docked

MAIN_MONITOR = "DP-1"
SIDE_MONITOR = "HDMI-A-1"


function applyWorkspaces(monitors)
    if type(monitors) == "string" then
        monitors = { monitors }
    end

    -- get number of entries
    local numMons = 0
    for _ in pairs(monitors) do
        numMons = numMons + 1
    end

    if numMons == 2 then
        for i=1,5,1 do
            hl.workspace_rule({workspace = i, monitor = monitors[1], persistent = true})
        end
        for i=6,9,1 do
            hl.workspace_rule({workspace = i, monitor = monitors[2], persistent = true})
        end
        return
    else
        for i=1,9,1 do
            hl.workspace_rule({workspace = i, monitor = monitors[1], persistent = true})
        end
    end
end

function configureForPC()
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

    applyWorkspaces({MAIN_MONITOR, SIDE_MONITOR})
    return "PC"
end

-- standalone monitor on laoptop
function configureForLaptop()
    local builtin = BUILTIN_DISPLAY
    hl.monitor({
        output = builtin,
        mode = "1920x1080@60",
        position = "0x0",
        scale = 1.25,
    })
    applyWorkspaces(builtin)

    return "Laptop"
end

-- standalone monitor on laoptop
function configureForTv()
    local builtin = BUILTIN_DISPLAY
    local tv = LAPTOP_OUTPUT

    hl.monitor({
        output = builtin,
        mode = "1920x1080@60",
        position = "0x0",
        scale = 1,
    })
    hl.monitor({
        output = tv,
        mode = "4096x2160@60.00Hz",
        position = "auto-up",
        scale = 1.0,
    })
    applyWorkspaces({tv, builtin})

    return "TV"
end


function resolveAndApplyConfig(num, isLaptop)
    -- only one extra monitor means it must be a TV
    if isLaptop and num == 2 then
        return configureForTv()
    elseif isLaptop and num == 1 then
        return configureForLaptop()
    -- TODO fix this
    -- two extra monitors means I'm docked... need to fix this
    elseif isLaptop and num >= 3 then
        return configureForDocked()
    elseif num == 2 then
        return configureForPC()
    else
        return configureForPC()
    end
end


-- Determines which configuration to call
-- Just uses monitor count
function confMonitorCallback()
    -- Count monitors, and see if we're a lapotp
    local mons = hl.get_monitors()
    local numMons = 0
    local isLaptop = false

    for i, mon in pairs(hl.get_monitors()) do
        if mon.name == "eDP-1" then
            isLaptop = true
        end
        numMons = numMons + 1
    end

    -- in the future, make this smarter... maybe read monitor names?
    local selected = resolveAndApplyConfig(numMons, isLaptop)

    hl.notification.create({ text = selected, timeout = 5000, icon = "ok" })
end


-- DO NOT use monitor.layout_changed, since we change layout, it will recurse!
hl.on("hyprland.start", confMonitorCallback)
hl.on("monitor.added", confMonitorCallback)
hl.on("monitor.removed", confMonitorCallback)
hl.on("config.reloaded", confMonitorCallback)

