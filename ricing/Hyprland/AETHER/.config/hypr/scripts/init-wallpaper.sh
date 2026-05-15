#!/bin/zsh

# Copyright (C) 2026, Nicolas Scalese
# Licensed under the GNU GPL v3 or later. Info:  https://www.gnu.org/licenses/gpl-3.0.html


# 1. Kill any existing instance to start fresh
killall hyprpaper

# 2. Start hyprpaper in the background
hyprpaper &

# 3. Wait until the IPC socket is actually ready
sleep 1

# 4. Force the splash wallpaper
hyprctl hyprpaper preload "$HOME/.config/hypr/splash.jpg"
hyprctl hyprpaper wallpaper "eDP-1,$HOME/.config/hypr/splash.jpg"

# 3. Wait until the wallpaper is set
sleep 1

# 5. Unload the wallpaper (to save RAM)
hyprctl hyprpaper unload all
