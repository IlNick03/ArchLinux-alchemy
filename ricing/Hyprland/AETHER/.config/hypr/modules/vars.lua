-- modules/vars.lua

-- Copyright (C) 2026, Nicolas Scalese
---  Licensed under the GNU GPL v3 or later. Info:  https://www.gnu.org/licenses/gpl-3.0.html



---- #############################
---- ### ENVIRONMENT VARIABLES ###
---- #############################
------ See:  https://wiki.hypr.land/Configuring/Advanced-and-Cool/Environment-variables/


hl.env("XCURSOR_SIZE",    "24")
hl.env("HYPRCURSOR_SIZE", "24")

-- Inform apps that we are in a Wayland/Hyprland environment
hl.env("XDG_CURRENT_DESKTOP", "Hyprland")
hl.env("XDG_SESSION_TYPE",    "wayland")
hl.env("XDG_SESSION_DESKTOP", "Hyprland")


-- === GRAPHIC CARD ===
---  Manage your dual-GPU configuration:

---  (a) Rendering with iGPU Intel - battery saving
hl.env("WLR_DRM_DEVICES",           "/dev/dri/by-path/pci-0000:00:02.0-card:/dev/dri/by-path/pci-0000:01:00.0-card")
hl.env("LIBVA_DRIVER_NAME",         "i915")
hl.env("__GLX_VENDOR_LIBRARY_NAME", "mesa")

---  (b) Rendering with dGPU NVIDIA - performance
-- hl.env("LIBVA_DRIVER_NAME",         "nvidia")
-- hl.env("GBM_BACKEND",               "nvidia-drm")
-- hl.env("__GLX_VENDOR_LIBRARY_NAME", "nvidia")


-- === MODERN THEMING STRATEGY ===
-- Force QT apps to look for qt6ct configuration
hl.env("QT_QPA_PLATFORMTHEME", "qt6ct")





---- #####################################
---- ### MY PROGRAMS & OTHER VARIABLES ###
---- #####################################
------ Using Lua's global table (_G) so these are accessible in binds.lua and autostart.lua


-- === Set here your relevant directories ===
_G.home_dir             =  os.getenv("HOME")
_G.scripts_dir          =  os.getenv("HOME") .. "/scripts"                   
-- _G.scripts_dir          =  os.getenv("HOME") .. "/.config/hypr/scripts"

---  Move all useful scripts mentioned in Hyprland configuration files in the same folder, 
----   or specify the full path for each individually where needed



-- === Set PROGRAMS that you use ===

---  Hyprland "extensions"
_G.status_bar           =  "waybar"
_G.notification_daemon  =  "dunst"
_G.wifi_menu            =  "nm-applet --indicator"
_G.bluetooth_menu       =  "blueman-applet"
_G.idle_daemon          =  "hypridle"
-- _G.binds_table          =  "hyprkcs"    -- It does not yet support new Hyprland's Lua configuration.
_G.binds_table          =  "alacritty -T \"Keybindings Table [$(date +\'%Y%m%d-%H%M%S\')]\" --class floating_bindsmap -e " .. home_dir .. "/.config/hypr/scripts/hypr-binds-map.sh"
_G.apps_launcher        =  "wofi --show drun --conf \"" .. home_dir .. "/.config/wofi/config\" --style \"" .. home_dir .. "/.config/wofi/style.css\""
_G.auth_manager         =  "/usr/lib/polkit-gnome/polkit-gnome-authentication-agent-1"

---  Terminal User Iterface (TUI) programds
_G.terminal             =  "alacritty -T \"Alacritty [$(date +\'%Y%m%d-%H%M%S\')]\" -e zsh --login -c \"tmux\""
_G.process_Monitor      =  "alacritty -T \"Process Monitor (btop) [$(date +\'%Y%m%d-%H%M%S\')]\" --class floating_monitor -e btop"
_G.file_Manager_TUI     =  "alacritty -T \"File Manager (yazi) [$(date +\'%Y%m%d-%H%M%S\')]\" -e yazi"
_G.aether_logo          =  "alacritty --class aether_logo -e less " .. home_dir .. "/.config/hypr/hyprland.lua"    -- See 'autostart.lua'

---  Graphical User Interface (GUI) programs
_G.file_Manager_GUI     =  "thunar"
_G.browser              =  "librewolf"



-- === MONITOR, WALLPAPER, SCREEN CAPTURING ===

---  Monitor
-- _G.monitor_Name         =  "eDP-1"    -- See 'monitors.lua'

---  Set your "relevant" directories
_G.initial_WP           =  scripts_dir .. "/.config/hypr/splash.jpg"

---  Choose a random image as next wallpaper
----   (a) Use 'hyprpaper' ->  native way, better resize quality
_G.random_WP            =  scripts_dir .. "/random-wallpaper-hypr.sh"
----   (b) Use 'swaybg'    ->  solid choice, generalist for Wayland desktops
-- _G.random_WP            =  scripts_dir .. "/random-wallpaper-swaybg.sh" 


---  Screenshots
----  (I)   'slurp' selects a specific region of your screen
----  (II)  'grim' captures the pixel buffer
----  (III) 'imagemagick' compresses color depth down to standard 8-bit per channel to enhance compatibility across devices
local screen_shot_dir   =  home_dir .. "/Pictures/Screenshots"           -- You probably need to edit this path
local screen_shot_name  =  "/Screenshot_$(date +\'%Y%m%d_%H%M%S\').png"
_G.screen_shot          =  "grim -g \"$(slurp)\" - | magick - -depth 8 -colorspace sRGB \"" .. screen_shot_dir .. screen_shot_name .. "\" "

--- Screen Recording
---- Uses 'obs-studio' and its 'obs-cmd' command-line interface
_G.screen_rec_start     =  "obs-cmd recording start"
_G.screen_rec_stop      =  "obs-cmd recording stop"
_G.screen_rec_pause     =  "obs-cmd recording toggle-pause"
