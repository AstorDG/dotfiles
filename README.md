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

When I want to explain things more in depth I should make a note section.
---

## Showoff

Gif of wallpaper. Opening multiple terminals. Cava then Btop. Play music to make cava start. Show off windows moving around and resizing. This'll also show off the cava in the waybar. Go into tmux session: dotfiles + portfolio + current project. Open neovim into dotfiles folder. Do some code change. Open neotree and create another tab. Then go out of neovim  and switch around project to show languages on my starship promt. This'll also show the git part and file chaning part of the promt. Then use rofi to launch Dolphin and Steam. Also show off calc functionality. Show wlogout and hyprlock.
Screen shot of waybar plus wallpaper, screen shot of neovim + tmux setup, screen shot of Rofi. Screen shot of terminal promt. Screen shot of wlogout. Screen shot of hyprlock. Screen shot of btop plus cava.
[Screenshots go here - add 2-3 images of your full setup]

This is an Arch + Hyprland rice with a Cyberpunk aethetic. It is meant for my programming workflow


Components:
- Waybar
- Rofi
- wlogout
- hyprlock

---

## Part 1: Before You Start

### Common Traps in Guides


**The `$` prefix**

When guides show terminal commands, they often put `$` at the beginning:

```bash
$ sudo pacman -S hyprland
```

The `$` is just a stand-in for your command prompt. Don't type it. Only type or copy the part after:

```bash
sudo pacman -S hyprland
```

**Command Structure**

*Sudo* is the super user prefix. You will need to put in your password when running commands with sudo.
*pacman* is the program that is being run. The first argumnet in bash commands in the program to run.
*-S hyprland* are the arguments to the program being run. The text afterward are arguments or parameters being given to that program to change its behavior. 

**Multi-line commands**

Because of the way markdown renders bash on the web there's a little button to copy commands in the top right corner of bash. Don't copy and then paste commands using this button or copy all of the commands at once. They may not work correctly. Copy and run commands one line at a time.

**Running commands you don't understand**

If you're unsure what a command does, ask an AI assistant to explain it before running. This is especially helpful for long commands that chain together. Also look up the command in google and see if there's any red flags or helpful explinations that come up.


**Getting frustrated**

Most of this setup is aesthetic. If customizing a tool is taking too long or frustrating you, remember: you can skip it. Use the tool with default settings, find an alternative, or just take a break and come back to it later. The beauty of Linux is choice. If it stops being fun, remember why you started ricing.

### Prerequisites

**Recommended distributions:**
- Arch-based (Arch, EndeavourOS, Manjaro) - best for Hyprland support
- Fedora - good documentation and good defaults. Linus Torvalds uses this distro. Just sayin.
- Mint, Zorin OS, Pop!_Os, Bazzite. Very beginner friendly.
- Ubuntu/Debian - Old and reliable. Works but may need more manual setup

**Required:**
- Git installed
- A text editor (nano, vim, or any GUI editor such as vscode or gedit)

**Time expectation:** Setting up my full rice took me about a week. This can very a lot though based on if you're going from scratch or if you're using someone else's setup and just making some tweaks. Make sure to take breaks.

---

## Part 2: Linux Fundamentals

### The Terminal

The terminal is very powerful and can be how you install packages and configure tools, and have a full workflow. Don't be afraid of it. However you don't have to use the terminal. There are many good GUI tools on linux now. You should know that many GUI tools run terminal commands under the hood so it is good to be familiar with them.

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

You will have to be in the same folder that the Appimage was downloaded from for this command to work. Additionally if you're using a GUI based file browser you can navigate to the folder where the Appimage is and right click on it. There will be an option in a properties / permissions tab to run the file as an executable. You may have to put in your password to do this.
Then run them like any program.

### Dotfiles

Dotfiles are files and folders that start with a `.` (dot), making them hidden by default.

Examples: `.zshrc`, `.config/`, `.git/`

**Why hidden?** Most people don't access these files and modifying them can break a system so it keeps them from accidentally breaking things. As someone ricing your system, you'll need to access these. I find this annoying as someone who does need access to them. But you can usually set these files to not hidden by default in your GUI file explorer.

**Viewing hidden files:**
- Terminal: `ls -a`
- File manager: Look for "Show Hidden Files" in settings or press `Ctrl+H`

**Where dotfiles live:**
- `~/.zshrc` or `~/.bashrc` - shell configuration
- `~/.config/` - most application configs go here in subfolders (e.g., `~/.config/hypr/`, `~/.config/waybar/`)

**Why put dotfiles in a git repo?**
- To sync them across computers
- Quick setup on a new machine
- Version control for your configurations

### The PATH and Executables

**What is the PATH?**

