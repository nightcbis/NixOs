{
  description = "A very basic flake";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs?ref=nixos-unstable";
    waybar.url = "github:alexays/waybar/master";
    zen-browser.url = "github:0xc000022070/zen-browser-flake";
    tmog.url = "path:./modules/apps/tmog";

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
  	./configuration.nix
  	./modules/gaming.nix
  	./modules/apps/openrgb.nix
  	home-manager.nixosModules.default {
  	  home-manager = {
  	    users.andy = ./home/luna.nix;
  	  };
  	}
        ];
      };
      nixosConfigurations.Nika = nixpkgs.lib.nixosSystem {
        specialArgs = { inherit inputs; };
        modules = sharedModules ++ [
          ./hosts/nika/configuration.nix
  	./configuration.nix
  #	home-manager.nixosModules.default
          home-manager.nixosModules.default {
  	  home-manager = {
  	    users.andy = ./home/nika.nix;
            };
          }
        ];
      };
    };
}
