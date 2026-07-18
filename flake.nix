{
  description = "A very basic flake";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs?ref=nixos-unstable";

    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = { self, nixpkgs, home-manager }: {
    nixosConfigurations.Luna = nixpkgs.lib.nixosSystem {
      modules = [ 
        ./luna-configuration.nix 
	home-manager.nixosModules.default
      ];
    };
    nixosConfigurations.Nika = nixpkgs.lib.nixosSystem {
      modules = [
        ./nika-configuration.nix
	home-manager.nixosModules.default
      ];
    };
  };
}
