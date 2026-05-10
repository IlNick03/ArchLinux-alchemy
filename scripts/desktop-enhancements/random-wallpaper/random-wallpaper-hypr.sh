#!/bin/zsh
# Copyright (C) 2026, Nicolas Scalese
# Licensed under the GNU GPL v3 or later. Info:  https://www.gnu.org/licenses/gpl-3.0.html


# --- CONFIGURATION ---

# Set your wallpaper directory here. 
# Defaults to the standard XDG Pictures folder if not specified.
# Stable, dynamic strategy using symlink remains valid during the transition.
WALLPAPER_DIR="${1:-$HOME/Pictures/Wallpapers}"

# Target User ID (standard for the primary user is 1000)
USER_ID=$(id -u)

# Unique identifier for this execution to avoid cache hits
SESSION_ID=$(date +%N)
TMP_WP="/tmp/wp_${SESSION_ID}.img"


# --- ENVIRONMENT SETUP ---
export XDG_RUNTIME_DIR="/run/user/$USER_ID"
export HYPRLAND_INSTANCE_SIGNATURE=$(ls -1rt $XDG_RUNTIME_DIR/hypr/ 2>/dev/null | grep -v ".sock" | tail -n 1)

# Exit silently if Hyprland is not active
[[ -z "$HYPRLAND_INSTANCE_SIGNATURE" ]] && exit 0


# --- RANDOM IMAGE PICKING ---

# Searching for images using case-insensitive regex for common web/desktop formats.
# 'shuf' selects exactly one random entry from the results.
if command -v fd &> /dev/null; then
    # We try to use 'fd' (faster, Rust-based) if available
    # fd syntax is much cleaner: -e for extensions, -i for case-insensitive
    RANDOM_IMAGE=$(fd -e jpg -e jpeg -e png -e webp -e avif -i . "$WALLPAPER_DIR" | shuf -n 1)
else
    # Otherwise fallback to 'find', for universal compatibility
    RANDOM_IMAGE=$(find "$WALLPAPER_DIR" -type f -iregex '.*\.\(jpg\|jpeg\|png\|webp\|avif\)' | shuf -n 1)
fi

# Verifying that the directory is not empty or invalid
if [ -z "$RANDOM_IMAGE" ]; then
    echo "Error: No valid images (.jpg, .png, .webp, .avif) found in: $WALLPAPER_DIR"
    exit 1
fi

# Symlink creation
# This bypasses the "space in path" issue and forces hyprpaper to see it as a new resource.
ln -sf "$RANDOM_IMAGE" "$TMP_WP"


# --- CHANGE THE CURRENT WALLPAPER ---

# Monitor identification
MONITORS=(${(f)"$(hyprctl monitors | grep 'Monitor' | awk '{print $2}' | sed 's/://g')"})

# IPC Execution: preload the new symlink
hyprctl hyprpaper preload "$TMP_WP"

# Applying the wallpaper to all detected monitors
for m in $MONITORS; do
    hyprctl hyprpaper wallpaper "$m,$TMP_WP"
done


# --- Safe Cleanup --- 

# Waiting a few seconds to ensure the GPU has swapped the buffers.
# Then unloading only the "unused" images (the previous ones).
sleep 2
hyprctl hyprpaper unload unused

# Clean up all symlinks in /tmp EXCEPT the one we just set
# This prevents the black screen by keeping the current file accessible
find /tmp -name "wp_*.img" ! -name "wp_${SESSION_ID}.img" -delete 2>/dev/null

echo "Wallpaper successfully updated to: $(basename "$RANDOM_IMAGE")"
