{
  description = "A very basic flake";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs?ref=nixos-unstable";
    waybar.url = "github:alexays/waybar/master";

    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = inputs@{ self, nixpkgs, home-manager, waybar }: {
    nixosConfigurations.Luna = nixpkgs.lib.nixosSystem {
      specialArgs = { inherit inputs; };
      modules = [ 
        ./configuration-luna.nix 
	home-manager.nixosModules.default {
	  home-manager = {
	    users.andy = ./home-luna.nix;
	  };
	}
      ];
    };
    nixosConfigurations.Nika = nixpkgs.lib.nixosSystem {
      specialArgs = { inherit inputs; };
      modules = [
        ./configuration-nika.nix
#	home-manager.nixosModules.default
        home-manager.nixosModules.default {
	  home-manager = {
	    users.andy = ./home-nika.nix;
          };
	}
      ];
    };
  };
}
