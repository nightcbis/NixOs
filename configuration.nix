{ config, pkgs, ... }:

{
  imports = [];
  
  system.stateVersion = "26.05"; #Do not fucking touch!

  hardware.bluetooth = {
    enable = true;
    powerOnBoot = true;
  };

  #We want flakes
  nix.settings.experimental-features = [ "nix-command" "flakes" ];

  #Unfree packages
  nixpkgs.config.allowUnfree = true;

  # Bootloader settings
  boot.loader = {
    systemd-boot.enable = true;
    efi.canTouchEfiVariables = true;
  };

  #Kernel settings
  boot.kernelPackages = pkgs.linuxPackages_latest;

  #Enable networking manager
  networking.networkmanager.enable = true;

  #Time zone / Locales
  time.timeZone = "Europe/Stockholm";
  i18n = {
    defaultLocale = "en_US.UTF-8";
    extraLocaleSettings = {
      LC_ADDRESS = "sv_SE.UTF-8";
      LC_IDENTIFICATION = "sv_SE.UTF-8";
      LC_MEASUREMENT = "sv_SE.UTF-8";
      LC_MONETARY = "sv_SE.UTF-8";
      LC_NAME = "sv_SE.UTF-8";
      LC_NUMERIC = "sv_SE.UTF-8";
      LC_PAPER = "sv_SE.UTF-8";
      LC_TELEPHONE = "sv_SE.UTF-8";
      LC_TIME = "sv_SE.UTF-8";
    };
  };

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
    extraGroups = [ "disk" "networkmanager" "wheel" ];
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

  #Passar på att lägga bash prompt här. Fungerar detta i home.nix istället?
  programs.bash.promptInit = ''
    eval "$(starship init bash)"
  '';

  #Programs to install.

  environment.systemPackages = with pkgs; [
    starship #mod for bash
    git
    tealdeer #Kanske ta bort? Fick som tips ifrån någon video
    xclip #Kanske ta bort? Fick som tips ifårn någon video
    killall 
    wget
    pavucontrol #Soundmixer
    playerctl #Play/Pause etc
    blueman #Bluetooth
    bluez #Bluetooth
    xdg-desktop-portal-cosmic #Discord screensharing etc
    qview #Image viewer
  ];

  environment.shellAliases = {
    nix-rebuild = "sudo nixos-rebuild switch --flake ~andy/NixOs";
    nix-testbuild = "nixos-rebuild build --flake ~andy/NixOs";
    vim = "nvim";
    vi = "nvim";
    cat = "bat";
    clear = "clear; fastfetch";
  };

}
