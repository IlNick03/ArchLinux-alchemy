-- modules/theme.lua

-- Copyright (C) 2026, Nicolas Scalese
---  Licensed under the GNU GPL v3 or later. Info:  https://www.gnu.org/licenses/gpl-3.0.html



---- #####################
---- ### LOOK AND FEEL ###
---- #####################
------ Refer to:  https://wiki.hypr.land/Configuring/Basics/Variables/


hl.config({
    general = {
        gaps_in                  =   8,
        gaps_out                 =  24,

        border_size              =   3,

        col = {
            active_border        =  { colors = {"rgba(33ccffee)", "rgba(00ff99ee)"}, angle = 45 },
            inactive_border      =  "rgba(595959aa)",
        },

        --- Set to true to enable resizing windows by clicking and dragging on borders and gaps
        resize_on_border         =  true,    -- default:  false

        --- Please see:  https://wiki.hypr.land/Configuring/Advanced-and-Cool/Tearing/ before you turn this on
        --- Useful for gaming
        allow_tearing            =  false,

        layout                   =  "dwindle",
    },

    decoration = {
        rounding                 =  24,    -- default: 10
        rounding_power           =  10,    -- default:  2

        --- Change transparency of focused and unfocused windows
        -----   0 -> invisible ,  1.0 -> opaque
        active_opacity           =   0.90,    -- default: 1.0
        inactive_opacity         =   0.85,    -- default: 1.0

        shadow = {
            enabled              =  true,
            range                =   4,
            render_power         =   3,

            ---  The Color
            -- color                =  "0xee1a1a1a",         -- Default
            -- color                =  "rgba(1a1a1aee)",     -- Default (RGBA)
            color                =  "rgba(3a0ca3aa)",        -- Deep Indigo (RGBA)
            -- color                =  "rgba(7209b7aa)",        -- Dream Violet (RGBA)
        },

        blur = {
            --- More blur quality -> more GPU calculations
            enabled              =  true,
            size                 =   1,         -- default: 3
            passes               =   4,         -- default: 1
            vibrancy             =   0.1696,    -- default: 0.1696

            --- Fine-tuning the look
            brightness           =   1.2,        -- default: 0.8172
            contrast             =   1.5,        -- default: 0.8916
            vibrancy             =   0.6,        -- default: 0.1696
            vibrancy_darkness    =     0         -- default: 0
        },
    },

    animations = {
        enabled                  =  true
    },

    
    -- Please see:  https://wiki.hypr.land/Configuring/Layouts/Dwindle-Layout/
    dwindle = {
        preserve_split           =  true    -- You probably want this
    },

    -- Please see:  https://wiki.hypr.land/Configuring/Layouts/Master-Layout/
    master = {
        new_status               =  "master"
    },
 
    misc = {
        force_default_wallpaper  =   0,          -- Set to 0 or 1 to disable the anime mascot wallpapers
        disable_hyprland_logo    =  true,        -- If true disables the random hyprland logo / anime girl background. :(
        background_color         =  0x000000     -- Sets the underlying canvas color to black (prevents grey/white flashes)
    }

})
