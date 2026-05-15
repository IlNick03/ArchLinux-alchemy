-- modules/keybindings.lua

-- Copyright (C) 2026, Nicolas Scalese
---  Licensed under the GNU GPL v3 or later. Info:  https://www.gnu.org/licenses/gpl-3.0.html



---- ###################
---- ### KEYBINDINGS ###
---- ###################
------ See:  https://wiki.hypr.land/Configuring/Basics/Binds/
------ See:  https://wiki.hypr.land/Configuring/Basics/Dispatchers/

local map = require("modules.keybindings-map")    -- Import our binds table
local mainMod = "SUPER"                           -- Sets "Windows" key as main modifier

-- === CORE BINDS ===

---  Menus and launchers
map.bind(mainMod .. " + F1",               hl.dsp.exec_cmd(binds_table),                         { description = "Show keybindings table" })
map.bind(mainMod .. " + Space",            hl.dsp.exec_cmd(apps_launcher),                       { description = "Open application launcher" })

--- The most useful apps
map.bind(mainMod .. " + Return",           hl.dsp.exec_cmd(terminal),                            { description = "Launch terminal emulator" })
map.bind(mainMod .. " + E",                hl.dsp.exec_cmd(file_Manager_GUI),                    { description = "Open GUI file manager" })
map.bind(mainMod .. " + ALT + E",          hl.dsp.exec_cmd(file_Manager_TUI),                    { description = "Open TUI file manager" })
map.bind(mainMod .. " + B",                hl.dsp.exec_cmd(browser),                             { description = "Open web browser" })
map.bind("CTRL + SHIFT + Escape",          hl.dsp.exec_cmd(process_Monitor),                     { description = "Open system process monitor" })


-- === WINDOWS, LAYOUT, NAVIGATION, REPOSITIONING ===

---  Windows Management
map.bind(mainMod .. " + V",                hl.dsp.window.float({ action = "toggle" }),           { description = "Toggle floating mode" })
map.bind(mainMod .. " + C",                hl.dsp.window.center(),                               { description = "Center focused window" })
map.bind(mainMod .. " + M",                hl.dsp.window.fullscreen({ mode = 1 }),               { description = "Maximize window (keep gaps)" })
map.bind(mainMod .. " + F",                hl.dsp.window.fullscreen({ mode = 0 }),               { description = "Toggle true fullscreen" })
map.bind(mainMod .. " + P",                hl.dsp.window.pin(),                                  { description = "Pin window (sticky)" })

---  Kill the focused window
local closeWindowBind = map.bind(
         mainMod .. " + K",                hl.dsp.window.close(),                                 { description = "Kill focused window" }
)

---  Layout controls
map.bind(mainMod .. " + J",                hl.dsp.layout("togglesplit"),                         { description = "Toggle horizontal/vertical split" })
map.bind(mainMod .. " + L",                hl.dsp.window.pseudo(),                               { description = "Toggle pseudo-tiling" })

---  Navigation & Focus  (Arrow keys)
map.bind(mainMod .. " + left",             hl.dsp.focus({ direction = "l" }),                    { description = "Focus window left" })
map.bind(mainMod .. " + right",            hl.dsp.focus({ direction = "r" }),                    { description = "Move window right" })
map.bind(mainMod .. " + up",               hl.dsp.focus({ direction = "u" }),                    { description = "Focus window up" })
map.bind(mainMod .. " + down",             hl.dsp.focus({ direction = "d" }),                    { description = "Focus window down" })

---  Window Repositioning  (Shift + arrows)
map.bind(mainMod .. " + SHIFT + left",     hl.dsp.window.move({ direction = "l" }),              { description = "Move window left" })
map.bind(mainMod .. " + SHIFT + right",    hl.dsp.window.move({ direction = "r" }),              { description = "Move window right" })
map.bind(mainMod .. " + SHIFT + up",       hl.dsp.window.move({ direction = "u" }),              { description = "Move window up" })
map.bind(mainMod .. " + SHIFT + down",     hl.dsp.window.move({ direction = "d" }),              { description = "Move window down" })

---  Resize windows  (Alt + arrows) (Repeatable)
map.bind(mainMod .. " + ALT + left",       hl.dsp.window.resize({ x = -30, y =   0, relative = true }),  { repeating = true,  description = "Shrink window width" })
map.bind(mainMod .. " + ALT + right",      hl.dsp.window.resize({ x =  30, y =   0, relative = true }),  { repeating = true,  description = "Expand window width" })
map.bind(mainMod .. " + ALT + up",         hl.dsp.window.resize({ x =   0, y = -30, relative = true }),  { repeating = true,  description = "Shrink window height" })
map.bind(mainMod .. " + ALT + down",       hl.dsp.window.resize({ x =   0, y =  30, relative = true }),  { repeating = true,  description = "Expand window height" })



