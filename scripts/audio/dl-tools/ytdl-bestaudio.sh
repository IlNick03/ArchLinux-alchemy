#!/bin/bash

# --- Universal Best Audio Extractor (Auto-Title & Codec-Sensing) ---
# Syntax:    ytdl-bestaudio <URL> [custom_filename] [output_folder]

# Disclaimer: This script is a wrapper for yt-dlp.
# It is intended for educational purposes and personal archival of non-copyrighted or Creative Commons material. 
# The author is not responsible for any misuse or violation of third-party Terms of Service.


# 1. Validation: URL is mandatory
# Tip: Enclose the URL in quotation marks to avoid special characters errors. 
if [ -z "$1" ]; then
    echo "Usage:    ytdl-bestaudio <URL> [custom_filename] [output_folder]"
    exit 1
fi

URL="$1"
USER_FILENAME="$2"
OUT_DIR="${3:-.}"
OUT_DIR="${OUT_DIR%/}"

# 2. Metadata Extraction: Get the web title if no filename is provided
if [ -z "$USER_FILENAME" ]; then
    echo "Fetching media title from web..."
    FILENAME=$(yt-dlp --print "%(title)s" --restrict-filenames "$URL")
    #RAW_TITLE=$(yt-dlp --print "%(title)s" --no-warnings "$URL")
    #FILENAME=$(echo "$RAW_TITLE" | sed 's/\//-/g')
else
    FILENAME="$USER_FILENAME"
fi

# 3. Directory Management
if [ ! -d "$OUT_DIR" ]; then
    mkdir -p "$OUT_DIR"
fi

echo "========================================"
echo "Target: $URL"
echo "Title Identified: $FILENAME"
echo "========================================"

# 4. Download to a unique temporary file
# We use the PID ($$) to ensure no collisions if running multiple instances
TEMP_BASE="$OUT_DIR/atmp_$$"

yt-dlp \
    --js-runtimes bun \
    --remote-components ejs:github \
    -f "bestaudio/best" \
    -x --audio-format best \
    -o "$TEMP_BASE.%(ext)s" \
    "$URL"

# Verify download success
if [ $? -ne 0 ]; then
    echo "Error: Download failed."
    exit 1
fi

# Locate the downloaded file (handling any extension yt-dlp chose)
DOWNLOADED_FILE=$(ls "$TEMP_BASE".* | head -n 1)

# 5. Advanced Codec Probing
# Extract the internal codec name using ffprobe
REAL_CODEC=$(ffprobe -v error -select_streams a:0 -show_entries stream=codec_name -of default=noprint_wrappers=1:nokey=1 "$DOWNLOADED_FILE")

if [ -z "$REAL_CODEC" ]; then
    echo "Error: Could not determine codec via ffprobe."
    # Fallback: keep the existing file if probing fails
    exit 1
fi

# 6. Final Assembly
# Move the probed file to the final path with the correct codec extension
FINAL_FILE="$OUT_DIR/$FILENAME.$REAL_CODEC"
mv "$DOWNLOADED_FILE" "$FINAL_FILE"

echo "========================================"
echo "Success!"
echo "Final Path: $FINAL_FILE"
echo "Codec: $REAL_CODEC"
echo "========================================"
