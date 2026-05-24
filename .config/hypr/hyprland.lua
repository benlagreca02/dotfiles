-- Monitor rule
hl.monitor({
    output = "",
    mode = "preferred",
    position = "auto",
    scale = "1",
})


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


-- Look and feel

hl.config({

    general = {
        gaps_in = 2,
        gaps_out = 6,
        border_size=2,
        col = {
            -- active_border = { colors = {"rgba()", "rgba()"}, angle=45 },
            active_border = { colors ={"rgba(FF0000FF)", "rgba(0000FFFF)"}, angle=45 },
            inactive_border = { colors = {"rgba(ffffff44)", }},
        },
        resize_on_border = false,
        allow_tearing = false,
        layout = dwindle,
    },

    decoration = {
        rounding = 10,
        rounding_power = 2,
        shadow = {
        },
        blur = {
        },
    },

    animations = {
        enabled = true,
    },
})





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

-- T for theme change script
hl.bind(mainMod .. " + t", hl.dsp.exec_cmd("change_theme"))

-- Space for program launcher
hl.bind(mainMod .. " + SPACE", hl.dsp.exec_cmd("$LAUNCHER"))

-- R for feed Reader
hl.bind(mainMod .. " + R", hl.dsp.exec_cmd("$FEED_READER"))


-- Shift + C for CLOSE
hl.bind(mainMod .. " + SHIFT + C", hl.dsp.window.close())



-- WORKSPACE
-- hl.bind(mainMod .. " + 1", hl.dsp.window.move_t(1))
for i = 1, 9 do
    -- SUPER + i to focus a workspace
    hl.bind(mainMod .. " + " .. i, hl.dsp.focus({ workspace = i}))
    -- SUPER + i to focus a workspace
    hl.bind(mainMod .. " + SHIFT + " .. i,     hl.dsp.window.move({ workspace = i, follow = false }))
end

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
hl.bind("XF86MonBrightnessUp",  hl.dsp.exec_cmd("brightnessctl -e4 -n2 set 5%+"),                  { locked = true, repeating = true })
hl.bind("XF86MonBrightnessDown",hl.dsp.exec_cmd("brightnessctl -e4 -n2 set 5%-"),                  { locked = true, repeating = true })

-- Requires playerctl
hl.bind("XF86AudioNext",  hl.dsp.exec_cmd("playerctl next"),       { locked = true })
hl.bind("XF86AudioPause", hl.dsp.exec_cmd("playerctl play-pause"), { locked = true })
hl.bind("XF86AudioPlay",  hl.dsp.exec_cmd("playerctl play-pause"), { locked = true })
hl.bind("XF86AudioPrev",  hl.dsp.exec_cmd("playerctl previous"),   { locked = true })
