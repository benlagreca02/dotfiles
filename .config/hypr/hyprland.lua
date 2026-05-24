
require("autostarts")
require("inputAndKeybindings")


-- Monitor rule
hl.monitor({
    output = "",
    mode = "preferred",
    position = "auto",
    scale = "1",
})


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