-- === WORKSPACES ===

---  Switch workspaces with mainMod + [0-9]
---  Move active window to a workspace with:  mainMod + SHIFT + [0-9]
for i = 1, 10 do
    local key = i % 10    -- 10 maps to key 0
    map.bind(mainMod .. " + " .. key,          hl.dsp.focus({ workspace = i}),                   { description = "Switch to workspace " .. i })
    map.bind(mainMod .. " + SHIFT + " .. key,  hl.dsp.window.move({ workspace = i }),            { description = "Move window to workspace " .. i })
end

---  "Magic" workspace (scratchpad)
map.bind(mainMod .. " + S",                hl.dsp.workspace.toggle_special("magic"),             { description = "Toggle magic scratchpad" })
map.bind(mainMod .. " + SHIFT + S",        hl.dsp.window.move({ workspace = "special:magic" }),  { description = "Move window to scratchpad" })
map.bind(mainMod .. " + SHIFT + D",        hl.dsp.window.move({ workspace = "+0"}),              { description = "Detach from workspace (move 0)" })



-- === HARDWARE/MULTIMEDIA CONTROLS (backlight, volume) ===

---  Laptop brightness controls keys
map.bind("XF86MonBrightnessUp",            hl.dsp.exec_cmd("brightnessctl set 5%+"),                         { locked = true, repeating = true,  description = "Increase backlight" })
map.bind("XF86MonBrightnessDown",          hl.dsp.exec_cmd("brightnessctl set 5%-"),                         { locked = true, repeating = true,  description = "Decrease backlight" })

---  Laptop volume controls keys
map.bind("XF86AudioRaiseVolume",           hl.dsp.exec_cmd("wpctl set-volume @DEFAULT_AUDIO_SINK@ 2%+"),     { locked = true, repeating = true,  description = "Increase volume" })
map.bind("XF86AudioLowerVolume",           hl.dsp.exec_cmd("wpctl set-volume @DEFAULT_AUDIO_SINK@ 2%-"),     { locked = true, repeating = true,  description = "Decrease volume" })
map.bind("XF86AudioMute",                  hl.dsp.exec_cmd("wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle"),    { locked = true, repeating = true,  description = "Toggle mute for playback" })
map.bind("XF86AudioMicMute",               hl.dsp.exec_cmd("wpctl set-mute @DEFAULT_AUDIO_SOURCE@ toggle"),  { locked = true, repeating = true,  description = "Toggle mute for microphone" })

---  Music playback control with 'playerctl' (next, pause, play, prev)
map.bind("XF86AudioNext",                  hl.dsp.exec_cmd("playerctl next"),                                { locked = true,                    description = "Next track" })
map.bind("XF86AudioPause",                 hl.dsp.exec_cmd("playerctl play-pause"),                          { locked = true,                    description = "Pause playback" })
map.bind("XF86AudioPlay",                  hl.dsp.exec_cmd("playerctl play-pause"),                          { locked = true,                    description = "Play playback" })
map.bind("XF86AudioPrev",                  hl.dsp.exec_cmd("playerctl previous"),                            { locked = true,                    description = "Previous track" })



-- === MY CUSTOM BINDS ===

---  Futuristic Audio Session (custom 'terminal music player' setup)
----   Only for TRVE music enthusiasts!
map.bind(mainMod .. " + SHIFT + A",        hl.dsp.exec_cmd(scripts_dir .. "/launch-audio-session.sh"),      { description = "Launch the 'futuristic audio session'" })
map.bind(mainMod .. " + SHIFT + ALT + A",  hl.dsp.exec_cmd(scripts_dir .. "/kill-audio-session.sh"),        { description = "Terminate the 'futuristic audio session'" })

---  Wallpaper Changing
map.bind(mainMod .. " + ALT + W",          hl.dsp.exec_cmd(random_WP),                                      { description = "Set a random image as new wallpaper" })

---  Screen Capturing
map.bind("Print", hl.dsp.exec_cmd(screen_shot),                                                  { description = "Capture screenshot" })
map.bind(mainMod .. " + F8",               hl.dsp.exec_cmd(screen_rec_start),                    { description = "Start screen recording" })
map.bind(mainMod .. " + F9",               hl.dsp.exec_cmd(screen_rec_pause),                    { description = "Pause screen recording" })
map.bind(mainMod .. " + F10",              hl.dsp.exec_cmd(screen_rec_stop),                     { description = "Stop screen recording" })
