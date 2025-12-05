# My Dotfiles/Intro to Ricing
If you don't care about the tutorial scroll down to here. [Installation](#Installation)
## Intro
What is ricing? Ricing is the process of customzing your linux environment. It's both aethetic and functinoal but mostly aethetic.
Why is it called ricing? It came from asian car owners adding mostly asethetic mods to their cars and then the term was adopting in the computer space.
I'm writing this as the introduction to ricing and some common linux tools that I would have wanted when I started on my linux journey.
This is not meant to be a complete guide for all of the tools that I reference. It is meant to explain basic concepts that were confusing for me as a beginning and show you where to look when you get confused, because you will.

## Package Managers
One of the biggest changes when coming from Windows or MacOS is how programs/applications, or packages as we call them in the linux world, are installed.
The main paradigm for installing applications on those operating stystems is going to a website or an appstore and downloading the app or app installer. Then running the installer and the app appears in your program launcher, your task bar or your applications foloder.
While you can install packages this way on linux the perfered way is to use your package manager.
A package manager is basically an app store that is accessed through a terminal or command line interface(CLI for short). There are some differenced but they serve the same purpose of getting software onto your computer.
Different linux distributions, or distros for short, will have different package managers. Examples include apt for ubuntu, pacman for Arch linux or DPKG for Debian.
I would strongly suggest you to get familiar with your linux distribution's package manager as they can be confusing at first and take some time to learn.
### Installing and uninstalling programs
One of the things that's annoying when using a package manager is finding the exact name of a program or app you want to install.
Sometimes packages will have version numbers in their package names or have some extra characters that make it hard to know exactly what to type to download a package.
One way to search for packages is online. Some package managers or distros will have a website where you can search for packages.
The better way that I would suggest is to use your package manager to search for packages. All package mangers will have a command that allows you to search their database for packages and each will come with a little description so you will know what you're downloading.
Package managers can also be used to uninstall packages. This is usually as easy as running the package manager and then an uninstall command and the name of the package.
They will also have functionality to search for your installed packages which can be helpful if you need to know what packages to install on another system or if you want
to clean ur system of unused packages.

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
What is the path? The path is a list of folders that your terminal will search through when attempting to run a program. 
What this means in practice is that you can run programs on your path no matter what folder your terminal is currently in.

## The *Terminal*
The terminal a topic that could and probably has had multiple books written about it. I'm really only putting this section here to tell you not to be afraid of it.
It's the main way to install packages with your package manager although some distros have a graphical program that you can use to install packages. They are really using terminal commands under the hood though.
Your terminal is very powerful 

## Git

Git is a version control system for 

Ensure you have the following installed on your system

## Dotfiles
What are dotfiles and why are they called that? 
Dotfiles are just files that begin with a period. eg: .config, .git
The reason that they being with . is to make them hidden from file managers. I personally hate hidden files and always turn them off.
But I think they're there for less tech literate people to not get overwhelmed by all the files in their system that they will never touch. 

With all that said lets get into dotfiles and managing them. This is my repository for managing my dotfiles.


## Disclaimers
One of things that some guides will do that's very confusing is when they instruct you to run terminal commands they'll put '$' at the beginning of the command. The $ is just a stand in for the text in your terminal that preceeds the commands you type in. Also known as the command prompt. When running commands from a guide remember to exclude this part from the command when your copy and pasting or typing out the command. 
Another thing to be weary of is multi line commands. Sometimes guides will just have a bunch of commands one after the other and whatever copy button they have will copy all of the lines into your terminal. If you try and run commands this way they will not work.
Commands are run one at a time, for the most part. Copy these one line at a time
Remember that most of this setup is purely aesthetic. If you find your self getting frustrated will some tool or you're feeling like it's taking too long remember you can always just not use it. The beauty of linux is that it's your system and you can install and configure it however you want. Find a tool with the same or similar functionality that has better defaults or better configuration options. If it stops being fun just remember why you're configuring.


### Stow

## Installation

### Neovim
[kickstar](https://www.youtube.com/watch?v=m8C0Cq9Uv9o&list=WL&index=1)

First, check out the dotfiles repo in your $HOME directory using git

```
cd ~
git clone git@github.com/Astor730/dotfile.git
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
