# ArchLinux-alchemy
A personal vault of (*Arch*) *Linux* scripts and ricing procedures, transmuting your OS into a refined digital experience.

---

## 🧪 Scripts and dotfiles

> [!NOTE]
> While crafted on *Arch*, most of these scripts and configurations are designed to be universal and will work on any *Linux* distribution, provided the necessary dependencies are met.

### *[fzf-music](./scripts/audio/fzf-music/)*
A minimalistic TUI (Terminal User Interface) ecosystem for music management and shell optimization.

#### *[fzf-music.sh](./scripts/audio/fzf-music.sh)*
A lightweight script that leverages fuzzy searching for high-fidelity playback.
- **Features:**
  - Minimalistic approach to music, without frills or distractions
  - Instant metadata preview (*Artist*, *Title*, *Bitrate*, *Size*)
  - Multi-selection support
  - Low resource consumption (nearly 100-130 MB of RAM)
  - Otimized for Pipewire stability.
- **Logic:** Designed to provide a "distilled" music experience directly from the terminal, bypassing heavy GUI applications.

#### Dependencies
To transmute code into sound, the following "ingredients" must be present on your system:
- [fzf](https://github.com/junegunn/fzf) - The interactive fuzzy finder
- [fd](https://github.com/sharkdp/fd) - A simple, fast and user-friendly alternative to 'find'
- [mpv](https://mpv.io/) - The versatile media player used as the audio engine
- [ffmpeg](https://ffmpeg.org/) - Specifically `ffprobe`, used for deep metadata extraction
- [bc](https://www.gnu.org/software/bc/) - Used for precise bitrate and file size calculations.

#### *[shell-integration-appendix.sh](./scripts/audio/fzf-music/shell-integration-appendix.sh)*
A vital supplement to your shell configuration (`.bashrc` or `.zshrc`).
- **Purpose:** It bridges your terminal with the script by providing a global alias and optimizing the UI/performance of `fzf` and `fd` system-wide.

---

### *[random-wallpaper](./scripts/desktop-enhancements/random-wallpaper/)*
A sophisticated automation tool for dynamic desktop aesthetics. Only on ***[KDE Plasma](https://kde.org/en/plasma-desktop/)***.

#### *[random-wallpaper-kde.sh](./scripts/desktop-enhancements/random-wallpaper/random-wallpaper-kde.sh)*
An intelligent script that injects a random visual atmosphere into your workspace.
- **Features:**
  - Dual-engine logic: favors `fd-find` for speed, falls back to `find` for maximum compatibility
  - Multi-monitor support via Plasma DBus API
  - XDG-compliant path handling.
- **Logic:** It bridges the gap between static wallpaper settings and a truly generative desktop environment by directly manipulating the Plasma Shell configuration group.

#### Dependencies
To transmute your desktop visuals, ensure these elements are present:
- **Required:**
  - `dbus` - For communication with PlasmaShell
  - `shuf` - Part of `coreutils`
  - `find` - Part of `findutils`
- **Optional (Recommended):**
  - [fd](https://github.com/sharkdp/fd) - For significantly faster image indexing in large directories.

#### Shell Integration
To trigger a "visual transmutation" with a simple command, add the following alias to your `.bashrc` or `.zshrc`:

```bash
alias rdwp='~/random-wallpaper-kde.sh'
```
> [!NOTE]
> Ensure your desktop environment is *KDE Plasma*, and the path matches your script's location.

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

For the core `fzf` experience, follow the instructions inside `scripts/shell-integration-appendix` to update your shell configuration.

---

⚖️ License

This project is licensed under the GPL v3.0 License - protecting the freedom of the code for all users.

See the [LICENSE](./LICENSE) file for details.
