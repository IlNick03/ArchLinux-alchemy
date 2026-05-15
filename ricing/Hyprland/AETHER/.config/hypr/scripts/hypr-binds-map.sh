#!/bin/zsh

# Copyright (C) 2026, Nicolas Scalese
# Licensed under the GNU GPL v3 or later. Info:  https://www.gnu.org/licenses/gpl-3.0.html


# --- A.E.T.H.E.R. BINDINGS EXPLORER (FULL BOX EDITION) ---
# Professional TUI layout with continuous vertical and horizontal borders.

# Deep Arctic Color Palette
local p=$'\e[1;35m' # Purple (Main Modifiers)
local c=$'\e[1;36m' # Cyan (Secondary Modifiers / Dispatchers)
local w=$'\e[0;37m' # White (Physical Keys / Descriptions)
local b=$'\e[1;34m' # Arctic Blue (Borders and Separators)
local r=$'\e[0m'    # Reset formatting

# Box Drawing Characters logic:
#   ╭───┬───╮  (Top)
#   │   │   │  (Middle)
#   ├───┼───┤  (Separator)
#   ╰───┴───╯  (Bottom)


# 1. Top Border (Rounded Corners)
# Total width: 40 (Keys) + 40 (Desc) + separators
printf "${b}╭$(printf '─%.0s' {1..40})┬$(printf '─%.0s' {1..42})╮${r}\n"

# 2. Header Row
printf "${b}│ ${p}%-38s ${b}│ ${p}%-40s ${b}│${r}\n" "KEY COMBINATIONS" "DESCRIPTION"

# 3. Middle Separator
printf "${b}├$(printf '─%.0s' {1..40})┼$(printf '─%.0s' {1..42})┤${r}\n"

# 4. Data Extraction
hyprctl binds -j | jq -r '.[] | 
    (if (.modmask >= 64) then "SUPER" else "" end) as $s |
    (if ((.modmask / 1 % 2) >= 1) then "SHIFT" else "" end) as $sh |
    (if ((.modmask / 8 % 2) >= 1) then "ALT"   else "" end) as $al |
    
    # Key Truncation
    (.key | ascii_upcase | if length > 18 then .[0:15] + "..." else . end) as $k |
    
    # Description Sanitization (Truncated to 40 for the new compact view)
    (if .description == "" or (.description | contains("__lua")) then "-" else .description end | if length > 40 then .[0:37] + "..." else . end) as $desc |
    
    "\($s)§\($sh)§\($al)§\($k)§\($desc)"
' | while IFS='§' read -r s sh al k desc; do
    
    # 5. Data Rows
    printf "${b}│ ${p}%-7s${c}%-8s${p}%-5s${w}%-18s ${b}│ ${w}%-40s ${b}│${r}\n" \
        "$s" "$sh" "$al" "$k" "$desc"
done

# 6. Bottom Border (Rounded Corners)
printf "${b}╰$(printf '─%.0s' {1..40})┴$(printf '─%.0s' {1..42})╯${r}\n"

# Footer Exit Prompt
printf "\n${b} Press any key to close...${r}"
read -k 1 -s