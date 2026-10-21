{ config, pkgs, inputs, ... }:

{
  imports = [
    ./modules/boot.nix
    ./modules/wm.nix
    ./modules/user.nix
    ./modules/fonts.nix
    ./modules/bash.nix
    ./modules/apps/bitwarden.nix
    ./modules/apps/appimage.nix
    ./modules/apps/yubikey.nix
    ./modules/apps/discord.nix
  ];

  #Neovim Fick bara defaultEditor att fungera när jag hade den i config.nix istället för home.nix
  programs.neovim = {
    enable = true;
    defaultEditor = true;
  };

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
