# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).

{ config, pkgs, ... }:

{
  imports =
    [ # Include the results of the hardware scan. And the shared configuration.
      ./hardware-configuration-luna.nix
      ./configuration.nix
    ];

  #Power Button
  services.logind.settings.Login.HandlePowerKey = "suspend";

  services.hardware.openrgb.enable = true; #För att OpenRGB ska få root-behörigheter

  #Ratten
  hardware.new-lg4ff.enable = true;
  services.udev.packages = with pkgs; [ oversteer ];
  
#  services.udev.extraRules = ''
  # Logitech G27 Driving Force Racing Wheel (Native Mode)
#  ATTRS{idProduct}=="c24f", ATTRS{idVendor}=="046d", MODE="0666"

  # Logitech G27 Driving Force Racing Wheel (Compatibility Mode)
#  ATTRS{idProduct}=="c29b", ATTRS{idVendor}=="046d", MODE="0666"
#'';

  environment.systemPackages = with pkgs; [
    openrgb-with-all-plugins #OpenRGB
    oversteer #Steering wheel
    gamescope #Gaming
    lutris #Gaming
    protonup-qt #Gaming
    wine #Gaming
    mangohud #Gaming
    gamemode #Gaming
    protontricks #Gaming
    gimp #Image editor
    plasticity #3D Program
    github-desktop #Desktop app for git.
  ];

  networking.hostName = "Luna"; # Define your hostname.

  #Steam
  programs.steam.enable = true;

}
