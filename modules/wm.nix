{ pkgs, ... }:

{
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

  environment.systemPackages = with pkgs; [
    inputs.waybar.packages.${pkgs.stdenv.hostPlatform.system}.waybar
    hyprpaper #Wallpaper
    hyprlauncher #Launcher
    hyprshot #Screenshot
    nwg-clipman #Clipboard manager
    cliphist #Clipboard manager
    wl-clipboard #Clipboard manager alla 3 krävs
    dunst #Notification
    libnotify #För notifications
  ];
 
}

