-- modules/autostart.lua

-- Copyright (C) 2026, Nicolas Scalese
---  Licensed under the GNU GPL v3 or later. Info:  https://www.gnu.org/licenses/gpl-3.0.html



---- #################
---- ### AUTOSTART ###
---- #################
------ See:  https://wiki.hypr.land/Configuring/Basics/Autostart/


hl.on("hyprland.start", function () 
    
    -- === Autostart necessary processes (notifications daemons, status bars, etc.)  ===
    
    ---  Force reload to ensure that GPU drivers are fully initialized
    -- hl.exec_cmd(sleep 2; hyprctl reload)

    ---  Set the first wallpaper at start. Choose between:
    ----  (a) 'hyprpaper'  ->  native choice, better resize quality
    hl.exec_cmd(home_dir .. "/.config/hypr/scripts/init-wallpaper.sh")
    ----  (b) 'swaybg'     ->  solid choice, generalist for Wayland desktops
    -- hl.exec_cmd("swaybg -i" .. initial_WP .. "-m fill &")
    ----  (c)  random WP   ->  randolmy choose the initial wallpaper (see vars.lua)
    -- hl.exec_cmd("sleep 0.2 && " .. random_WP)


    --- Run the Hyprland "extensions"
    hl.exec_cmd(status_bar)
    hl.exec_cmd(notification_daemon)
    hl.exec_cmd(wifi_menu)
    hl.exec_cmd(bluetooth_menu)
    hl.exec_cmd(auth_manager)
    hl.exec_cmd(idle_daemon .. " &")    -- Start the daemon in background


    -- === Execute your favorite apps at launch ==
    -- hl.exec_cmd("sleep 1    && " .. terminal)
    hl.exec_cmd("sleep 1.5  &&  " .. aether_logo)    -- See 'vars.lua'

end)



