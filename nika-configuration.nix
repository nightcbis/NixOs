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


  networking.hostName = "Nika"; # Define your hostname.
  networking.wireless.enable = true;  # Enables wireless support via wpa_supplicant.



  # Enable touchpad support (enabled default in most desktopManager).
  services.libinput.enable = true;

  #Steam
  #programs.steam.enable = true;


  environment.shellAliases = {
    nix-rebuild = "sudo nixos-rebuild switch --flake ~andy/NixOs#Nika";
    nix-testbuild = "nixos-rebuild build --flake ~andy/NixOs#Nika";
  };

}
