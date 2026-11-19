{
  description = "TMOG AppImage package";

  inputs.nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";

  outputs = { self, nixpkgs, ... }:
    let
      system = "x86_64-linux";
      pkgs = import nixpkgs { inherit system; };

      tmog = pkgs.appimageTools.wrapType2 {
        pname = "tmog";
        version = "1.1.1";

        src = pkgs.fetchurl {
	  url = "https://tmog.org/downloads/TaskManagerOG-1.1.1-x86_64.AppImage";
	  hash = "sha256-EqHy7WDCiwdJoT7q7EaW8kGkJftnFdnndHgHzmLTsTk=";
	  # nix hash file --type sha256 TaskManagerOG-1.1.1-x86_64.AppImage
	  # And then I got an error that showed the right hash....
        };

        extraInstallCommands = ''
          mkdir -p $out/share/applications

          cat > $out/share/applications/tmog.desktop <<EOF
          [Desktop Entry]
          Name=Task Manager OG
          Comment=Task Manager OG
          Exec=tmog
          Terminal=false
          Type=Application
          Categories=Utility;
          EOF
        '';
      };
    in {
      packages.${system}.default = tmog;
    };
}
