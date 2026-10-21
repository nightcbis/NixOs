{ pkgs, ... }

{
  environment.systemPackages = with pkgs; [
    #Terminal stuff
    starship #mod for bash
    bat #cat 
    fastfetch #Fastfetch
    unzip #Unzip
    wget
    usbutils
    git
    playerctl #Play/Pause etc
    pavucontrol #Soundmixerplay
    blueman #Bluetooth
    bluez #Bluetooth
 


    #WM Stuff
    qview #Image viewer
    galculator #Calculator
    vlc #VLC
    thunar #Filemanager
    thunderbird #Mail
 
    #Browser
    inputs.zen-browser.packages.${pkgs.stdenv.hostPlatform.system}.twilight

    #Taskmanager Original
    inputs.tmog.packages.${pkgs.stdenv.hostPlatform.system}.default
  ];
}
