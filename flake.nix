{
  description = "A very basic flake";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs?ref=nixos-unstable";
    
    waybar = {
      url = "github:alexays/waybar/master";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    zen-browser = {
      url = "github:0xc000022070/zen-browser-flake";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    tmog = {
      url = "path:./modules/apps/tmog";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = inputs@{ self, nixpkgs, home-manager, waybar, zen-browser, tmog }: 
    let 
    sharedModules  = [
      ./modules/boot.nix
      ./modules/wm.nix
      ./modules/user.nix
      ./modules/fonts.nix
      ./modules/bash.nix
      ./modules/common.nix
      ./modules/apps/bitwarden.nix
      ./modules/apps/appimage.nix
      ./modules/apps/yubikey.nix
      ./modules/apps/neovim.nix
      ./modules/apps/discord.nix
    ];
    in {
      nixosConfigurations.Luna = nixpkgs.lib.nixosSystem {
        specialArgs = { inherit inputs; };
        modules = sharedModules ++ [ 
          ./hosts/luna/configuration.nix 
    	  ./modules/gaming.nix
  	  ./modules/apps/openrgb.nix
  	  home-manager.nixosModules.default {
  	    home-manager = {
  	      users.andy = ./homemanager/luna.nix;
  	    };
          }
        ];
      };
      nixosConfigurations.Nika = nixpkgs.lib.nixosSystem {
        specialArgs = { inherit inputs; };
        modules = sharedModules ++ [
          ./hosts/nika/configuration.nix
          home-manager.nixosModules.default {
  	    home-manager = {
  	      users.andy = ./homemanager/nika.nix;
            };
          }
        ];
      };
    };
}
