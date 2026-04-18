# ArchLinux-alchemy
A personal vault of (*Arch*) *Linux* scripts and ricing procedures, transmuting your OS into a refined digital experience.


---


## 🧪 Scripts and dotfiles

> [!NOTE]
> While crafted on *Arch*, most of these scripts and configurations are designed to be universal and will work on any *Linux* distribution, provided the necessary dependencies are met.

---

### *[audio/dl-tools](./scripts/audio/dl-tools)*
A precision toolset for distilling high-quality digital audio from the web aether.

> [!WARNING]
> **Legal Disclaimer**: 
> The tools contained within this directory are wrappers designed for **educational purposes** and **personal archival** of public domain, non-copyrighted, or Creative Commons licensed content.
> Use these scripts at your own risk and responsibility.
> The author does not condone or encourage the unauthorized downloading of copyrighted material and is not liable for any misuse of this software that violates the Terms of Service of any media provider or local jurisdiction laws.

#### *[ytdl-bestaudio.sh](./scripts/audio/dl-tools/ytdl-bestaudio.sh)*
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

#### 💡 Expert Usage & Troubleshooting
To ensure a successful fetching of web streams, follow these alchemical principles:

1.  **Keep the Engine Sharp** - Platforms like *YouTube* update their defenses daily. If a download fails, ensure your engine is up to date: `yt-dlp -update`;
2.  **The "Warm-up" Technique** - For videos protected by modern challenges (PO-Tokens), open the URL in your browser (e.g., *[LibreWolf](https://librewolf.net/)*) and let the media play for a few seconds. This "warms up" your IP and session, clearing the path for the script;
3.  **Quote the URL** - Always wrap the web link in double quotes when launching the script to prevent the shell from misinterpreting special characters like `&` or `?`.
    Example:  `ytdl-bestaudio "https://www.youtube.com/watch?v=..."`

---

### *[audio/fzf-music](./scripts/audio/fzf-music/)*
A minimalistic TUI (Terminal User Interface) ecosystem for music management and shell optimization.

#### *[fzf-music.sh](./scripts/audio/fzf-music.sh)*
A lightweight script that leverages fuzzy searching for high-fidelity playback.
- **Features:**
    - Minimalistic approach to music, without frills or distractions;
    - Instant metadata preview (*Artist*, *Title*, *File path*, *Bitrate*, *Size*);
    - Multi-selection support;
    - Low resource consumption (nearly 100-130 MB of RAM) while effortlessly managing Hi-Res audio;
    - Optimized for audio stability in Pipewire;
    - Adjust the audio settings (*audio server*, *sample rate*) in the script to suit your needs.
- **Logic:** Designed to provide a "distilled" music experience directly from the terminal, bypassing heavy GUI applications.

#### *[.fzf-config](./scripts/audio/fzf-music/.fzf-config)*
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
[[ -f "$HOME/scripts/audio/fzf-music/.fzf-config" ]]  &&  source "$HOME/scripts/audio/fzf-music/.fzf-config"
```

---

### *[desktop-enhancements/random-wallpaper](./scripts/desktop-enhancements/random-wallpaper/)*
A sophisticated automation tool for dynamic desktop aesthetics.

#### *[random-wallpaper-kde.sh](./scripts/desktop-enhancements/random-wallpaper/random-wallpaper-kde.sh)*
An intelligent script that injects a random visual atmosphere into your workspace.
Works only on ***[KDE Plasma](https://kde.org/en/plasma-desktop/)***.

- **Features:**
    - Dual-engine logic: favors `fd-find` for speed, falls back to `find` for maximum compatibility;
    - Multi-monitor support via Plasma DBus API;
    - XDG-compliant path handling.
- **Logic:** It bridges the gap between static wallpaper settings and a truly generative desktop environment by directly manipulating the Plasma Shell configuration group.

#### Dependencies (Ingredients)
To transmute your desktop visuals, ensure these elements are present:
- **Required:**
    - [dbus](https://gitlab.freedesktop.org/dbus/dbus/) - For communication with PlasmaShell;
    - [shuf](https://www.gnu.org/software/coreutils/) - Part of `coreutils`;
    - [find](https://www.gnu.org/software/findutils/) - Part of `findutils`.
- **Optional (Recommended):**
    - [fd](https://github.com/sharkdp/fd) - For significantly faster image indexing in large directories;

#### Shell Integration
To trigger a "visual metamorphosis" with a simple command, add the following alias to your `.bashrc` or `.zshrc`:

```bash
alias rdwp='~/desktop-enhancements/random-wallpaper/random-wallpaper-kde.sh'
```


---


## 📜 Ricing & Procedures
*Section under construction.*

This area will soon host detailed Markdown guides and image galleries documenting my specific Arch Linux setup, including terminal aesthetics and window manager configurations.


---


## 🛠️ Installation & Setup

### 1. Clone the Vault
To get all scripts, dotfiles, and procedures, clone the repository:

```bash
git clone https://github.com/IlNick03/ArchLinux-alchemy.git
cd ArchLinux-alchemy
```

### 2. Grant Execution Permissions
To ensure all current and future scripts are executable across all subdirectories,
run this command targeting all `.sh` files recursively and grants execution rights

```bash
find . -type f -name "*.sh" -exec chmod +x {} +
```

### 3. Integration
Each tool may have its own integration steps.
- For the core `fzf` experience, follow the instructions inside `shell-integration-appendix` to update your shell configuration.


---


## ⚖️ License

This project is licensed under the GPL v3.0 License - protecting the freedom of the code for all users.

See the [LICENSE](./LICENSE) file for details.
