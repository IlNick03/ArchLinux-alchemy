#!/bin/bash
# Copyright (C) 2026, Nicolas Scalese
# Licensed under the GNU GPL v3 or later.


# --- CONFIGURATION ---
# Target directory (your favorites folder on the Windows partition)
WALLPAPER_DIR="/home/nicolas/Immagini/Immagini in Windows/Sfondi HD per desktop/Preferiti/"


# --- SELECTION LOGIC ---

# Picking a random image using 'fd' (fast) or 'find' (universal)
if command -v fd &> /dev/null; then
    RANDOM_IMAGE=$(fd -e jpg -e jpeg -e png -e webp -e avif -i . "$WALLPAPER_DIR" | shuf -n 1)
else
    RANDOM_IMAGE=$(find "$WALLPAPER_DIR" -type f -iregex '.*\.\(jpg\|jpeg\|png\|webp\|avif\)' | shuf -n 1)
fi

# Exit if no image was found
if [ -z "$RANDOM_IMAGE" ]; then
    echo "Error: No valid images found in: $WALLPAPER_DIR"
    exit 1
fi


# --- SWAYBG IMPLEMENTATION (WALLPAPER CHANGING) ---

# Ensure swaybg is installed before proceeding
if ! command -v swaybg &> /dev/null; then
    echo "Error: 'swaybg' is not installed."
    exit 1
fi

# Kill the existing swaybg process to free resources and apply the new wallpaper
pkill swaybg

# Launch swaybg in the background with the 'fill' mode
# The process is started with '&' to allow the script to exit immediately
swaybg -i "$RANDOM_IMAGE" -m fill &


# --- FINAL OPERATIONS ---
# Optional: detach the process to prevent it from closing if the terminal is closed
disown

echo "Wallpaper successfully updated to: $(basename "$RANDOM_IMAGE")"
