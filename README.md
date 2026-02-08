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

### Suplementary package managers
While technically multiple package mangers can be used on any distro this is usually a bad idea. Different package mangers store and manage data in different ways which can conflict with each other causing your system to break.
Don't try and install apt on Arch linux. For pacman on Ubuntu.
There are only 2 packages I know of that are sort of an exception to this rule. Those are homebrew and webi.
The benefit of using either of these two package managers is that they may have packages that your package manager doesn't have.
#### HomeBrew:
Homebrew is mostly used as a package manager for macos but can also be used on linux and is generally safe to use with your distro's package manager.
It installs packages from the web, usually a github repository, and adds it to a folder that you can then use just like it was installed through your package manager.
#### Webi
[Webinstall](https://webinstall.dev/) isn't technically a package manager but it does install packages and put them on your path so it has basically the same usecase.
While webi is mainly for software developer tools I wanted to mention it even for the non developers because it has some tools that are meant to be better versions of common linux command line tools.
One of these is [lsd](https://webinstall.dev/lsd/). Ls is used to list out files and folders in the terminal
lsd is a better version of ls by having more functionality. One of the best part of lsd is that it renders different images for different file types.
Different file extensions also render with the icon attached to their extension. So folders render with a little folder icon next to their name, making them easy to differenciate from files. 
#### Adding packages to the path
Sometimes programs aren't available through a package manager so you have to download them through [Git](#Git) or from the internet etc. 
If these are terminal programs and you want to be able to run them from any folders you have to add that program to your PATH.
What is the path? The path is a list of folders that your terminal will search through when attempting to run a program. 
What this means in practice is that you can run programs on your path no matter what folder your terminal is currently in which is very convenient.
To see what programs are currently on your path you can type: echo $PATH into your terminal.
To permanently add programs to your path you have to edit your shell's configuration file. I have an example in my .zshrc file. You can copy this if you use z-shell.
However you will probably have bash installed by default in your terminal. I will go over the differences between shells in the terminal section.
The bash config file is .bashrc and you have to add: export PATH=/this/is/an/example/path:$PATH.
The format of this example path is a link to an executable file. So you have to make sure the last file listed in this link is an executable.
When you download a program it won't be executable by default. So you need to use the chmod terminal command in this format: chmod +x yourexecutable.
Then you can run the program from the command line.

## Desktop environment vs Tiling window managers
Desktop environment is what you're used to if you're coming from windows or Mac OS. There is a built in task bar that you can attach application to. There will usually be a control center for volume control and date time showing. And the windows open from different applications and float in the enviornment and you can drag and reshpae them.
Window managers and what most people use, tiling window managers, only handle the organization and displaying of your windows. They don't come with a bar or an app launcher or a start menu. All of that is handled by other programs. The benefit of this is that tiling window managers help organize your windows into their own space on your monitor and they can neatly organize windows to use all of your screen real estate. They also have spaces.
So if you're wondering how people make their windows look all pretty and organized it's because they're using a tiling window manager.
How to pick which one you want: I really enjoy my tiling window manager having used desktop environments my whole life. It also gives you more customization. I would say if you like to customize and configure go with a tiling window manager and accept it take longer to set up than a desktop enviornment. But if you want something that just works and then you want to add some aethetics on top that may be limited go with a desktop enviornment.
How to pick a tiling window manager: I'm gonna be honest I don't really know. All I can say is that I use hyprland because it has a good ecosystem for those extra featres that window managers don't come with. It was also relatively easy for me to configure as someone that had never used a tiling window manager before.

## Dotfiles
Now that you know which file to edit for shell customization how do you even find it? This leads into dotfiles.
What are dotfiles and why are they called that?
Dotfiles are just files that begin with a period. eg: .config, .git
The reason that they being with . is to make them hidden from file managers, which I personally hate hidden files but whatever.
But I think they're there for less tech literate people to not get overwhelmed by all the files in their system that they will never touch. 
We are the exception(Aoi Todo). So if you're trying to look for your .zshrc or .bashrc file in a file manager or in the terminal you won't be able to find them without 
special flags set. If you're using ls in the terminal you have to add the -a flag to see hidden files. If you're using a file explorer you should be able to turn off hidden files in your settings.
In my dotfiles I try and not to include fields when I'm using the default value for that field. Documentation isn't always the best for listing out all of the options that are configureable. This can be very frustrating because its hard to customize something that you don't know is customizeable. 
I mainly just got over this by using deepwiki to answer a question when I needed to try an implement some specific functionality that maybe I coulnd't find in the documentation.
With all that said lets get into dotfiles and managing them. This is my repository for managing my dotfiles.

#### Nerd fonts
When you look through my dotfiles on github there will be some characters that look like boxes with numbers in them. Those are unrendered icons and you need nerd fonts to render them. Usually these don't work in browsers that's why they look weird on github. Ghostty comes with a built in Nerd Font called JetBrains Mono. I use *This* website to preview the nerdfront that I use in ghostty.

## Cava
[Cava repository](https://github.com/karlstav/cava)
This is a terminal audio visualizer. It's purely aethetic and I just have it on my second monitor when I'm working to look nice.
There isn't much to customize for Cava even though my config looks kinda long. The defaul config that comes when you download cava comes with a lot of helpful comments, a lot of which I've left in mine. You can change a lot of elements of the bars. Just exeriment until you find what's nice to look at. The other big area of customization I did is changing the colors of the bars. You can have a gradient that makes the bars have different colors at different heights which is what I did. Or you can have a mono colored bars. You can also change the background.

## Ghostty
[Ghostty Documentation](https://ghostty.org/)
This is the terminal I use. It's fast and has a lot of modern features. It has a very easy to configure configuration file and it's very cusomizeable but has very good defaults. Ghostty has a lot of configuring that can be done, but has really good defaults. The aethetic of mine is based on the theme I use which is Kibble. To see how the theme look run this command in ghostty. I use it because it gives me everything I need in a terminal.

Cursor animations are one of the new features. To customize your cursor animation you need a glsl file which is a shader file. I'm a programmer and I really don't know how make my own glsl shader for my cursor. I used these resources to make my custom one. Make sure you have the cursor shader line in your config file.

## Hyprland
[Hyprland Documentation](https://wiki.hypr.land/Hypr-Ecosystem/hyprpaper/)
It looks nice. Lets me customize keybinds to launch applications.
My wallpaper is in my wallpapers folder. I would recommend adding your wallpapers there to keep the path to the picture consistent.
Where did I find my wallpaper. R/unixporn is good repository of wallpapers as well.
### Hyprlock
[Hyprlock Documentaion](https://wiki.hypr.land/Hypr-Ecosystem/hyprlock/)
Lock screen I use

### Hyprpapaer
[Hyprpaper Documentation](https://wiki.hypr.land/Hypr-Ecosystem/hyprpaper/)
My wallpaper renderer.

## Neovim
[Neovim](https://neovim.io/)
I use neovim for code editing and for my personal Notes because I can't go back to any other text editor.

I used this to start my neovim journey. It's a tutorial by one of the neovim maintainers and he explains a lot of core functionality and how to customize neovim to your liking.
[kickstar](https://www.youtube.com/watch?v=m8C0Cq9Uv9o&list=WL&index=1)

## Rofi
[Rofi repo](https://github.com/davatorium/rofi)
Very useful tool. I use it as a calculator and to open my app images and launch apps I don't have keybinds for


## Tmux
[Tmux Wiki](https://github.com/tmux/tmux/wiki)
[Cheat sheet](https://tmuxcheatsheet.com/)
I have to restart my computer a lot because I have a windows partition. I know disgusting so I use Tmux resurect which restores your tmux state.

## Waybar
[Waybar Wiki](https://github.com/Alexays/Waybar/wiki)
This is my bar. Useful stuff for setting it up here:

## Wlogout
[Wlogout repo](https://github.com/ArtsyMacaw/wlogout)
I use this as my start menu basicallly. It lets you logout, restart, etc.

## Starship
[Startship wiki](https://starship.rs/)
I use this as my terminal command prompt.
It gives me a lot of useful info like the file path I'm currently in as well as the git status of the folder and the programming language this project is in which is helpful for my dev work.

## Z shell
[Z shell wiki](https://www.zsh.org/)
I use Z shell because it has syntax highlighting and stuff when I wanna run terminal commands which is incredibly helpful.


## Scripts
My folder for bash scripts


## Git

Git is a version control system for 

Ensure you have the following installed on your system
### Stow

# Dotfiles
## Installation

First, check out the dotfiles repo in your $HOME directory using git

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

- Topics:
    - Package managers include webi and homebrew
    - Window managers vs desktop environments
    - List out all of the main packages I need for my rice then their functionality and explinations of how I set them up
    - Not every field that can be changed is changed or explicitly listed out. Some wikis are helpful at listing out all of the things that can be changed for their tools and some aren't
    - Talk about logistics.md
    - Talk about gnu stow
