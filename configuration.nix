{ config, pkgs, inputs, ... }:

{
  imports = [
    ./modules/boot.nix
    ./modules/bitwarden.nix
    ./modules/appimage.nix
    ./modules/bash.nix
    ./modules/yubikey.nix
  ];
  
  #Console keymap
  console.keyMap = "sv-latin1";

  #X11 Keymap
  services.xserver.xkb = {
    layout = "se";
    variant = "";
  };

  #Enable X11, Lightdm, Hyprland
  services.xserver.enable = true;
  services.xserver.displayManager.lightdm.enable = true;
  programs.hyprland.enable = true;

  #Auto-login
  services.displayManager.autoLogin.user = "andy";

  #Sound with pipewire
  services.pulseaudio.enable = false;
  security.rtkit.enable = true;
  services.pipewire = {
    enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;
  };

  users.users."andy" = {
    isNormalUser = true;
    description = "andy";
    extraGroups = [ "disk" "networkmanager" "wheel" "dialout" ];
    #Uses home manager istead
    packages = with pkgs; [ ];
  };

  #Move and split to two configs?
  home-manager = {
    users = {
     "andy" = import ./home.nix;
    };
  };

  #Fonts
  fonts.packages = with pkgs; [
    font-awesome
    font-awesome_7
    roboto
    nerd-fonts.arimo
  ];

  #Neovim Fick bara defaultEditor att fungera när jag hade den i config.nix istället för home.nix
  programs.neovim = {
    enable = true;
    defaultEditor = true;
  };

  #Programs to install.
  environment.systemPackages = with pkgs; [
    inputs.waybar.packages.${pkgs.stdenv.hostPlatform.system}.waybar
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
    #yubioath-flutter #Yubikey Manager
    galculator #Calculator
 #   waybar #Waybar
    vlc #VLC
    unzip #Unzip
#    bitwarden-desktop #Bitwarden
#    appimage-run #Needed to start the appimage programs

    thunar #Filemanager
    bat #cat replacement
    hyprpaper #Wallpaper
    hyprlauncher #Launcher
    hyprshot #Screenshot
    fastfetch #Fastfetch
    discord-canary #Discord
    dunst #Notifications
    libnotify #För notifications
    thunderbird #Mail
    nwg-clipman #Clipboard manager
    cliphist #Clipboard manager
    wl-clipboard #Clipboard manager alla 3 krävs
  ];


}
