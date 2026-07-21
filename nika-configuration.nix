# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).

{ config, pkgs, ... }:

{
  imports =
    [ # Include the results of the hardware scan. And the shared configuration.
      ./nika-hardware-configuration.nix
      ./configuration.nix
    ];

  #Power Button
  services.logind.settings.Login.HandlePowerKey = "poweroff";

  networking.hostName = "Nika"; # Define your hostname.
  networking.wireless.enable = true;  # Enables wireless support via wpa_supplicant.

  # Enable touchpad support (enabled default in most desktopManager).
  services.libinput.enable = true;

  environment.systemPackages = with pkgs; [
    brightnessctl
  ];

}
