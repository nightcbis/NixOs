{ pkgs, ... }:

{

  programs.appimage = {
    enable = true;
    bitfmt = true;
  };

  environment.systemPackages = with pkgs; [
    appimage-run
  ];
}
