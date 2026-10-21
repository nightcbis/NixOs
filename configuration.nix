{ config, pkgs, inputs, ... }:

{
  imports = [
 ];

  #Programs to install.
  environment.systemPackages = with pkgs; [
    inputs.zen-browser.packages.${pkgs.stdenv.hostPlatform.system}.twilight
    inputs.tmog.packages.${pkgs.stdenv.hostPlatform.system}.default
    starship #mod for bash
    git
    usbutils
    tealdeer #Kanske ta bort? Fick som tips ifrån någon video
    xclip #Kanske ta bort? Fick som tips ifårn någon video
    killall 
    wget
    pavucontrol #Soundmixerplay
    playerctl #Play/Pause etc
    blueman #Bluetooth
    bluez #Bluetooth
    xdg-desktop-portal-cosmic #Discord screensharing etc
    qview #Image viewer
    galculator #Calculator
    vlc #VLC
    unzip #Unzip

    thunar #Filemanager
    bat #cat replacement
    fastfetch #Fastfetch
    discord-canary #Discord
    thunderbird #Mail
  ];
}