The PATH is a list of folders your terminal searches when you type a command. If a program's folder is in PATH, you can run it from anywhere. In a terminal you're in a certain file folder when you run commands. I wanna explain to people that they have a lotcation in the terminal and the path allows access from any location.

View your current PATH:
```bash
echo $PATH
```

**Adding folders to your PATH:**

If you download a program manually (not through a package manager), you need to add its folder to PATH if you want to run it from any location.

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
- More setup work, but more fine-grained control
- Highly customizable

Examples: Hyprland, Niri, Sway

**How to choose:**
- Want something that works immediately with decent customization? Use a DE
- Want maximum aesthetic and functional control and don't mind setup time? Use a TWM

!Note:
- You can sometimes have a window manager and a de. I started on linux mint and you can install i3 on mint and log into it as a seperate enviornment. This allows you to start with a DE and then test out a WM on the side if you're curious but not ready to jump right in. Or you don't have the down time to not be productive setting up your window manager.

**How I chose:**
- I chose a tiling window manager because I could make it prettier and because I really like the tiling window setup for productivity. Explain why I chose a tiling window manager and Hyprland
- I chose Hyprland because it looks nice and a lot of people use it so there are a lot of guides and example configs to look at.

### The Tool Stack

For a tiling window manager setup, you need multiple tools working together.

This is a diagram of my setup:

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
    |-- Terminal (Ghostty) ---------- Where I run commands and program
            |
            |-- Shell (Zsh) --------- Command interpreter
            |       |
            |       |-- Prompt (Starship) --- Styled command prompt
            |
            |-- Multiplexer (Tmux) -- Optional: Save terminal sessions
```

### Tool Selection Guide

**Window Manager:**
- [Hyprland](https://wiki.hypr.land/) - Modern, great animations, active development, popular (what I use)
- [Niri](https://github.com/niri-wm/niri) - Scroll-based tiling, simpler config
- [Sway](https://github.com/swaywm/sway) - i3-compatible for Wayland, stable
- [i3](https://i3wm.org/) - an x11 compatiable window manager.
- I would recommend looking at some videos of people using these window managers to see what features they have to decide what you like and value for your workflow or aethetics.
- List of window manager link

**Wallpaper engine + Lockscreen:**
- These choices will mostly come from which window manager you use. Hyprland has an ecosystem so I use the hyprland wallpaper and locksreen engine.
- Niri doesn't have this so you can choose. You may be able to use hyprpaper for niri or some other wallpaper engines such as waypaper or swww.
- These tools are pretty lightweight and all sort of do the samething so just pick one that works.

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
- [Zsh](https://www.zsh.org/) - Good plugin ecosystem, similar to Bash (what I use)
- [Bash](https://www.gnu.org/software/bash/) - Default on most systems
- [Fish](https://fishshell.com/) - User-friendly, great autosuggestions, needs more setup and is more to learn if you're coming from bash or ZSH.

!Note:
- [quickshell](https://quickshell.org/) is an all in one tool that can act as a bar + launcher + lockscreen + wallpaper + widget thing.
- The setup for this is way more complicated than the other tools I mentioned so this is more for programmers or people who want to tinker a lot and have more power and customization.

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


!Note:
This was a bit tricky for me to figure out at first but through setting it up I got the hang of it. I did waybar first and then the other CSS was easy. Such as for wlogout, and rofi. 
I would suggest doing the CSS for the simpler tools first to get a hang of the flow and what changes what. Reload often so see how small changes effect the look of what you're customizing.

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
- PATH configuration on lines 12-15.
```path=($path ~/.zig/)```
- This is the better way to add folders to your path. You can just list them out inside of the parenthesis. Make sure they're each on a new line.
- Plugin configuration for syntax highlighting and autosuggestions
- You need to install plugins using your package manager and then point to them in the ~/.zshrc.
- In mine you'll see I have them in /opt/homebrew/share/ . This is because I share my .zshrc between my desktop and my mac and this is where homebrew installs these plugins. 
- I made these folders on my linux system and then symlinked them to their actual locations. I explain more about symlinks in the [installation] section which talks about gnu stow
- Command history on lines 20-25. This holds my command history which can be useful when I can't remember exact commands.

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
- You can find a list of built in modules in the configuration section of the wiki. 
- Colors are defined per-section
- The modules are placed in the order you want them to appear in the format section.
- Under the format section you cusomize each module. Where the name is surrounded by []. Ex: [os]
- Then the options for that modules are placed directly under the module name.
- You can also create custom modules and add them to the format section. I do this for HTML and CSS directories so you can find an example in my starship.toml

**My config highlights:**
- Based on Catppuccin theme provided in the starship examples.
- Custom color scheme matching my rice
- You need to init starship in your shell file I have 
```eval "$(starship init zsh)"``` as the first line of my .zshrc

**Docs:** [Starship Wiki](https://starship.rs/)

---

### Hyprland

**What it does:** The window manager - handles window placement, workspaces, animations, keybinds, and monitors.

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
- Animations for window open/close. I just use the default ones.
- Keybinds for launching apps and managing windows
- There are some programs you want to launch at start up like your wallpaper engine and bar. I have this set up on lines 27-32. The arguments to exec-once are the same commands you would put in the terminal.
- Monitor configuration
- My config is pretty well commented so it should be farily straightforword to reason about. 
- The wiki has a list of all of the variables you can modify for each category.
- Hyprland automaticlly reloads on save so you can see your changes right away.

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
- A list of built in modules can be found on the wiki
- Custom modules are named as custom/yourcustomname
- Custom modules can run scripts, or terminal commands, with the ```exec": ``` field (see my GPU usage module)
- Or if you want to create a button use the ```"on-click":``` field. These buttons also take terminal commands as arguments. You can look at my custom/power module for an example.
- You can group modules together with the ```group``` tag. This is useful to group modules together for CSS styling. There's examples at the bottom of my config.jsonc
- Styling uses CSS selectors based on module IDs
- When styling custom modules with css they're named as ```custom-yourCustomName``` There's a - instead of a / like there is in the config.jsonc.

