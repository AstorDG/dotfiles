{
  description = "Nix-Darwin Flake";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixpkgs-unstable";

    nix-darwin = {
      url = "github:nix-darwin/nix-darwin/master";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    # zen-browser = {
    #       url = "github:0xc000022070/zen-browser-flake";
    #       inputs.nixpkgs.follows = "nixpkgs-unstable";
    # };
  };

  outputs =
    inputs@{self,nix-darwin, nixpkgs, ... }:
    {
      darwinConfigurations."Astors-MacBook-Air" =
     	nix-darwin.lib.darwinSystem {
        	modules = [ ./configuration.nix ];
	    };
		# specialArgs = {
		# 	inherit inputs;
		# };
    };
}
