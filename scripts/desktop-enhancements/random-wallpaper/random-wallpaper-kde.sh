#!/bin/bash
# Copyright (C) 2026, Nicolas Scalese
# Licensed under the GNU GPL v3 or later. Info:  https://www.gnu.org/licenses/gpl-3.0.html

# --- CONFIGURATION ---
# Set your wallpaper directory here. 
# Defaults to the standard XDG Pictures folder if not specified.
WALLPAPER_DIR="${1:-$HOME/Pictures/Wallpapers}"

# Target User ID (standard for the primary user is 1000)
USER_ID=$(id -u)


# --- ENVIRONMENT SETUP ---
# Required for DBus to communicate with the KDE Plasma session
# especially when triggered via cron, systemd, or TTY.
export DISPLAY=:0
export DBUS_SESSION_BUS_ADDRESS=unix:path=/run/user/$USER_ID/bus

# Brief pause to ensure the PlasmaShell is responsive during login/resume
sleep 2

# --- PREREQUISITE CHECK ---
# Ensure dbus-send and find are available
if ! command -v dbus-send &> /dev/null; then
    echo "Error: dbus-send is not installed. Please install 'dbus'."
    exit 1
fi

# --- LOGIC ---
# Search for images using case-insensitive regex for common web/desktop formats.
# 'shuf' selects exactly one random entry from the results.
if command -v fd &> /dev/null; then
    # We try to use 'fd' (faster, Rust-based) if available
    # fd syntax is much cleaner: -e for extensions, -i for case-insensitive
    RANDOM_IMAGE=$(fd -e jpg -e jpeg -e png -e webp -e avif -i . "$WALLPAPER_DIR" | shuf -n 1)
else
    # Otherwise fallback to 'find', for universal compatibility
    RANDOM_IMAGE=$(find "$WALLPAPER_DIR" -type f -iregex '.*\.\(jpg\|jpeg\|png\|webp\|avif\)' | shuf -n 1)
fi

# Verify that the directory is not empty or invalid
if [ -z "$RANDOM_IMAGE" ]; then
    echo "Error: No valid images (.jpg, .png, .webp, .avif) found in: $WALLPAPER_DIR"
    exit 1
fi

# --- KDE PLASMA DBUS INJECTION ---
# We invoke the PlasmaShell Scripting API via DBus.
# This script iterates through all connected monitors (desktops) 
# and updates the 'Image' key in the wallpaper configuration group.
dbus-send --session --dest=org.kde.plasmashell --type=method_call /PlasmaShell org.kde.PlasmaShell.evaluateScript "string:
var allDesktops = desktops();
for (var i = 0; i < allDesktops.length; i++) {
    var d = allDesktops[i];
    d.wallpaperPlugin = 'org.kde.image';
    d.currentConfigGroup = Array('Wallpaper', 'org.kde.image', 'General');
    d.writeConfig('Image', 'file://${RANDOM_IMAGE}');
}"

echo "SUCCESS: Wallpaper updated to $(basename "$RANDOM_IMAGE")"
