# ArchLinux-alchemy
A personal vault of (*Arch*) *Linux* scripts and ricing procedures, exploring the hidden, magic potential behind your *OS* and transmuting it into a refined digital experience.



---


## 🧪 Easy and powerful Scripts

See the [dedicated README (manifest) for 'scripts' subfolder](./scripts/SCRIPTS_README.md) for more informations.

---


## 🏺 Essence & Configurations (Dotfiles)
A collection of primordial configurations and dotfiles that define the behavior, aesthetics, and interaction logic of the digital environment.

See the [dedicated README (manifest) for 'dotfiles' subfolder](./dotfiles/DOTFILES_README.md) for more informations.

---


## 🛠️ Arch fixes
> *Section under construction.*

This area will soon include a collection of specific remedies and configurations to address common (*Arch*) *Linux* issues and system behaviors.

> [!NOTE]
> While these fixes are essential for an optimized *Arch Linux* experience on mobile hardware (like the *HP Victus* series), the logic is **distro-agnostic**. They will function on any *Linux* distribution that utilizes the standard `/sys/class/` kernel interface.

---


## 📜 Ricing & Procedures
Detailed Markdown guides, alchemical philosophies, and image galleries documenting custom interactive desktop configurations .


### Available Ecosystems:

#### * 🟪 **[The *A.E.T.H.E.R.* project  (*Hyprland* 0.55+)](./ricing/Hyprland/AETHER)** 
![AETHER Ricing showcase](./ricing/Hyprland/AETHER/screenshots/AETHER-logo-background-notifications-1.jpg)
A high-performance, ultra-lightweight dynamic tiling environment wrapped in a futuristic, cyber-neon, Synthwave aesthetic.
[Written in *Lua* for *Hyprland* 0.55+](https://hypr.land/news/26_lua/).  Fully optimized for hybrid-GPU architectures (Intel + NVIDIA).

#### * 🟦 ***KDE Plasma* Setup** — *Section under construction.* 
(Future blueprints will detail high-fidelity desktop look configurations).

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
