{
  description = "TMOG AppImage package";

  inputs.nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";

  outputs = { self, nixpkgs, ... }:
    let
      system = "x86_64-linux";
      pkgs = import nixpkgs { inherit system; };

      tmog = pkgs.appimageTools.wrapType2 {
        pname = "tmog";
        version = "1.0.0";

        src = pkgs.fetchurl {
          url = "https://tmog.org/rtm/downloads/TaskManagerOG-1.0.0-x86_64.AppImage";
          hash = "sha256-7jd6c5SfiQhju8+tCd02tgugR28Me8vQ0Os0NeKQKpY=";
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
