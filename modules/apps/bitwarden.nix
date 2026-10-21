{ pkgs, ... }:

{
  nixpkgs.config.permittedInsecurePackage = [
    "electron-39.8.10"
  ];

  environment.systemPackages = with pkgs; [
    bitwarden-desktop
  ];
}
