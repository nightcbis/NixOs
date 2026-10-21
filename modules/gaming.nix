{ config, pkgs, ... }:

{
  #Överklockning 
  hardware.amdgpu.overdrive.enable = true;
  services.lact.enable = true;

  #Ratten
  hardware.new-lg4ff.enable = true;
  services.udev.packages = with pkgs; [ oversteer ];

  #Steam
  programs.steam.enable = true;
  
  environment.systemPackages = with pkgs; [
    oversteer #Steering wheel
    gamescope #Gaming
    lutris #Gaming
    protonup-qt #Gaming
    wine #Gaming
    mangohud #Gaming
    gamemode #Gaming
    protontricks #Gaming
    lact #GPU Overclocking
  ];
}
