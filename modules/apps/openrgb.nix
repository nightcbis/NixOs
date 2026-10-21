{ pkgs, ... }:

{
  services.hardware.openrgb.enable = true; #För att OpenRGB ska få root-behörigheter

  environment.systemPackages = with pkgs; [
    openrgb-with-all-plugins #OpenRGB
  ];
}
