-- modules/monitors.lua

-- Copyright (C) 2026, Nicolas Scalese
---  Licensed under the GNU GPL v3 or later. Info:  https://www.gnu.org/licenses/gpl-3.0.html



---- ################
---- ### MONITORS ###
---- ################
------ See:  https://wiki.hypr.land/Configuring/Basics/Monitors/


hl.monitor({
    output    =  "";                 -- Automatic
    -- output    =  monitor_Name,       -- Set your monitor in 'vars.lua'

    ---  Monitor Resolution & Resolution Rate
    -- mode      = "preferred",         -- Automatic
    -- mode      = "highres@highrr"     -- Highest available parameters
    mode      =  "1920x1080@144",    --  144Hz : gaming, workstation
    mode      =  "1920x1080@60",     -- 60Hz : default, compatibility, energy saving

    -- position = "auto",
    position  =  "0x0",   

    ---  Interface Zoom (use one of these)
    scale     =  1.00,
    -- scale     =  1.25,
    -- scale     =  1.33;
    -- scale     =  1.50;
    -- scale     =  2.00;

    ---  Monitor bit depth
    -- bitdepth  =  "8"     -- Standard
    bitdepth  =  10    -- HDR / EDR  for gaming/workstation
})
