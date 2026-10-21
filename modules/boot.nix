{ pkgs, ...}:

{
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

}
