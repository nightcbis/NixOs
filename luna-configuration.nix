# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).

{ config, pkgs, ... }:

{
  imports =
    [ # Include the results of the hardware scan. And the shared configuration.
      ./luna-hardware-configuration.nix
      ./configuration.nix
    ];

  #Power Button
  services.logind.settings.Login.HandlePowerKey = "suspend";

  services.hardware.openrgb.enable = true; #För att OpenRGB ska få root-behörigheter

  environment.systemPackages = with pkgs; [
    openrgb-with-all-plugins #OpenRGB
  ];
  
  networking.hostName = "Luna"; # Define your hostname.

  #Steam
  programs.steam.enable = true;

}
