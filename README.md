# Intro to Ricing

## Quick Start

If you just want to use these dotfiles without reading the tutorial:

```bash
cd ~
git clone https://github.com/Astordg/dotfile.git
cd dotfiles
stow .
```

Then log out and select Hyprland from your display manager. You'll need the packages listed in [Part 6](#part-6-installing-these-dotfiles).

For the full guide, read on.

---

## Showoff

Gif of wallpaper. Opening multiple terminals. Cava then Btop. Go into tmux session: dotfiles + portfolio + current project.
[Screenshots go here - add 2-3 images of your full setup]

This is an Arch + Hyprland rice with a Cyberpunk aethetic.
Components:
- Waybar
- Rofi
- wlogout

---

## Part 1: Before You Start

### Common Traps in Guides

**The `$` prefix**

When guides show terminal commands, they often put `$` at the beginning:

```bash
$ sudo pacman -S hyprland
```

The `$` is just a stand-in for your command prompt. Don't type it. Only type the part after:

```bash
sudo pacman -S hyprland
```

**Multi-line commands**

Some guides show multiple commands together. If you copy all of them at once and paste into your terminal, they may not work correctly. Copy and run commands one line at a time.

**Running commands you don't understand**

If you're unsure what a command does, ask an AI assistant to explain it before running. This is especially helpful for long commands that chain together.

**Getting frustrated**

Most of this setup is aesthetic. If customizing a tool is taking too long or frustrating you, remember: you can skip it. Use the tool with default settings, or find an alternative. The beauty of Linux is choice. If it stops being fun, remember why you started ricing.

### Prerequisites

**Recommended distributions:**
- Arch-based (Arch, EndeavourOS, Manjaro) - best for Hyprland support
- Fedora - good documentation
- Ubuntu/Debian - works but may need more manual setup

**Required:**
- Git installed
- A text editor (nano, vim, or any GUI editor)

**Time expectation:** Setting up a rice takes a weekend, not an afternoon. Take breaks.

---

## Part 2: Linux Fundamentals

### The Terminal

The terminal is how you'll install packages and configure tools. Don't be afraid of it. Many GUI tools run terminal commands under the hood anyway.

Basic commands you'll use:
- `cd foldername` - change directory (navigate to a folder)
- `ls` - list files in current directory
- `ls -a` - list all files including hidden ones
- `cat filename` - display file contents

### Package Managers

A package manager is your central app store. Instead of downloading installers from websites, you use one program to manage all your software.

**Installing packages:**

| Distro | Command |
|--------|---------|
| Ubuntu/Debian | `sudo apt install package-name` |
| Arch-based | `sudo pacman -S package-name` |
| Fedora | `sudo dnf install package-name` |

**Searching for packages:**

| Distro | Command |
|--------|---------|
| Ubuntu/Debian | `apt search package-name` |
| Arch-based | `pacman -Ss package-name` |
| Fedora | `dnf search package-name` |

**Removing packages:**

| Distro | Command |
|--------|---------|
| Ubuntu/Debian | `sudo apt remove package-name` |
| Arch-based | `sudo pacman -R package-name` |
| Fedora | `sudo dnf remove package-name` |

**Appimages**

Appimages are self-contained programs that work on any distro. Download them from the developer's website, then make them executable:

```bash
chmod u+x filename.AppImage
```

Then run them like any program.

### Dotfiles

Dotfiles are files and folders that start with a `.` (dot), making them hidden by default.

Examples: `.zshrc`, `.config/`, `.git/`

**Why hidden?** To keep regular users from accidentally breaking things. But as someone ricing your system, you'll need to access these.

**Viewing hidden files:**
- Terminal: `ls -a`
- File manager: Look for "Show Hidden Files" in settings or press `Ctrl+H`

**Where dotfiles live:**
- `~/.zshrc` or `~/.bashrc` - shell configuration
- `~/.config/` - most application configs go here in subfolders (e.g., `~/.config/hypr/`, `~/.config/waybar/`)

**Why put dotfiles in a git repo?**
- Sync across multiple computers
- Quick setup on a new machine
- Version control for your configurations

### PATH and Executables

**What is PATH?**

PATH is a list of folders your terminal searches when you type a command. If a program's folder is in PATH, you can run it from anywhere.

