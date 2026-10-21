{ pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    xdg-desktop-portal-cosmic #Discord screensharing etc
    discord-canary #Discord
  ];
}
