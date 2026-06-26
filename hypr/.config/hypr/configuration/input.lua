-- Configure according to hardware-specific (https://wiki.hypr.land/Configuring/Basics/Variables/#input)
hl.config({
    input = {
        kb_layout  = "latam,us",
        kb_variant = "",
        kb_model   = "",
        kb_options = "grp:alt_shift_toggle,caps:swapescape",
        kb_rules   = "",

	    repeat_rate = 50,
	    repeat_delay = 250,

        follow_mouse = 1,

        sensitivity = 0,
	    accel_profile = "flat",
    },
})

hl.device({
    name        = "logitech-g203-lightsync-gaming-mouse",
    sensitivity = -0.2,
})