**My config highlights:**
- Custom GPU usage and cava module that run scripts
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
- It uses CSS formatting to change the appearence of elements but this doesn't have to be in a seperate file. It can go in the confis.rasi.

**My config highlights:**
- Custom theme matching my color palette
- Configured as calculator and Appimage launcher

!Note
- This one was a bit tricky to configure for me as it has some quirks and the wiki is quite confusing for a beginner.
- The CSS elements you see me customize aren't on the wiki. You can find them by running rofi -h. However this just gives a big text dump and isn't super readable.
- I have a comment in my config.rasi that suggests running rofi 
```bash
man rofi-theme
```

- Then search for layout by typing / ,which enters search mode, and then layout. This will show a diagram of the layout with the names of different elements. These are what's being CSS styled.
- Keybinds are put in the configiureation {} section. 
- They start with ```kb-``` You can get a list of these by running rofi -h. I know I said this isn't very helpful but there's a list of keybinds at the bottom that aren't too hard to read.

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
- Cursor animation using a GLSL shader. This one is a little complicated. GLSL shaders are kinda hard to read. If you like mine I would just suggest sticking to it or just playing around with the colors. 
- There's some example shaders. Find the links and put them here
- Or if you want something super novel you could ask Mr. GPT or your favorite ai helper to make you one. I haven't tried this so I'm not sure how well this will come out.

!Note
- The docs are really good that why I spent less time explaining the setup compared to some other tools.

**Docs:** [Ghostty Documentation](https://ghostty.org/)

---

### Hyprlock

**What it does:** Lock screen - secures your system when you step away.

**Install:**
```bash
sudo pacman -S hyprlock        # Arch
```


Add a fedora installation 

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

add fedora install

**Config location:** `~/.config/hypr/hyprpaper.conf`

**Key concepts:**
- Preload wallpapers before using them
- Can set different wallpapers per monitor
- The same monitor naming scheme as hyprland

**My config highlights:**
- Same wallpaper on both monitors
- Wallpapers stored in my wallpapers folder

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
- Added a sleep command before running suspend because running hyprlock and suspend at the same time caused a deadlock wher it couldn't finish running hyprlock but then couldn't wake up.

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
- This is a much better tutorial than I could ever provide here. [Typecraft tutorial](https://www.youtube.com/watch?v=zHTeCSVAFNY&list=PLsz00TDipIffreIaUNk64KxTIkQaGguqn) is also a really good starter resource.

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
- [Tmux Resurrect plugin](https://github.com/tmux-plugins/tmux-resurrect) to save/restore sessions after reboot. [Video guide](https://www.youtube.com/watch?v=sMbuGf2g7gc&t=278s)
- My tmux bar looks very similar to the cattpuccin plugin bar but it doesn't use it. I just wrote the bar from scratch using this [Tonybtw](https://www.youtube.com/watch?v=XivdyrFCV4M&t=280s) video.
- Custom keybinds for navigation

!Note 
- This is mostly a programmer tool but can be used for regular terminal navigation if you use the terminal a lot for work or want to have complex terminal states.

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
- The default config files comes very well commented. I tried to leave them all in so my config explains most of the options.

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

- You can edit the files in both places so don't worry about having to only edit them in the ~/dotfiles/ folder.

3. Log out and select Hyprland from your display manager.

- If you're on arch this means running ```start-hyprland```

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
