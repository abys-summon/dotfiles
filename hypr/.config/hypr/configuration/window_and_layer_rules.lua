hl.layer_rule({
    name            = "blur-for-rofi",
    match           = { namespace = "rofi" },
    blur            = true,
    ignore_alpha    = 0.5,
})

hl.layer_rule({
    name            = "no-anim-for-selection",
    match           = { namespace = "selection" },
    no_anim         = true,
})

hl.layer_rule({
    name            = "pretty-swaync",
    match           = { namespace = "swaync-control-center" },
    animation       = "slide right",
    blur            = true,
    ignore_alpha    = 0.5,
})

hl.layer_rule({
    name            = "no-anim-for-hyprpicker",
    match           = { namespace = "hyprpicker" },
    no_anim         = true,
})

hl.window_rule({
    name = "opacity-for-vscodium",
    match = { class = "codium" },
    opacity = 0.8,
})

hl.window_rule({
    name = "opacity-for-thunar",
    match = { class = "thunar" },
    opacity = 0.8,
})

