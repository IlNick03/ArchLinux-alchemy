# 🧪 Easy and powerful Scripts

> [!NOTE]
> While crafted on *Arch*, most of these scripts and configurations are designed to be universal and will work on any *Linux* distribution, provided the necessary dependencies are met.


---


## *[audio/dl-tools](./audio/dl-tools)*
A precision toolset for distilling high-quality digital audio from the web aether, relying on [yt-dlp](https://github.com/yt-dlp/yt-dlp) as core engine.

> [!WARNING]
> **Legal Disclaimer**: 
> The tools contained within this directory are wrappers designed for **educational purposes** and **personal archival** of public domain, non-copyrighted, or Creative Commons licensed content.
> Use these scripts at your own risk and responsibility.
> The author does not condone or encourage the unauthorized downloading of copyrighted material and is not liable for any misuse of this software that violates the Terms of Service of any media provider or local jurisdiction laws.


### *[mpv-webaudio.sh](./audio/dl-tools/mpv-webaudio.sh)*
A streamlined solution for seizing and catching web audio streams real-time web audio, directly via terminal, without the weight of a browser or local storage.

- **Features:**
  - **Zero-Footprint Streaming:** Pipes the raw audio data from `yt-dlp` directly into `mpv`, bypassing the need to create temporary files;
  - **Optimized Buffering:** Pre-configured with specific cache and demuxer limits to ensure stable playback even on fluctuating connections;
  - **Headless Operation:** Forces a no-video, no-display mode to minimize CPU and RAM usage, focusing purely on the auditory experience.

#### Dependencies (Ingredients)
To achieve seamless real-time streaming, ensure these elements are active:
- [yt-dlp](https://github.com/yt-dlp/yt-dlp) - The extraction engine;
- [mpv](https://mpv.io/) - The high-performance media renderer used for output.

#### Shell Integration
Add this alias to your `.bashrc` or `.zshrc`:

```bash
alias mpv-webaudio='~/scripts/audio/dl-tools/mpv-webaudio.sh'
```


### *[ytdl-bestaudio.sh](./audio/dl-tools/ytdl-bestaudio.sh)*
A sophisticated wrapper for `yt-dlp` designed to isolate, extract, and verify the highest quality audio streams available.

- **Features:**
    - **Smart Codec-Sensing:** Uses `ffprobe` to analyze the internal stream and assign the mathematically correct extension (e.g., `.opus`, `.aac`) rather than a generic container name;
    - **Path Sanitization:** Automatically transmutes illegal characters (like `/`) in web titles into shell-safe symbols to prevent directory errors;
    - **Best-quality Priority:** Ensures the best lossy compression ratio available;
    - **Atomic Operations:** Uses PID-based temporary files to allow multiple concurrent extractions without data collision.

#### Dependencies (Ingredients)
To correctly retrieve and verify audio streams, the following "ingredients" must be present:
- [yt-dlp](https://github.com/yt-dlp/yt-dlp) - The core engine for media extraction. Always keep it updated (`yt-dlp --update`);
- [ffmpeg](https://ffmpeg.org/) - Specifically `ffmpeg` for extraction and `ffprobe` for stream analysis;
- [bun](https://bun.sh/) or [deno](https://deno.com/) (Optional but strongly recommended) - High-performance JS runtimes to solve provider challenges and avoid `HTTP 403` errors;
- [coreutils](https://www.gnu.org/software/coreutils/) - Provides `shuf` and `sed` for title sanitization and randomization.

#### Shell Integration
Add this alias to your `.bashrc` or `.zshrc` for instant access:

```bash
alias ytdl-bestaudio='~/scripts/audio/dl-tools/ytdl-bestaudio.sh'
```


### 💡 Expert Lessons & Troubleshooting (Bonus)
To ensure a successful fetching of web streams, follow these principles:

1.  **Keep the Engine Sharp** - Platforms like *YouTube* update their defenses daily. If a download fails, ensure your engine is up to date: `yt-dlp -update`;
2.  **The "Warm-up" Technique** - For videos protected by modern challenges (PO-Tokens), open the URL in your browser (e.g., *[LibreWolf](https://librewolf.net/)*) and let the media play for a few seconds. This "warms up" your IP and session, clearing the path for the script;
3.  **Quote the URL** - Always wrap the web link in double quotes when launching the script to prevent the shell from misinterpreting special characters like `&` or `?`.
    Example:  `ytdl-bestaudio "https://www.youtube.com/watch?v=..."`
4.  **The "*IP*-Flagging" Reality** – Intense use of these tools may trigger **HTTP 4xx errors** (typically 403 or 429). This happens when the provider's server flags your IP address for unusual traffic. To dissolve this block:
    - **The "Warm-up" Technique**: Open the URL in your browser (e.g., *[LibreWolf](https://librewolf.net/)*) and play the media for a few seconds. This validates your session;
    - **Authentication**: Consider passing cookies from your browser to the script (e.g., using `--cookies-from-browser`);
    - **Metamorphosis**: Change your digital signature by toggling a ***VPN*** or reconnecting your router to obtain a fresh *IP*;
    - **Patience**: Sometimes, the best remedy is simply to wait a few hours for the "heat" on your *IP* to dissipate.


---


## *[audio/fzf-music](./audio/fzf-music/)*
A minimalistic TUI (Terminal User Interface) ecosystem for music management and shell optimization.


### *[fzf-music.sh](./audio/fzf-music.sh)*
A lightweight script that leverages fuzzy searching for high-fidelity playback.
- **Features:**
    - Minimalistic approach to music, without frills or distractions;
    - Instant metadata preview (*Artist*, *Title*, *File path*, *Bitrate*, *Size*);
    - Multi-selection support;
    - Low resource consumption (nearly 100-130 MB of RAM) while effortlessly managing Hi-Res audio;
    - Optimized for audio stability in Pipewire;
    - Adjust the audio settings (*audio server*, *sample rate*) in the script to suit your needs.
- **Logic:** Designed to provide a "distilled" music experience directly from the terminal, bypassing heavy GUI applications.

#### *[.fzf-config (dotfile)](./dotfiles/shell/custom/fzf/.fzf-config)*
A vital supplement to your shell configuration (`.bashrc` or `.zshrc`).
- **Purpose:** It bridges your terminal with the script by providing a global alias and optimizing the UI/performance of `fzf` and `fd` system-wide.

#### Dependencies (Ingredients)
To translate the code into sound, the following "ingredients" must be present on your system:
- [fzf](https://github.com/junegunn/fzf) - The interactive fuzzy finder;
- [fd](https://github.com/sharkdp/fd) - A simple, fast and user-friendly alternative to 'find';
- [mpv](https://mpv.io/) - The versatile media player used as the audio engine;
- [ffmpeg](https://ffmpeg.org/) - Specifically `ffprobe`, used for deep metadata extraction;
- [bc](https://www.gnu.org/software/bc/) - Used for precise bitrate and file size calculations.

#### Shell Integration
Add the following line to your ~/.zshrc or ~/.bashrc:

```bash
[[ -f "$HOME/scripts/dotfiles/shell/custom/fzf/.fzf-config" ]]  &&  source "$HOME/scripts/dotfiles/shell/custom/fzf/.fzf-config"
```


---


## *[desktop-enhancements/random-wallpaper](./desktop-enhancements/random-wallpaper/)*
A sophisticated automation tool for dynamic desktop aesthetics.


### *[random-wallpaper-hypr.sh](./desktop-enhancements/random-wallpaper/random-wallpaper-hypr.sh)*
An advanced script designed for ***[Hyprland](https://hyprland.org/)*** that orchestrates a visual metamorphosis through `hyprpaper`.

- **Features:**
    - **Symlink Masking Strategy:** Transmutes the selected image into a temporary symlink to bypass path issues (spaces/special characters) and force a buffer refresh;
    - **Multi-Monitor Sychronization:** Automatically detects all active monitors and applies the new atmosphere simultaneously;
    - **Memory Purging:** Intelligent cleanup that unloads unused textures from the GPU to maintain a lean system state.

#### Dependencies (Ingredients)
- [hyprpaper](https://github.com/hyprwm/hyprpaper) - The wallpaper utility for Hyprland;
- [hyprctl](https://wiki.hypr.land/Configuring/Using-hyprctl/) - For IPC communication with the compositor;
- [zsh](https://www.zsh.org/) - The script leverages advanced Zsh array expansion.

#### Shell Integration
Add the following line to your ~/.zshrc or ~/.bashrc:

```bash
alias rdhypr='~/scripts/desktop-enhancements/random-wallpaper/random-wallpaper-hypr.sh'
```


### *[random-wallpaper-kde.sh](./desktop-enhancements/random-wallpaper/random-wallpaper-kde.sh)*
An intelligent script that injects a random visual atmosphere into your workspace. Works only on ***[KDE Plasma](https://kde.org/en/plasma-desktop/)***.

- **Features:**
    - Favors `fd-find` for speed, falls back to `find` for maximum compatibility;
    - **Multi-monitor support** via Plasma DBus API;
    - **XDG-compliant path handling**.
- **Logic:** It bridges the gap between static wallpaper settings and a truly generative desktop environment by directly manipulating the Plasma Shell configuration group.

#### Dependencies (Ingredients)
To transmute your desktop visuals, ensure these elements are present:
    - [dbus](https://gitlab.freedesktop.org/dbus/dbus/) - For communication with PlasmaShell;
    - [shuf](https://www.gnu.org/software/coreutils/) - Part of `coreutils`;
    - [fd](https://github.com/sharkdp/fd) or [find](https://www.gnu.org/software/findutils/) - For image indexing.

#### Shell Integration
Add the following line to your ~/.zshrc or ~/.bashrc:

```bash
alias rdkde='~/scripts/desktop-enhancements/random-wallpaper/random-wallpaper-kde.sh'
```


### *[random-wallpaper-swaybg.sh](./desktop-enhancements/random-wallpaper/random-wallpaper-swaybg.sh)*
A lightweight, resource-efficient manifestation of desktop aesthetics for wlroots-based compositors.

- **Features:**
    - **Minimalist Lifecycle:** Instantly replaces the background plane by terminating old instances and spawning a new `swaybg` process;
    - **Atomic Application:** Simple "fill" logic for immediate visual results without complex daemon management.

#### Dependencies (Ingredients)
- [swaybg](https://github.com/swaywm/swaybg) - The lightweight wallpaper renderer for Wayland;
- [fd](https://github.com/sharkdp/fd) or [find](https://www.gnu.org/software/findutils/) - For image indexing.

#### Shell Integration
Add the following line to your ~/.zshrc or ~/.bashrc:

```bash
alias rdsway='~/scripts/desktop-enhancements/random-wallpaper/random-wallpaper-swaybg.sh'
```


---


## *[utils](./utils/)*
A diverse compendium of general-purpose artifacts and tactical scripts, crafted to solve the myriad of small challenges that arise within the digital realm.


### *[utils/power-calc.sh](./utils/power-calc.sh)*
A high-precision analytical tool to measure and deconstruct the energy efficiency of your mobile workstation.

- **Features:**
    - **Precise Metrics:** Calculates energy loss (Wh), average power draw (W), and percentage-based depletion rates;
    - **Temporal Intelligence:** Automatically handles time calculations, including midnight crossing;
    - **Autonomy Projection:** Estimates remaining battery life based on the detected consumption profile;
    - **Localized Output:** Automatically formats results with European-standard commas and leading zeros for superior legibility.
- **Logic:** It uses raw data from `upower` to transmute "before and after" snapshots into a detailed report of your system's metabolic rate.

#### Dependencies (Ingredients)
- [upower](https://upower.freedesktop.org/) - To extract raw battery telemetry;
- [bc](https://www.gnu.org/software/bc/) - For high-precision floating-point arithmetic.

#### Shell Integration
Add the following line to your ~/.zshrc or ~/.bashrc:

```bash
alias power-calc='~/utils/power-calc.sh'
```
