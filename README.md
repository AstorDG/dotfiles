# My Dotfiles/Intro to Ricing

## Intro

I'm writing this as the introduction to ricing that I would have wanted when I started on my linux journey.
This is not meant to be a complete guide for all of the tools that I reference. It is meant to explain basic concepts that are usually confusing for beginners and show you where to look when you get confused, because you will.
I also want a quick reference to these concepts for myself if I get confused about something on my system.

## Package Managers
One of the biggest changes when coming from Windows or MacOS is how programs, or packages as we call them in the linux world, are installed.
The main paradigm for installing applications on those operating stystems is going to a website or an appstore and downloading the app or app installer into your downloads folder. Then running the installer and then the app appears in your program launcher or your task bar.
While you can install packages this way on linux the perfered way is to use that distributions package manager.
A package manager is basically an app store for that linux distro with some differences but they serve the same purpose.
To install programs and applications for the user to use. Different linux distros will have different package managers, such as apt for ubuntu and linux mint or pacman for Arch linux. I would strongly suggest you to get familiar with your linux distribution's package manager.
Package managers
One of the things that's annoying when using a package manager is finding the exact name of a program or app you want to install.
### Suplementary package managers
While technically multiple package mangers can be used on any distro this is usually a bad idea. Different package mangers store and manage data in different ways which can conflict with each other causing your system to break.
Don't try and install apt on Arch linux
#### Adding packages to the path
#### HomeBrew:
One of the exceptions to this is Homebrew. Homebrew is mostly used as a package manager for macos but can also be used on linux and is generally safe to use with your distro's package manager.
The benefit of using Homebrew over your native package manager is that it may have packages that your package manager doesn't have.
#### Webi
[Webinstall](https://webinstall.dev/) isn't technically a package manager but it does install packages and put them on your path so it has basically the same usecase.
While webi is mainly for developer tools I wanted to mention it even for the non developers because it has some tools that are meant to be better versions of their GNU counter parts(more on that later).
One of these is [lsd](https://webinstall.dev/lsd/). Ls is used to list out files and folders in the terminal
lsd is a better version of ls by having more functionality. One of the best part of lsd is that it renders different images for different file types.
Different file extensions also render with the icon attached to their extension. So folders render with a little folder icon next to their name, making them easy to differenciate from files. 

## The *Terminal*
The terminal a topic could and probably has had multiple books written about it. I'm really only putting this section here to tell you not to be afraid of it.
It's the main way to install packages with your package manager although some distros have a graphical program that you can use to install packages

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
    - Window managers vs desktop environments
    - Package managers and webi
    - List out all of the packages, their functionality and explinations of how I set them up
    - Not ever field that can be changed is changed. Some wikis are helpful at listing out all of the things that can be changed for theri tools and some aren't
    - Talk about logistics.md
    - Talk about gnu stow
