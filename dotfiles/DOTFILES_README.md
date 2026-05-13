# 🏺 Essence & Configurations (Dotfiles)
A collection of primordial configurations and dotfiles that define the behavior, aesthetics, and interaction logic of the digital environment.

> [!NOTE]
> While crafted on *Arch*, all of these configuration files are designed to be universal and will work on almost any *Linux* distribution, provided the necessary dependencies are met.

---

## Dotfiles for TUI APPLICATIONS


### *[alacritty](./dotfiles/.config/alacritty/alacritty.toml)*
This terminal configuration for [Alacritty](https://github.com/alacritty/alacritty) designed to act as the "scrying glass" for the system's inner workings, and handle multiple panes inside the terminal window.

- **Features:**
    - **Aesthetic Transparency:** Pre-configured with 30% opacity and compositor-ready blur for a seamless desktop blend;
    - **Native Multi-Pane Support:** Engineered to automatically spawn or attach to a `tmux` session, enabling advanced split-view layouts and multi-panel orchestration within a single window;
    - **Persistence Engine:** Your workspace survives terminal closures; re-opening Alacritty instantly restores your active "alchemy" session;
    - **Multi-State Palettes:** Includes 3 curated alchemical color schemes (Carbon Gray, Obsidian, Deep Black) to minimize eye-strain.
- **Logic:** This configuration transmutes a standard terminal into a persistent workstation. By forcing a `tmux` attachment, it bypasses the limitations of single-process windows, allowing for complex, grid-based multitasking.

#### Dependencies (Ingredients)
- [alacritty](https://github.com/alacritty/alacritty) - The core terminal emulator;
- [tmux](https://github.com/tmux/tmux) - For session persistence and window management;
- [JetBrainsMono Nerd Font](https://www.jetbrains.com/lp/mono/) - For correct glyph rendering.

#### Manual Installation
```bash
cp ./dotfiles/.config/alacritty/alacritty.toml ~/.config/alacritty/alacritty.toml
```



### *[cava](./dotfiles/.config/cava/config)*
A fine-tuned configuration for the [CAVA](https://github.com/karlstav/cava) audio visualizer, acting as the "visual heart" of the futuristic audio workstation.

- **Features:**
    - **Pipewire Synergy:** Native 32-bit / 48kHz stream interception for maximum spectral precision;
    - **Performance Optimized:** Locked at 60 FPS to match display refresh rates, minimizing CPU overhead while maintaining fluid motion;
    - **Reactive Aesthetics:** Uses the "Monstercat" smoothing algorithm with custom noise reduction (50%) for a balance of organic flow and technical accuracy;
    - **Pre-set Palettes:** Includes multiple alchemical themes (Cyber Neon, Plasma Burn, Sweet Ambar Blue, Tokyo Night) ready for instant transmutation.
- **Logic:** Configured with `noncurses` output to avoid terminal flickering and tearing during high-energy transients, especially when embedded in complex TMUX layouts.

#### Dependencies (Ingredients)
- [cava](https://github.com/karlstav/cava) - The Console-based Audio Visualizer;
- [pipewire](https://pipewire.org/) - For real-time audio data acquisition.

#### Manual Installation
```bash
cp ./dotfiles/.config/cava/config ~/.config/cava/config
```

> [!TIP]
> **Privacy Note**: CAVA might trigger the "Microphone in use" icon in your status bar.
> This is a false positive caused by the *desktop environment* detecting an active audio capture stream. When configured with `method = pipewire`, CAVA only monitors the internal output, not the physical microphone hardware.
> However, if you don't trust CAVA, you should disable microphone access at low-level (see [this dotfile](./dotfiles/shell/custom/.privacy-hardware-controls)) 



### *[.tmuxp/audio-session.yaml](./dotfiles/.tmuxp/audio-session.yaml)*
The architectural blueprint for the music listening workstation, utilizing a recursive split strategy to bypass standard window layouts.

- **Geometric Blueprint:**
    - **Master Navigator & Audio player (P1):** Occupies the Top-Left (55% width, 60% height), running `Yazi` for folders and files exploration; best with these [Yazi settings](./dotfiles/.config/yazi/yazi.toml);
    - **Fuzzy Music Seeker & Player (P2):** Anchored at the Bottom-Left (55% width, 40% height), running [fzf-music](./scripts/audio/fzf-music.sh) for direct and instant music selection;
    - **Vital Monitor (P3):** Top-Right pillar (45% width, 70% height) running `btop` for resource scrying;
    - **Visual Spectrum (P4):** Bottom-Right corner (45% width, 30% height) running `cava` for real-time frequency visualization; best with this [CAVA configuration](./dotfiles/.config/cava/config);
- **Logic:** Instead of relying on static grids, this configuration uses a master pane to "carve" the workspace and inject commands into specific coordinates, ensuring a consistent UI regardless of screen resolution.

#### *[.futuristic-audio-session (dotfile)](./dotfiles/shell/custom/.futuristic-audio-session)*
The "Grand Orchestrator" script that breathes life into the architectural blueprint. 

- **Features:**
    - **Session Sanitization:** Automatically detects and purges zombie or overlapping sessions before spawning a new environment to prevent PID collisions;
    - **Dynamic Storage Sensing:** Intelligently probes for external media (SD Cards) and dynamically re-routes the session's root directory, falling back to `$HOME` if no high-fidelity source is detected;
    - **Clean-Slate Invocation:** Launches a dedicated, maximized Alacritty instance with a scrubbed environment to ensure TMUXP loads without inheriting conflicting shell variables.
- **Logic:** It transmutes the static YAML configuration into a living, ephemeral workspace with a single command, handling both the creation and the "dissolution" of the audio environment.

#### Dependencies (Ingredients)
- [tmuxp](https://github.com/tmux-python/tmuxp) - The session orchestrator;
- [yazi](https://github.com/sxyazi/yazi) - The primary file interface (folders & files exploration);
- [fzf-music](./scripts/audio/fzf-music.sh) - The auxiliary music picker (direct & instant music selection);
- [btop](https://github.com/aristocratos/btop) - For system telemetry;
- [cava](https://github.com/karlstav/cava) - For the reactive audio visualizer;

#### Shell Integration
Add this line to your `.zshrc` or `.bashrc`:

```bash
[[ -f "$HOME/dotfiles/shell/custom/.futuristic-audio-session" ]]  &&  source "$HOME/dotfiles/shell/custom/.futuristic-audio-session"
```


### *[yazi](./dotfiles/.config/yazi/yazi.toml)*
A highly customized configuration for the [Yazi](https://github.com/sxyazi/yazi) terminal file manager, transmuted to act as a central hub for media and text.

- **Features:**
    - **Advanced TMUX Integration:** Spawns a dedicated audio viewport at the bottom of the terminal, allowing high-fidelity playback while keeping the file manager active;
    - **MIME-Smart Routing:** Automatically distinguishes between raw text, visual scrying, and compressed matter;
    - **Persistent Orphans:** GUI applications (like Ark or IMV) are launched as independent entities, surviving the closure of the parent terminal;
    - **Audiophile-Grade MPV:** Pre-configured with optimized Pipewire buffers and cache limits for glitch-free auditory experiences.

#### Dependencies (Ingredients)
To fully manifest these functionalities, ensure the following are installed:
- [yazi](https://github.com/sxyazi/yazi) - The terminal file manager;
- [tmux](https://github.com/tmux/tmux) - Required for the split-view audio player;
- [mpv](https://mpv.io/) - The core engine for high-fidelity audio rendering;
- [imv](https://github.com/eunomia/imv) - For lightweight, detached image viewing;
- [ark](https://apps.kde.org/ark/) - For GUI-based archive management;
- [micro](https://micro-editor.github.io/) - The default terminal scribe (editor).

#### Manual Installation
Place the file in your local configuration vault:
```bash
cp ./dotfiles/.config/yazi/yazi.toml ~/.config/yazi/yazi.toml
```


---



## *[CUSTOM dotfiles for the Shell](./dotfiles/shell/)*


### *[custom/.brightness-controls](./dotfiles/shell/custom/.brightness-controls)*
A low-level interface for precise display backlight manipulation without the need for heavy desktop environment plugins.

- **Features:**
    - **Raw Kernel Access:** Directly interacts with `/sys/class/backlight/` for near-instant response;
    - **Percentage-based Logic:** Transmutes raw hardware values into a human-readable 0-100% scale;
    - **Smart Inspection:** Aliases for quick monitoring of current, maximum, and percentage brightness levels.
- **Logic:** It bypasses high-level display managers to provide a "pure" CLI method for brightness control, especially useful for minimalist window managers (WMs) or troubleshooting ACPI issues.

#### Dependencies (Ingredients)
To manipulate the screen's luminosity, the following tools are required:
- [bc](https://www.gnu.org/software/bc/) - For high-precision mathematical calculations;
- [coreutils](https://www.gnu.org/software/coreutils/) - Provides `cat` and `tee` for system file interaction;
- [sed](https://www.gnu.org/software/sed/) - For stream editing and output formatting.

#### Shell Integration
To bridge your shell with the display hardware, add this line to your `.bashrc` or `.zshrc`:

```bash
[[ -f "$HOME/dotfiles/shell/custom/.brightness-controls" ]]  &&  source "$HOME/dotfiles/shell/custom/.brightness-controls"
```



### *[custom/.privacy-hardware-controls](./dotfiles/shell/custom/.privacy-hardware-controls)*
A fortified *TUI* (*Terminal User Interface*) barrier for hardware isolation and sensory scrying, providing absolute sovereignty over your visual and auditory gateways.

- **Features:**
  - **Kernel-Level Camera Shield:** Physically unloads the `uvcvideo` module, rendering the webcam non-existent to the entire OS and any potential intruding software;
  - **Digital Microphone Seal:** Directly mutes the hardware source at the PipeWire level via `wpctl`, ensuring zero audio leakage;
  - **Process Scrying:** An elegantly framed status report (Box-Drawing TUI) that performs a deep scan to identify active capture streams, unmasking processes (such as `cava`, browsers, or background daemons) currently accessing your hardware.
- **Aesthetics:** Engineered with ANSI color coding and Unicode symbols, designed to integrate seamlessly into high-fidelity terminal setups like *Alacritty* and *Zsh*.

#### Dependencies (Ingredients)
- [lsof](https://github.com/lsof-org/lsof) - For process-to-hardware mapping;
- [pipewire-pulse](https://pipewire.org/) / [wireplumber](https://gitlab.freedesktop.org/pipewire/wireplumber) - For audio source orchestration;
- [kmod](https://git.kernel.org/pub/scm/utils/kernel/kmod/kmod.git) - For `modprobe` camera manipulation (requires *sudo*).

#### Shell Integration
Add the following line to your `.zshrc` or `.bashrc`:
```bash
[[ -f "$HOME/dotfiles/shell/custom/.privacy-hardware-controls" ]]  &&  source "$HOME/dotfiles/shell/custom/.privacy-hardware-controls"
```



### *[fzf/.fzf-config](./dotfiles/shell/custom/fzf/.fzf-config)*
An appendix for [fzf-music](./scripts/audio/fzf-music/) and 'fuzzy file' in general.
- **Purpose:** It bridges your terminal with the script by providing a global alias and optimizing the UI/performance of `fzf` and `fd` system-wide.

### *[fzf/.fzf-config](./dotfiles/shell/custom/fzf/.fzf-config)*
The "Fuzzy Engine" core—a centralized configuration that transmutes standard terminal navigation into a high-speed, interactive experience.

- **Features:**
    - **Global UI Synthesis:** Implements a consistent "Reverse-Layout" with borders across all `fzf` instances, ensuring a clean and modern TUI aesthetic;
    - **High-Velocity Discovery:** Replaces the standard `find` backend with `fd`, enabling instant file indexing that intelligently respects `.gitignore` rules and follows symbolic links;
    - **Native Shell Infusion:** Injects advanced key-bindings directly into your shell session:
        - `CTRL+T`: Rapidly find and select files;
        - `CTRL+R`: Scry through your command history with fuzzy filtering;
        - `ALT+C`: Swiftly teleport (change directory) into a selected folder;
    - **Direct Gateway:** Provides the global `fzf-music` alias, bridging the gap between your shell and the audio workstation.
- **Logic:** This dotfile acts as a "Universal Translator" for search operations. Instead of redundant configurations, it exports global variables (`FZF_DEFAULT_OPTS`, `FZF_DEFAULT_COMMAND`) that empower every script and command-line tool relying on fuzzy logic to operate with maximum efficiency and visual harmony.

#### Dependencies (Ingredients)
- [fzf](https://github.com/junegunn/fzf) - The interactive fuzzy finder;
- [fd](https://github.com/sharkdp/fd) - A simple, fast, and user-friendly alternative to `find`;

#### Required by:
- [fzf-music.sh](./scripts/audio/fzf-music/fzf-music.sh) - A wrapper for *[fzf](https://github.com/junegunn/fzf)* and *[mpv](https://mpv.io/)*, for instant & lightweight music research and playing.

#### Shell Integration
To activate this search engine within your environment, add the following line to your `~/.zshrc` or `~/.bashrc`:

```bash
[[ -f "$HOME/dotfiles/shell/custom/fzf/.fzf-config" ]] && source "$HOME/dotfiles/shell/custom/fzf/.fzf-config"
```

