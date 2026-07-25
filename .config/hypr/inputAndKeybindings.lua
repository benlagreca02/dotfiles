-- INPUT AND KEYBINDINGS

hl.config({
    input = {
        kb_layout  = "us",
        kb_variant = "",
        kb_model   = "",
        kb_options = "",
        kb_rules   = "",
        follow_mouse = 1,
        sensitivity = 0, -- -1.0 - 1.0, 0 means no modification.
        touchpad = {
            natural_scroll = false,
        },
    },
})

local mainMod = "SUPER"

-- Move focus with mainMod + arrow keys
hl.bind(mainMod .. " + h", hl.dsp.focus({ direction = "left" }))
hl.bind(mainMod .. " + j", hl.dsp.focus({ direction = "down" }))
hl.bind(mainMod .. " + k", hl.dsp.focus({ direction = "up" }))
hl.bind(mainMod .. " + l", hl.dsp.focus({ direction = "right" }))

-- W for web
hl.bind(mainMod .. " + w", hl.dsp.exec_cmd("$WEB_BROWSER"))

-- E for file manager
hl.bind(mainMod .. " + e", hl.dsp.exec_cmd("$FILE_MANAGER"))

-- WIN SHIFT ENTER for terminal
hl.bind(mainMod .. " + SHIFT + RETURN", hl.dsp.exec_cmd("$TERMINAL"))

-- Space for program launcher
hl.bind(mainMod .. " + SPACE", hl.dsp.exec_cmd("$LAUNCHER"))

-- R for feed Reader
hl.bind(mainMod .. " + R", hl.dsp.exec_cmd("$FEED_READER"))

-- Shift + C for CLOSE
hl.bind(mainMod .. " + SHIFT + C", hl.dsp.window.close())

-- C for config editing script
hl.bind(mainMod .. " + C", hl.dsp.exec_cmd("edit-config-selector"))

-- T for theme changer
hl.bind(mainMod .. " + T", hl.dsp.exec_cmd("change_theme"))

-- F for making window float
hl.bind(mainMod .. " + F", hl.dsp.window.float({action = "toggle"}))

-- Shift F for fullscreen
hl.bind(mainMod .. " + SHIFT + F", hl.dsp.window.fullscreen({aciton="toggle"}))

-- Shift S for hyprshot (snipping tool)
hl.bind(mainMod .. " + SHIFT + S", hl.dsp.exec_cmd("hyprshot --clipboard-only -m region"))

-- Shift L for lock
hl.bind(mainMod .. " + SHIFT + L", hl.dsp.exec_cmd("hyprlock"))

-- M for signout
hl.bind(mainMod .. " + M", hl.dsp.exec_cmd("prompt_logoff"))

-- WORKSPACE
-- hl.bind(mainMod .. " + 1", hl.dsp.window.move_t(1))
for i = 1, 9 do
    -- SUPER + i to focus a workspace
    hl.bind(mainMod .. " + " .. i, hl.dsp.focus({ workspace = i}))
    -- SUPER + i to focus a workspace
    hl.bind(mainMod .. " + SHIFT + " .. i,     hl.dsp.window.move({ workspace = i, follow = false }))
end

hl.bind(mainMod .. " + left", hl.dsp.focus({workspace = "e-1"}))
hl.bind(mainMod .. " + right", hl.dsp.focus({workspace = "e+1"}))

-- Scroll through existing workspaces with mainMod + scroll
hl.bind(mainMod .. " + mouse_down", hl.dsp.focus({ workspace = "e+1" }))
hl.bind(mainMod .. " + mouse_up",   hl.dsp.focus({ workspace = "e-1" }))

-- Move/resize windows with mainMod + LMB/RMB and dragging
hl.bind(mainMod .. " + mouse:272", hl.dsp.window.drag(),   { mouse = true })
hl.bind(mainMod .. " + mouse:273", hl.dsp.window.resize(), { mouse = true })

-- Laptop multimedia keys for volume and LCD brightness
hl.bind("XF86AudioRaiseVolume", hl.dsp.exec_cmd("wpctl set-volume -l 1 @DEFAULT_AUDIO_SINK@ 5%+"), { locked = true, repeating = true })
hl.bind("XF86AudioLowerVolume", hl.dsp.exec_cmd("wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%-"),      { locked = true, repeating = true })
hl.bind("XF86AudioMute",        hl.dsp.exec_cmd("wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle"),     { locked = true, repeating = true })
hl.bind("XF86AudioMicMute",     hl.dsp.exec_cmd("wpctl set-mute @DEFAULT_AUDIO_SOURCE@ toggle"),   { locked = true, repeating = true })
hl.bind("XF86MonBrightnessUp",  hl.dsp.exec_cmd("brightnessctl s 5%+"),  { locked = true, repeating = true })
hl.bind("XF86MonBrightnessDown",hl.dsp.exec_cmd("brightnessctl s 5%-"),  { locked = true, repeating = true })

-- Requires playerctl
hl.bind("XF86AudioNext",  hl.dsp.exec_cmd("playerctl next"),       { locked = true })
hl.bind("XF86AudioPause", hl.dsp.exec_cmd("playerctl play-pause"), { locked = true })
hl.bind("XF86AudioPlay",  hl.dsp.exec_cmd("playerctl play-pause"), { locked = true })
hl.bind("XF86AudioPrev",  hl.dsp.exec_cmd("playerctl previous"),   { locked = true })
