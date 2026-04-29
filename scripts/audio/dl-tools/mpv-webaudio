#!/bin/bash
# Copyright (C) 2026, Nicolas Scalese
# Licensed under the GNU GPL v3 or later. Info:  https://www.gnu.org/licenses/gpl-3.0.html


# --- MPV Web Audio Streamer ---
# Syntax:    mpv-webaudio <url>
# Dependencies:  yt-dlp, mpv

# Disclaimer: This script is a wrapper for yt-dlp.
# It is intended for educational purposes and personal archival of non-copyrighted or Creative Commons material. 
# The author is not responsible for any misuse or violation of third-party Terms of Service.


# 1. Validation: URL is mandatory
# Tip: Enclose the URL in quotation marks to avoid special characters errors. 
if [ -z "$1" ]; then
    echo "Syntax:    mpv-webaudio <url>"
    exit 1
fi

# 2. Clear terminal for a fresh start
clear

# 3. Define your optimized MPV options
MPV_OPTS="--no-video \
          --audio-display=no \
          --cache=yes --cache-secs=120 \
          --demuxer-max-bytes=14M --demuxer-max-back-bytes=8M \
          --audio-buffer=2.0"

# 4. Stream: yt-dlp fetches best audio and pipes it to mpv
# -q: quiet (no download bar)
yt-dlp -q -f "bestaudio/best" -x -o - "$1" | mpv $MPV_OPTS -