View your current PATH:
```bash
echo $PATH
```

**Adding to PATH:**

If you download a program manually (not through a package manager), you need to add its folder to PATH.

For Zsh, add to `~/.zshrc`:
```bash
export PATH=/path/to/program/folder:$PATH
```

For Bash, add to `~/.bashrc`:
```bash
export PATH=/path/to/program/folder:$PATH
```

Note: Add the *folder* containing the executable, not the executable file itself.

**Making files executable:**

Before running downloaded scripts or Appimages, make them executable:
```bash
chmod u+x filename
```

---

## Part 3: Choosing Your Tools

### Desktop Environment vs Tiling Window Manager

**Desktop Environment (DE)** - What you're used to from Windows/Mac:
- Task bar, app launcher, settings panels included
- Windows float and can be dragged/resized
- Works out of the box
- Limited customization

Examples: GNOME, KDE Plasma

**Tiling Window Manager (TWM)** - Keyboard-focused, minimal:
- Windows automatically arranged in a grid (non-overlapping)
- No built-in bar, launcher, or settings - you choose each component
- More setup work, but fine-grained control
- Highly customizable

Examples: Hyprland, Niri, Sway

**How to choose:**
- Want something that works immediately with decent customization? Use a DE
- Want maximum control and don't mind setup time? Use a TWM

### The Tool Stack

For a tiling window manager setup, you need multiple tools working together:

```
Tiling Window Manager (Hyprland)
    |
    |-- Bar (Waybar) ---------------- System info, workspaces, clock
    |
    |-- Launcher (Rofi) ------------- Open apps, run commands
    |
    |-- Lock Screen (Hyprlock) ------- Screen lock
    |
    |-- Wallpaper (Hyprpaper) ------- Background images
    |
    |-- Logout Menu (Wlogout) ------- Shutdown, reboot, logout
    |
    |-- Terminal (Ghostty) ---------- Where you run commands
            |
            |-- Shell (Zsh) --------- Command interpreter
            |       |
            |       |-- Prompt (Starship) --- Styled command prompt
            |
            |-- Multiplexer (Tmux) -- Optional: Save terminal sessions
```

### Tool Selection Guide

