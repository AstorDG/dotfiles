{ pkgs, ... }:

{
  # Replace with your macOS short username: `whoami`
  system.primaryUser = "astor";

  nixpkgs.hostPlatform = "aarch64-darwin";
  # For an Intel Mac, use:
  # nixpkgs.hostPlatform = "x86_64-darwin";
  nixpkgs.config.allowUnfree = true;

  nix.settings.experimental-features = [
    "nix-command"
    "flakes"
  ];

  # Startup commands
  launchd.user.agents.border = {
  	command = "/run/current-system/sw/bin/borders width=12 active_color=0xff600000 inactive_color=0xff646464";
   	serviceConfig = {
    	RunAtLoad = true;
     	KeepAlive = true;
      	ProcessType = "Background";
    };
  };

  environment.systemPackages = with pkgs; [

  	##### Terminal Apps #####
    fish
    lsd
    starship
    btop
    stow
    nil
    nixd
    neovim
    zig
    jankyborders

    ##### GUI Apps #####
    zed-editor
    ghostty-bin
	raycast
	obsidian
	stirling-pdf-desktop
	zoom-us
	#zen-browser flake
	# inputs.zen-browser.packages.${pkgs.system}.default

	##### Non Nix packages #####
	#
  ];

  # Adds Fish to /etc/shells so macOS accepts it as a login shell.
  programs.fish.enable = true;

  # Makes Fish your login shell.
  users.users.astor.shell = pkgs.fish;
  environment.shells = [pkgs.fish];

  security.pam.services.sudo_local.touchIdAuth = true;

  # macOS settings managed by nix-darwin.
  # Show hidden files in finder
  system.defaults = {
    NSGlobalDomain = {
    	AppleEnableMouseSwipeNavigateWithScrolls = false;
      AppleInterfaceStyle = "Dark";
      AppleScrollerPagingBehavior = true;
      AppleShowAllExtensions = true;
      AppleShowAllFiles = true;
      InitialKeyRepeat = 14;
      KeyRepeat = 1;
      NSAutomaticCapitalizationEnabled = false;
      NSAutomaticPeriodSubstitutionEnabled = false;
      NSAutomaticQuoteSubstitutionEnabled = false;
      NSAutomaticSpellingCorrectionEnabled = false;
      NSDocumentSaveNewDocumentsToCloud = false;
    };

    dock = {
      autohide = true;
      orientation = "left";
    };

    finder = {
      AppleShowAllExtensions = true;
      AppleShowAllFiles = true;
      CreateDesktop = false;
      FXDefaultSearchScope = "SCcf";
      FXPreferredViewStyle = "clmv";
      QuitMenuItem = true;
      ShowPathbar = true;
      _FXShowPosixPathInTitle = true;
      _FXEnableColumnAutoSizing = true;
      ShowStatusBar = true;
    };

    trackpad = {
      Clicking = true;
      TrackpadRightClick = true;
    };
  };

  system.keyboard = {
    enableKeyMapping = true;
    remapCapsLockToEscape = true;
  };

  system.stateVersion = 7;
}
