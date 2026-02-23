# Intro to Ricing
If you don't care about the tutorial go here. [Installation](#Installation)

## Intro
What is ricing? Ricing is the process of customizing your linux environment. It's both aesthetic and functional but mostly aesthetic.
Why is it called ricing? It came from asian car owners adding mostly aesthetic mods to their cars and then the term was adopted in the computer space.
I'm writing this as the introduction to ricing and some common Linux tools that I would have wanted when I started on my Linux journey.
This is not meant to be a complete guide for all of the tools that I reference. It is meant to explain basic concepts that were confusing for me as a beginner and show you where to look when you get confused, because you will.

## Disclaimers
One of things that some guides will do that's very confusing is when they instruct you to run terminal commands they'll put '$' at the beginning of the command. The $ is just a stand in for the text in your terminal that preceeds the commands you type in. Also known as the command prompt. When running commands from a guide remember to exclude this $ part from the command when you're copy and pasting or typing out the command.
Another thing to be wary of is multi line commands. Sometimes guides will just have a bunch of commands one after the other and whatever copy button they have will copy all of the lines onto your clip board which will paste them all into your terminal. If you try and run commands this way they will not work.
Run these commands one at a time, for the most part. Copy these commands one line at a time.
Finaly disclaimers is to remember that most of this setup is purely aesthetic. If you find yourself getting frustrated trying to customize some tool. or you feel like it's taking too long to set up, remember you can always just not use it. Or you can use it in it's uncustomized state. The beauty of linux is that it's your system and you can install and configure it however you want. Find a tool with the same or similar functionality that has better defaults or better configuration options. If it stops being fun just remember why you're ricing.
With that being said let's get into some of the base level knowledge that you'll need to know before deciding how to rice your system.

### The *Terminal*
The terminal a topic that could and probably has had multiple books written about it. I'm really only putting this section here to tell you not to be afraid of it.
It's the main way to install packages, also known as programs, with your package manager although some distros have a graphical program that you can use to install packages. They are really using terminal commands under the hood though.
Which is also true of a lot of the tools in this rice. Many of these tools have ways to run terminal commands and then display the output in ways unique to that tool.
This was very confusing for me at first when looking at other people's dotfiles so I will point out these occasions. 
It's very powerful and I would encourage you to become comfortable with it as it will help you a lot on your linux journey. But it is possible to not have to use the terminal at all.
If you're just here for the pretty looks you can copy and paste my dotfiles and never look at them again.
Throughout this guide I will talk about running commands and sometimes give you specific commands to run. These are safe but I would encourage you to use caution when running terminal commands and try and sort of understand what they're doing. Asking Mr. Chat GPT or your prefered ai assistant what a command does before running it is usually very helpful for breaking down commands. Especially long ones that chain into each other.
With all of the disclaimers out of the way lets talk about how you even install these tools.