**Window Manager:**
- [Hyprland](https://wiki.hypr.land/) - Modern, great animations, active development (what I use)
- [Niri](https://github.com/niri-wm/niri) - Scroll-based tiling, simpler config
- [Sway](https://github.com/swaywm/sway) - i3-compatible for Wayland, stable

**Bar:**
- [Waybar](https://github.com/Alexays/Waybar) - Highly customizable, good docs (what I use)
- [Polybar](https://github.com/polybar/polybar) - More modules, X11-focused

**Launcher:**
- [Rofi](https://github.com/davatorium/rofi) - Flexible, can do calculator, window switcher (what I use)
- [Wofi](https://hg.sr.ht/~scoopta/wofi) - Simpler, GTK-based

**Terminal:**
- [Ghostty](https://ghostty.org/) - Fast, modern features (what I use)
- [Alacritty](https://github.com/alacritty/alacritty) - GPU-accelerated, popular
- [Kitty](https://github.com/kovidgoyal/kitty) - Feature-rich, image support

**Shell:**
- [Zsh](https://www.zsh.org/) - Better autocomplete, plugins (what I use)
- [Bash](https://www.gnu.org/software/bash/) - Default on most systems
- [Fish](https://fishshell.com/) - User-friendly, great autosuggestions

---

## Part 4: CSS Basics for Ricing

Several tools use CSS for styling: Waybar, Wlogout, and others. If you haven't used CSS, here's what you need to know.

### Selectors

CSS selectors target elements to style them:

```css
* { }                    /* Universal - applies to everything */
window { }               /* Element - targets <window> tags */
#workspaces { }          /* ID - targets element with id="workspaces" */
.button { }              /* Class - targets elements with class="button" */
button:hover { }         /* Pseudo-class - targets button on hover */
```

### The Box Model

Every element is a box with layers:

```
+---------------------------------+  <- margin (space outside)
|  +---------------------------+  |
|  |        border             |  |  <- border (edge)
|  |  +---------------------+  |  |
|  |  |     padding         |  |  |  <- padding (space inside)
|  |  |  +---------------+  |  |  |
|  |  |  |   content     |  |  |  |
|  |  |  +---------------+  |  |  |
|  |  +---------------------+  |  |
|  +---------------------------+  |
+---------------------------------+
```

Common properties:
```css
margin: 10px;              /* Space outside the border */
padding: 5px 10px;         /* Space inside the border (vertical horizontal) */
border: 2px solid #D90202; /* Width, style, color */
border-radius: 20px;       /* Rounded corners */
```

### Colors

Two common formats:

```css
color: #D90202;                    /* Hex - 6 characters for RGB */
background: rgba(217, 2, 1, 0.5);   /* RGBA - red, green, blue, alpha (transparency) */
```

Use [htmlcolorcodes.com](https://htmlcolorcodes.com/color-picker/) to pick colors.

### Example from My Waybar

```css
#workspaces {
    color: #33d4c4;              /* Text color - cyan */
    margin: 10px 10px;           /* Space around the workspaces block */
    border-radius: 20px;         /* Rounded corners */
    border: 2px solid #D90202;   /* Red border */
    background-color: #362921;   /* Rust orange background */
}

#workspaces button {
    margin: 2px 2px;             /* Space between workspace buttons */
    padding: 2px 15px;           /* Space inside each button */
    background-color: #000000;   /* Black button background */
    border-radius: 40px;         /* Fully rounded buttons */
}

#workspaces button.active {
    color: #D90202;              /* Active workspace text is red */
}
```

---

## Part 5: Setting Up Each Tool

### Zsh

**What it does:** Your shell - interprets commands you type in the terminal.

**Install:**
```bash
sudo apt install zsh      # Ubuntu/Debian
sudo pacman -S zsh        # Arch
sudo dnf install zsh      # Fedora
```

**Config location:** `~/.zshrc`

**Key concepts:**
- Zsh has better autocomplete and syntax highlighting than Bash
- Plugins add functionality (syntax highlighting, autosuggestions)
- Set Zsh as default: `chsh -s $(which zsh)`

**My config highlights:**
- PATH configuration on lines 12-15
- Plugin configuration for syntax highlighting and autosuggestions

**Docs:** [Zsh Wiki](https://www.zsh.org/)

---

### Starship

**What it does:** Makes your command prompt look good and show useful info (git status, current directory, language version).

**Install:**
```bash
sudo apt install starship      # Ubuntu/Debian
sudo pacman -S starship        # Arch
sudo dnf install starship      # Fedora
```

**Config location:** `~/.config/starship.toml`

**Key concepts:**
- The `format` section at the top defines the order of elements
- Each module (directory, git_branch, etc.) can be configured separately
- Colors are defined per-section

**My config highlights:**
- Based on Catppuccin theme
- Custom color scheme matching my rice

**Docs:** [Starship Wiki](https://starship.rs/)

---

### Hyprland

**What it does:** The window manager - handles window placement, animations, keybinds, and monitors.

**Install:**
```bash
sudo pacman -S hyprland        # Arch
sudo dnf install hyprland      # Fedora
```

**Config location:** `~/.config/hypr/hyprland.conf`

**Key concepts:**
- Configuration is grouped by categories: `category { variables }`
- Keybinds follow the pattern: `bind = modifier, key, action`
- Workspaces are virtual desktops you switch between

**My config highlights:**
- Custom animations for window open/close
- Keybinds for launching apps and managing windows
- Monitor configuration

**Docs:** [Hyprland Wiki](https://wiki.hypr.land/)

---

### Waybar

**What it does:** The status bar - shows workspaces, system info, clock, media controls.

**Install:**
```bash
sudo apt install waybar        # Ubuntu/Debian
sudo pacman -S waybar          # Arch
sudo dnf install waybar        # Fedora
```

**Config location:** `~/.config/waybar/`
- `config.jsonc` - functionality (what modules, where they appear)
- `style.css` - appearance (colors, spacing, fonts)

**Key concepts:**
- Modules are defined in config.jsonc with their position (left, center, right)
- Custom modules can run scripts (see my GPU usage module)
- Styling uses CSS selectors based on module IDs

**My config highlights:**
- Custom GPU usage module that runs a script
- Grouped modules (hardware, media) for consistent styling
- Color scheme in style.css matching my rice

**Docs:** [Waybar Wiki](https://github.com/Alexays/Waybar/wiki)

---

### Rofi

**What it does:** Application launcher - opens apps, runs commands, can act as a calculator.

**Install:**
```bash
sudo apt install rofi          # Ubuntu/Debian
sudo pacman -S rofi            # Arch
sudo dnf install rofi          # Fedora
```

**Config location:** `~/.config/rofi/`

**Key concepts:**
- Can be invoked in different modes: drun (apps), run (commands), calc (calculator)
- Themes control appearance
- Launch from Hyprland with a keybind

**My config highlights:**
- Custom theme matching my color palette
- Configured as calculator and app launcher

**Docs:** [Rofi GitHub](https://github.com/davatorium/rofi)

---

### Ghostty

**What it does:** Terminal emulator - where you run commands.

**Install:** See [Ghostty Docs](https://ghostty.org/) for installation methods

**Config location:** `~/.config/ghostty/config`

**Key concepts:**
- Simple key-value configuration format
- Themes change text colors for commands
- Font settings for readability

**My config highlights:**
- Kibble theme matching my rice colors
- Custom keybinds
- Cursor animation using a GLSL shader

**Docs:** [Ghostty Documentation](https://ghostty.org/)

---

### Hyprlock

**What it does:** Lock screen - secures your system when you step away.

**Install:**
```bash
sudo pacman -S hyprlock        # Arch
```

**Config location:** `~/.config/hypr/hyprlock.conf`

**Key concepts:**
- Uses same category-based config style as Hyprland
- Can display time, date, user image, input field

**My config highlights:**
- Minimal design with just time and date
- Colors matching my rice

**Docs:** [Hyprlock Wiki](https://wiki.hypr.land/Hypr-Ecosystem/hyprlock/)

---

### Hyprpaper

**What it does:** Wallpaper manager - sets backgrounds for your monitors.

**Install:**
```bash
sudo pacman -S hyprpaper       # Arch
```

**Config location:** `~/.config/hypr/hyprpaper.conf`

**Key concepts:**
- Preload wallpapers before using them
- Set different wallpapers per monitor

**My config highlights:**
- Same wallpaper on both monitors
- Wallpaper stored in my wallpapers folder

**Docs:** [Hyprpaper Wiki](https://wiki.hypr.land/Hypr-Ecosystem/hyprpaper/)

---

### Wlogout

**What it does:** Logout menu - buttons for shutdown, reboot, suspend, etc.

**Install:**
```bash
sudo apt install wlogout       # Ubuntu/Debian
sudo pacman -S wlogout         # Arch
sudo dnf install wlogout       # Fedora
```

**Config location:** `~/.config/wlogout/`
- `layout` - button order and labels
- `style.css` - appearance and icons

**Key concepts:**
- Each button runs a command (systemctl poweroff, etc.)
- Icons are set via CSS background-image

**My config highlights:**
- Custom icons for each action
- Colors matching my rice

**Docs:** [Wlogout GitHub](https://github.com/ArtsyMacaw/wlogout)

---

### Neovim

**What it does:** Text editor - for code, config files, notes.

**Install:**
```bash
sudo apt install neovim        # Ubuntu/Debian
sudo pacman -S neovim          # Arch
sudo dnf install neovim        # Fedora
```

**Config location:** `~/.config/nvim/`

**Key concepts:**
- Neovim requires significant setup to be a full IDE
- Plugins add functionality (LSP, completion, colorschemes)
- Lua is the configuration language

**My config highlights:**
- Catppuccin colorscheme with custom color overrides
- LSP setup for code completion
- See my nvim/README.md for more details

**Recommended starting point:** [kickstart.nvim](https://github.com/nvim-lua/kickstart.nvim) - excellent tutorial and base config by a Neovim maintainer

**Docs:** [Neovim](https://neovim.io/)

---

### Tmux

**What it does:** Terminal multiplexer - save terminal sessions, split panes, organize projects.

**Install:**
```bash
sudo apt install tmux          # Ubuntu/Debian
sudo pacman -S tmux            # Arch
sudo dnf install tmux          # Fedora
```

**Config location:** `~/.config/tmux/tmux.conf`

**Key concepts:**
- Sessions are saved terminal states
- Windows are tabs within a session
- Panes are splits within a window

**My config highlights:**
- Tmux Resurrect plugin to save/restore sessions after reboot
- Custom keybinds for navigation

**Docs:** [Tmux Wiki](https://github.com/tmux/tmux/wiki) | [Cheat Sheet](https://tmuxcheatsheet.com/)

---

### Cava

**What it does:** Audio visualizer - displays sound as animated bars in the terminal.

**Install:**
```bash
sudo apt install cava          # Ubuntu/Debian
sudo pacman -S cava            # Arch
sudo dnf install cava          # Fedora
```

**Config location:** `~/.config/cava/config`

**Key concepts:**
- Purely aesthetic
- Customize bar width, height, colors, gradient

**My config highlights:**
- Gradient colors for bars
- Integrated into Waybar as a custom module

**Docs:** [Cava GitHub](https://github.com/karlstav/cava)

---

## Part 6: Installing These Dotfiles

### Requirements

Install these packages before using these dotfiles:

```bash
sudo pacman -S git stow zsh starship hyprland waybar rofi hyprlock hyprpaper wlogout neovim tmux cava
```

For Ubuntu/Debian:
```bash
sudo apt install git stow zsh starship waybar rofi wlogout neovim tmux cava
```

For Fedora:
```bash
sudo dnf install git stow zsh starship hyprland waybar rofi hyprlock hyprpaper wlogout neovim tmux cava
```

**Fonts:** Install a Nerd Font for icons to display correctly:
- [MonoidNerdFont](https://github.com/ryanoasis/nerd-fonts/releases/download/v3.4.0/Monoid.zip)
- [JetBrainsMono](https://github.com/ryanoasis/nerd-fonts/releases/download/v3.4.0/JetBrainsMono.zip)

### Step-by-Step Installation

1. Clone the repository:
```bash
cd ~
git clone https://github.com/Astordg/dotfile.git
cd dotfiles
```

2. Create symlinks with GNU Stow:
```bash
stow .
```

This creates symlinks from the dotfiles repo to where your system expects them. Your configs now exist in two connected places:
- `~/dotfiles/.config/waybar/` <-> `~/.config/waybar/`
- `~/dotfiles/.zshrc` <-> `~/.zshrc`

3. Log out and select Hyprland from your display manager.

### Customizing

**Change colors:**
- Edit colors in `style.css` files (Waybar, Wlogout)
- Update `starship.toml` for prompt colors
- See [Logistics.md](Logistics.md) for my color palette

**Add your wallpaper:**
- Place wallpapers in the `wallpapers/` folder
- Update `hyprpaper.conf` with the new filename

**Make it your own:**
- Modify keybinds in `hyprland.conf`
- Add/remove Waybar modules in `waybar/config.jsonc`
- Change fonts in any config

---

## Part 7: Troubleshooting & Resources

### Common Issues

**"Config changes aren't applying"**
- Some tools need a reload: press your Hyprland reload keybind or restart the tool
- Check for syntax errors (missing brackets, typos)
- Verify you're editing the correct file location

**"Fonts look like boxes with numbers"**
- You need a Nerd Font installed
- Set the font in your terminal and bar configs
- See [Nerd Fonts](https://www.nerdfonts.com/)

**"I don't know what's customizable"**
- Use [Deepwiki](https://deepwiki.com/) to ask questions about specific tools
- Browse r/unixporn dotfiles to see how others configured tools
- Read the default config files (usually have helpful comments)

**"Documentation is confusing"**
- Check GitHub issues for the tool - others may have asked the same question
- Look at example configs from r/unixporn
- Ask an AI to explain specific config options

### Resources

**Inspiration:**
- [r/unixporn](https://www.reddit.com/r/unixporn/) - Desktop screenshots and dotfiles

**Documentation Help:**
- [Deepwiki](https://deepwiki.com/) - AI-powered documentation search

**Fonts & Icons:**
- [Nerd Fonts](https://www.nerdfonts.com/) - Fonts with programming icons

**Colors:**
- [HTML Color Codes](https://htmlcolorcodes.com/color-picker/) - Pick and convert colors

**My Color Palette:**
- See [Logistics.md](Logistics.md) for all colors used in this rice

---

## Credits

Tools used in this rice - linked in [Logistics.md](Logistics.md)
