# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).

{ config, pkgs, ... }:

{
  imports =
    [ # Include the results of the hardware scan. And the shared configuration.
      ./hardware-configuration-luna.nix
      ./configuration.nix
      ./modules/gaming.nix
      ./modules/apps/openrgb.nix
    ];

  networking.hostName = "Luna"; # Define your hostname.

  #Power Button
  services.logind.settings.Login.HandlePowerKey = "suspend";

  environment.systemPackages = with pkgs; [
    arduino-ide #Arduino
    gimp #Image editor
    plasticity #3D Program
    github-desktop #Desktop app for git.
    mqtt-explorer #MQTT
    prusa-slicer #Prusa Slicer
    lycheeslicer #SLA Slicer
  ];
}