## Package Managers
One of the biggest changes when coming from Windows or MacOS is how programs/applications, or packages as we call them in the linux world, are installed.
**All apps are packages but not all packages are apps**
The main paradigm for installing applications on those operating stystems is going to a website or an app store and downloading the app or app installer. Then the app appears in your program launcher, your task bar or your applications foloder.
While you can install packages this way on linux, the preferred way is to use a package manager.
A package manager is a central program that handles downloading software onto your computer. Hence the name package manager. It manages the packages or software on your computer. You use a package manager basically like an app store. It can be accessed through the terminal but most distros have a graphical application that can also interact with the package manager so if you don't want to use the terminal you don't have to.
There are some subtle differences between app stores and package managers but they serve the same purpose of getting software onto your computer.
Different linux distributions, or distros for short, will have different package managers. Examples include apt for Ubuntu, pacman for Arch linux or DNF for Fedora.
I would strongly suggest you to get familiar with your linux distribution's package manager as they can be confusing at first and take some time to learn.
### Installing and uninstalling programs
One of the things that's annoying when using a package manager is finding the exact name of a program or app you want to install.
Sometimes packages will have version numbers in their package names or have some extra characters that make it hard to know exactly what to type to download a package.
One way to search for packages is online. Some package managers or distros will have a website where you can search for packages.
The better way that I would suggest is to use your package manager to search for packages. All package mangers will have a command that allows you to search their database for packages and each will come with a little description so you will know what you're downloading.
An example for Ubuntu: apt search pack-name
Usually the graphical application for your package manager will also have this search feature but it doesn't always give as much information.
Package managers can also be used to uninstall packages. This is usually as easy as running the package manager and then an uninstall command and the name of the package.
Example for Arch linux: pacman -R package-name
This makes it easy to manage all the applications you have installed on your computer because they're all visible in one place.
They will also have functionality to search for all of your installed packages which can be helpful for many uses one being if you want to clean your system of unused packages.
#### Appimages
App images are a self-contained portable app format that work on any linux distro. They are self contained because they have everything they need to run the app they don't rely on anything else installed on your system. 
You typically download them online from the website of the company that makes the app. They do this as opposed to making the program installable through package managers. Sometimes getting your app into a package managers database can be a hassle. 
Appimages aren't able to be run by default so you have to give them execute permissions. From the terminal you can run chmod u+x name_of_your_appimage to actually run them. chmod makes a file runnable(executable) by adding the execute permissions to it. File managers can usually make files executable as well so you don't need to use the terminal. 
You can double click them to run from a file manager just like a mac or windows application. If you're using the terminal just type the name of the appimage and hit enter to run the app.
### Supplementary package managers
While technically multiple package mangers can be used on any distro this is usually a bad idea. Different package mangers store and manage data in different ways which can conflict with each other causing your system to break.
Don't try and install apt on Arch linux. Or pacman on Ubuntu.
There are only 2 packages I know of that are sort of an exception to this rule. Those are homebrew and webi.
The benefit of using either of these two package managers is that they may have packages that your package manager doesn't have.
#### HomeBrew:
[Homebrew](https://brew.sh/) is mostly used as a package manager for macos but can also be used on linux and is generally safe to use with your distro's package manager.
It installs packages from the web, usually a github repository, and adds it to a folder that you can then use just like it was installed through your package manager.
#### Webi
[Webinstall](https://webinstall.dev/) isn't technically a package manager but it does install packages and put them on your path so it has basically the same usecase.
Webi is mainly for software developer and installs a bunch of dev tools that commonly in common package managers.
#### Downloading programs from github
Some programs aren't available to download from any of these sources but maybe you might still want them. This is some whatcommon for ricing tools. 
For a lot of these you will download them through git via github. [Github](https://github.com/) is the website where you're reading this! It's just a place where developers store and share their code. Git is basically a tool for syncing code accross different devices and part of that is downloading code repositories. git clone is the terminal command to download a repository and there's an example further down for how to install this repository.
You do need to make sure git is installed on your system to do this. You can check by running git in your terminal. If it says command not found you need to install git. It will be in your package manager so if your distro uses apt just run sudo apt install git.
Once you clone a repository you need to cd into the directory. A directory is just a file folder. Which means run the cd command which means change directory and then the name of the repository that was just clones from git. Just type out the first couple characters and then press tab. Tab autocompletes commands in the terminal. Then you need to build or compile the program. This just means creating an executable or runnable file out of this directory. Usually in the readme section of github projects they will have instructions on how to do all of this.
##### Adding packages to the path
If these are terminal programs and you want to be able to run them from anywhere in your terminal you have to add that program to your PATH. They are not there by default like they are when the program is installed through your package manager.
Some of this terminology was confusing to me so let me explain it here. The all capital PATH is a list of folders that your terminal will search through when attempting to run a program besides the folder your terminal is currently in.
A folder path is a specifc location of that folder in the file system which is formatted by /s the represent folders.
Folders in the path can be run no matter which folder your terminal is currently in.
To see what folders are currently on your path you can type: echo $PATH into your terminal. This list is a bit hard to read because the separator between folders is a colon.
To permanently add programs to your path you have to edit your shell's configuration file. There is an example in my .zshrc on line 12->15 to add a program to your path. .zshrc is the configuration file for z-shell.
The configuration file for bash is .bashrc. Add this line to add a folder to your path: export PATH=/path/to/your/program/folder:$PATH.
The format of this example path is a folder path. You're adding the FOLDER that contains your executable, not the executable file itself. Any executables in that folder can now be run from anywhere. You can use the chmod command I talked about earlier to make sure those programs are executable.
Then you can run the program from the command line.
To test if you successfully added the program to your path cd into another folder and try and run the program. I usually ```cd ~``` because that takes you into the home folder.

## Dotfiles
What are dotfiles? Why are they called that?
Dotfiles are just files or folders that begin with a period or a dot hence dot files. eg: .zshrc, .config/, .git
The reason that they being with a . is to make them hidden from file managers, which I personally hate, but whatever.
I think they're there for less tech literate people to not get overwhelmed by all the files in their system that they will never touch.
However we are the exception(Aoi Todo). So if you're trying to look for your .zshrc or .bashrc file to add a folder to your path you won't be able to find them without special flags set. This is true both in the terminal and in a graphical file manager.
If you're using the ls command in the terminal you have to add the -a flag to see hidden files. If you're using a file explorer you should be able to turn off hidden files in your settings.
Most of the configuration in these dotfiles and most dotfiles in general are in the .config directory that will have subfolders that are not hidden. So once you're in the .config folder you will be able to see these files normally.
Usually the folder name in the .config folder is just the name of the program it's associated. Eg. tmux for tmux and rofi for rofi. Sometimes these names are a little different like hypr for hyprland or nvim for neovim. Whenever you install these tools their documentation will list out the name of their config folder.
The reason I and other people have our dotfiles in a git repository is to sync them accross devices or when setting up a new computer. If you get a new computer you don't have to lose all of the customization you've made for your set up. You can just clone the repo with your dotfiles and be up and running quickly.
Along the same vain if you have multiple computers you might want them to have the same set up. I personally sync these dotfiles between my laptop and my desktop which makes it easy and consistent to develop on both machines.

## Desktop environment vs Tiling window managers
A Desktop environment is what you're used to if you're coming from Windows or Mac OS. There is a task bar, an application launcher and a control center. Windows open and float or maybe open in full screen in the environment and you can drag and resize them.
Tiling window managers, only handle the organization and displaying of windows. They display windows in a grid system that automatically makes windows non-overlapping. They don't come with an app launcher or task bar or a start menu. That functionality is implemented by other programs of your choosing. The trade off here is that it takes more work to get a system up and running, but you get more fine grain control and customization over that system.
So if you're wondering how people make their windows look very organized and non overlapping it's because they're using a tiling window manager.
### How to choose between them
This is one of the first things that you need to decide between when ricing your setup. And decides how much control you'll have over your set up.
Because desktop envionrments come with built in elements you can only customize them as much as the environment allows. There's usually a good amount of customization options but it won't be as customizable as a tiling window manager environment.
Tiling window managers only mange your windows so you have fine grain control of your environment. And there's a bunch of different tools to use for each of these. From your bar to your notification client to your application launcher to your lock screen. They are also very keyboard focused. This can be good for high productivity because you never need to take your hands off of the keyboard.
Part of this is distro dependent. Some distros will choose for you. Some will let you choose between them. Some are sort of hostile to switching from a desktop environment to a tiling window manager and it's just sort of annoying.
I would say to choose between them based on how much control and customization you want. If you want a system that works out of the box but can be made to look pretty use a desktop environment.
If you like to tinker and want a high level of customization go with a tiling window manager.
Once you know which you want look into the differences between the different implementations. Like [hyprland](https://wiki.hypr.land/) vs [niri](https://github.com/niri-wm/niri) for tiling window managers. Or [KDE](https://kde.org/) vs [Gnome](https://www.gnome.org/) for desktop environment. There are more options than these but these are some of the popular options.
I know I just gave you a lot of options but at the end of the day don't spend too long picking one or the other. Just pick one. Once you've used one or the other you'll figure out what you like and you can always switch.

## My dotfile principles
I want my dotfiles to be readable and understandable so here are some disclaimers. I usually do not include configuration for fields that are default. Documentation isn't the best for listing out all of the options that are configureable. This can be very frustrating because its hard to customize something that you don't know is customizeable. 
I got over this by using [Deepwiki](https://deepwiki.com/) to answer specific questions I had.
I try to have single file configs. This makes them more readable for me by having all the configuration for an associated tool be in one place.
In my config files there are comments that explain what the sections that are there do. I do this for myself when I'm coming back to reconfigure something I haven't touched in awhile. They should also be helpful for you to explain how each tool works how it does.
There are also a lot of dotfiles online in the aformentioned r/unixporn. These can be incredibely helpful for seeing how a whole system comes together to create a working environment.
There is another Readme in this repo called Logistics.md. This is just a file I use mainly to keep a consistent color palette between my tools. It also links to the github repos of the tools I use, which serves as a list of all my tools as well.

#### Nerd Font Disclaimer
When you look through my dotfiles on github there will be some characters that look like boxes with numbers in them. Those are unrendered icons and you need nerd fonts to render them. Usually these don't work in browsers that's why they look weird on github. [Nerd fonts](https://www.nerdfonts.com) allows you to preview nerdfonts and also has a cheat sheet allowing you to copy icons.
How to install fonts

### Cava
[Cava repository](https://github.com/karlstav/cava)
This is a terminal audio visualizer. It's purely aethetic and I just have it on my second monitor when I'm working to look nice.
There isn't much to customize for Cava even though my config looks kinda long. There is a default config file that comes when you download cava. It has a lot of helpful comments that explain what the different feilds do. I left some of these comments in my config file. You can change a lot of elements of the bars. Just experiment until you find what's nice to look at. The other big area of customization I did is changing the colors of the bars. You can have a gradient that makes the bars have different colors at different heights which is what I did. Or you can have a mono colored bars. You can also change the background color to contrast with your bar color.

## Ghostty
[Ghostty Documentation](https://ghostty.org/)
This is the terminal I use. It's fast and configureable. The documentation has all of the features you can change and configure. I just have a couple of keybinds configured and some aesthetic things like my font and theme. The theme changes the text colors when running terminal commands. I personally use kibble because it matches the colors of my rice.

Cursor animations are one of the new features. To customize your cursor animation you need a glsl file which is a shader file. I'm a programmer and I really don't know how make my own glsl shader for my cursor. I used these resources to make my custom one. Make sure you have the cursor shader line in your config file.

## Hyprland
[Hyprland Documentation](https://wiki.hypr.land/Hypr-Ecosystem/hyprpaper/)
Hyprland is a tiling window manager that I use because it looks nice, has pretty, configurable animations and has a bunch of tools in its ecosystem such as hyprlock and hyprpaper which are explained below.

My wallpaper is in my wallpapers folder. I would recommend adding your wallpapers there to keep the path to the wallpapers consistent.
Functionality is grouped together by categories. In the configuration file this means there will be that category name and then curly braces {}. The variables for that category then need to be declared inside those curly braces
I consulted the documentaiton a lot when configuring hyprland I honestly don't remember where I found my wallpaper but there are a bunch of good wallpaper websites. R/unixporn is good repository of wallpapers as well.

### Hyprlock
[Hyprlock Documentaion](https://wiki.hypr.land/Hypr-Ecosystem/hyprlock/)
This is the hyprland ecosystem lock screen. Mine is quite minimal I just have the time and date. The documentation is pretty good for this one and simlple. 
Because its a hyprland tool it uses the same configuration style of `categoryname {variabels}` to configure each category.

### Hyprpapaer
[Hyprpaper Documentation](https://wiki.hypr.land/Hypr-Ecosystem/hyprpaper/)
This is the hyprland ecosystem tool for displaying wallpapers. Mine just sets both my monitors to the same wallpaper.

## Neovim
[Neovim](https://neovim.io/)
I use neovim for code editing and for my personal Notes because I can't go back to any other text editor.

The aesthetic part of my neovim setup is in the cattpuccin plugin config. There I override the colors to be to my liking and fit with my rice theme.
All of the other settings are keybinds and plugins to help my programming workflow. There is quite a lot of setup to get neovim off the ground as a good code editor but I would say it is worth it.
Look elsewhere for a complete guide to setting up neovim. Many have done it far better than I ever could here.
I used [kickstart](https://www.youtube.com/watch?v=m8C0Cq9Uv9o&list=WL&index=1) to start my neovim journey. It's a tutorial and base config file made by one of the neovim maintainers.He explains a lot of core functionality and how to customize neovim to your liking. It was incredibely helpful for me and allowed me to extend the config passed where he had set it up.

## Rofi
[Rofi repo](https://github.com/davatorium/rofi)
I use rofi as my application launcher and for quick calulations I need.Very useful tool. I use it as a calculator and to open my app images and launch apps I don't have keybinds for


## Tmux
[Tmux Wiki](https://github.com/tmux/tmux/wiki)
[Cheat sheet](https://tmuxcheatsheet.com/)
Tmux is very much a developer tool so if you're not a Software engineer this one probably won't be helpful for you. Tmux basically allows you to save the state of your terminal and organize that state into sessions. So I use it to organize my different projects into different sessions and windows to keep everything organized and to keep navigation down.
Tmux has a plugin ecosystem but I don't really use it. I have to restart my computer a lot because I have a windows partition. I know disgusting. So I use the Tmux resurect which can save your tmux session data and then restore it after you restart your computer.

## Waybar
[Waybar Wiki](https://github.com/Alexays/Waybar/wiki)
Waybar has two config sections. I have this seperated out into two files but some people use more than 2 files. There is the config.jsonc and the style.css sections. The config.jsonc handles the functionality of waybar. So where the bar is located how many workspaces you have etc. The style.css handles the aesthetics and how it looks. There are built in names for predefined groups but you can also create custom groups. I use this for my gpu-useage percent on my bar. It can also be helpful to group different modules together. This allows them to be styled together in the css.

## Wlogout
[Wlogout repo](https://github.com/ArtsyMacaw/wlogout)
I use this as my start menu basicallly. It lets you logout, restart, sleep etc.
The configuration is pretty simple as well. The layout file shows in order the labels that are listed. The action is a terminal command to run similar to X idk. The style.css handles how the menu looks. Including add pictures that display for each label.

## Starship
[Startship wiki](https://starship.rs/)
I use this as my terminal command prompt.
It gives me a lot of useful info like the file path I'm currently in as well as the git status of the folder and the programming language this project is in which is helpful for my dev work.
The format section at the top determins the order that different sections appear from left to right. You also define the colors of each section here. 
Each section is configured by [name of section] where you can put the name of the section. In the configuration section of the wiki it lists out all of the section names and the options to configure them.
On the wiki there are some example configs. I used the cattpuccin base because it organized the sections similar to how I liked

## Z shell
[Z shell wiki](https://www.zsh.org/)
I use Z shell because it has a couple of plugins that I really value like syntax highlighting and autocomplete. These are incredibely useful because they help me determine if I'm formatting terminal commands correctly. The configureation for adding folders to the path is relatively simple as well.

## Scripts
My folder for bash scripts
I only have one right now that handles the cava visualizers on my waybar. It's good to keep scripts in one folder so they're consitently in one spot. Scripts are usually good for automating workflows. If there's something you do in the terminal a lot considering writing a script for it.
Bash scripts are just a bunch of terminal commands chained together with some parsing logic. Bash scripting was pretty hard for me to understand at first so I would recommend reading about it if you want to know more/ want to do some more powerful bash scripting.

## Git

Git is a version control system for 

Ensure you have the following installed on your system
### Stow
[Link to gnu stow]() This tool isn't super complicated but it's the main tool along with git I use to organize my dotfiles. I will go over how to use it more in the installation section.

# Dotfiles
## Installation

First, check out the dotfiles repo in your $HOME directory using git
[[Logistics]]
```
cd ~
git clone git@github.com/Astordg/dotfile.git
cd dotfiles
```

Then use GNU stow to create symlinks

```
$ stow .
```

Video link [Here](https://www.youtube.com/watch?v=y6XCebnB9gs)

