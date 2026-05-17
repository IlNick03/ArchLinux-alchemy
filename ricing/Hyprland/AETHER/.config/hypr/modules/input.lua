-- modules/input.lua

-- Copyright (C) 2026, Nicolas Scalese
---  Licensed under the GNU GPL v3 or later. Info:  https://www.gnu.org/licenses/gpl-3.0.html



---- #############
---- ### INPUT ###
---- #############
------ See:  https://wiki.hypr.land/Configuring/Basics/Variables/#input


hl.config({
    input = {
        --- Keyboard layour configuration (You need to edit these!)
        kb_layout           =  "us",      -- Otherwise: "it", "fr", "de", ...
        kb_variant          =  "",
        kb_model            =  "",        -- Otherwise: "pc105", ...
        kb_options          =  "",
        kb_rules            =  "",

        --- Optional: Force NumLock on at startup
        numlock_by_default  =  false,

        --- Mouse and touchpad behaviour
        follow_mouse        =   1,
        sensitivity         =   0,     --  -1.0 - 1.0, 0 means no modification.

        -- See:  https://wiki.hypr.land/Configuring/Basics/Variables/#touchpad
        touchpad = {
            natural_scroll  =  true,
            tap_to_click    =  true
        }
    }
})


-- See:  -- See:  https://wiki.hypr.land/Configuring/Basics/Variables/#gestures
-- See https://wiki.hypr.land/Configuring/Gestures
gesture = {
    fingers                 =   3, 
    direction               =  "horizontal", 
    action                  =  "workspace"
}

-- Example per-device config
-- See:  https://wiki.hypr.land/Configuring/Advanced-and-Cool/Devices/
device = {
    name                    =  "epic-mouse-v1",
    sensitivity             =  -0.5
}
