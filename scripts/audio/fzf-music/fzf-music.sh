#!/bin/bash

# --- GLOBAL ENVIRONMENT SETTINGS ---
export PIPEWIRE_DEBUG=0               # Disable Pipewire debug output for a cleaner terminal
export PIPEWIRE_LOG_LEVEL=0           # Suppress all non-essential warnings
#export PIPEWIRE_QUANTUM=4096          # Optional: static buffer size, dynamic sample rate
export PIPEWIRE_QUANTUM=4096/48000    # Optional: Force a specific buffer/samplerate ratio to prevent underruns


# --- FZF-MUSIC: Search and play music with metadata preview. TUI, minimalistic approach ---
# Dependencies: fzf, fd, mpv, ffprobe, bc

# 1. Define music search paths
MUSIC_PATHS=(
    "$HOME/Music/"                              # Default music folder
    #"/mnt/windows/Users/Default User/Music/"    # Only needed if your PC is set up to dual-boot with Windows
    #"$HOME/Music/Music in Windows/"             # Symlink to the previous folder
    #"/run/media/$USER/"                         # Access music stored on external drives.
)

# 2. Audio Output Configuration
AUDIO_OUT=""                 # Leave empty ("") for automatic routing (best for Bluetooth)
# Alternative options  (uncomment to force a specific driver):
#AUDIO_OUT="--ao=pulse"       # Uses PulseAudio layer
#AUDIO_OUT="--ao=pipewire"    # Native Pipewire (modern and fast, but might ignore system defaults)
#AUDIO_OUT="--ao=alsa"        # Direct to hardware (locks the card, bit-perfect)
#AUDIO_OUT="--ao=jack"        # Professional low-latency


# 3. MPV optimized settings
MPV_OPTS="--no-video --audio-display=no \
          --cache=yes --cache-secs=120 \
          --demuxer-max-bytes=14M --demuxer-max-back-bytes=8M \
          --audio-buffer=2.0 \
          --msg-level=all=status,ffmpeg/demuxer=fatal,ao=fatal \
          --no-msg-module"


# 4. Run FD to find audio files and pipe to FZF
fd -t f -e flac -e wav -e mp3 -e m4a -e aac -e ogg -e opus --follow --hidden . \
    "${MUSIC_PATHS[@]}" 2>/dev/null | \
fzf -m \
    --header "TAB: Select | ENTER: Play Selection | ESC: Exit | MPV: [< Prev] [> Next] [p Pause]" \
    --height 95% \
    --layout=reverse \
    --preview-window="bottom,45%,border-top,wrap" \
    --preview '
        # Detect preview width and create a solid separator
        cols=${FZF_PREVIEW_COLUMNS:-50}
        line=$(printf "─%.0s" $(seq 1 $cols))

        # Extract basic tags using ffprobe (suppressing demuxer and mimetype warnings)
        title=$(ffprobe -v error -show_entries format_tags=title -of default=noprint_wrappers=1:nokey=1 {} 2>/dev/null | sed "s/^[[:space:]]*//;s/[[:space:]]*$//");
        artist=$(ffprobe -v error -show_entries format_tags=artist -of default=noprint_wrappers=1:nokey=1 {} 2>/dev/null | sed "s/^[[:space:]]*//;s/[[:space:]]*$//");

        # Show Title and Artist if they exist in the first box
        if [[ -n "$title" || -n "$artist" ]]; then
            [[ -n "$title" ]] && echo "TITLE:  $title";
            [[ -n "$artist" ]] && echo "ARTIST: $artist";
            echo "$line";
        fi

        # File size and duration calculation
        file_size=$(stat -c%s {});
        duration=$(ffprobe -v error -show_entries format=duration -of default=noprint_wrappers=1:nokey=1 {} 2>/dev/null);

        # Calculate bitrate and size using bc
        if [[ -z "$duration" ]] || (( $(echo "$duration <= 0" | bc -l) )); then
            avg_bitrate="N/A";
        else
            avg_bitrate=$(echo "scale=1; ($file_size * 8 / $duration) / 1000" | bc -l);
        fi
        
        size_mb=$(echo "scale=2; $file_size / 1048576" | bc -l);

        # Technical stream info (Silencing ffmpeg/demuxer output)
        ffprobe -v error -select_streams a:0 -show_streams {} 2>/dev/null | \
        grep -E "codec_name|sample_rate|channels|bits_per_raw_sample" | \
        sed -e "s/bits_per_raw_sample=/bit_depth=/" ;

        echo "avg_bitrate=$avg_bitrate kbps";
        echo "size=$size_mb MB"
    ' \
    --bind "enter:execute(stty -echoctl; sleep 0.5; mpv $AUDIO_OUT $MPV_OPTS {+})" \
    --bind "enter:+clear-query" \
    --bind "enter:+deselect-all" \
    --bind "enter:+first"
