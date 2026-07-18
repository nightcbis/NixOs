{ config, pkgs, ... }:

{
  nixpkgs = {
    config = {
      allowUnfree = true;
    };
  };
  # Home Manager needs a bit of information about you and the paths it should
  # manage.
  home.username = "andy";
  home.homeDirectory = "/home/andy";

  # This value determines the Home Manager release that your configuration is
  # compatible with. This helps avoid breakage when a new Home Manager release
  # introduces backwards incompatible changes.
  #
  # You should not change this value, even if you update Home Manager. If you do
  # want to update the value, then make sure to first check the Home Manager
  # release notes.
  home.stateVersion = "26.05"; # Please read the comment before changing.

  #Cursor
  home.file.".icons/default".source = "${pkgs.vanilla-dmz}/share/icons/Vanilla-DMZ";

  #Show linenumbers in neovim
  programs.neovim.extraConfig = ''
    set number
    '';

  programs.kitty = {
    enable = true;
    settings = {
      dynamic_background_opacity = true;
      background_opacity = "0.5";
      background_blur = 5;
      confirm_os_window_close = 0;
    };
  };
  
  services.dunst = {
    enable = true;
    settings = {
      global = {
        monitor = 1;
	follow = "none";
	timeout = 5;
      };
      urgency_low = {
        background = "#33CCFF";
	frame_color = "#00FF99";
	foreground = "#000000";
	timeout = 5;
      };
      urgency_normal = {
        background = "#33CCFF";
	frame_color = "#00FF99";
	foreground = "#000000";
	timeout = 5;
      };
      urgency_critical = {
        background = "#33CCFF";
	frame_color = "#00FF99";
	foreground = "#000000";
	timeout = 5;
      };
    };
  };

  # The home.packages option allows you to install Nix packages into your
  # environment.
  home.packages = with pkgs; [
    # # Adds the 'hello' command to your environment. It prints a friendly
    # # "Hello, world!" when run.
    # pkgs.hello
    firefox #Browser
    waybar #Waybar
    thunar #File Manager
    bat #cat replacement
    hyprpaper #Wallpaper
    hyprlauncher #Launcher
    hyprshot #Screenshot
    plasticity #3D Program
    fastfetch
    discord-canary #Discord
    dunst #Notifications
    libnotify
    thunderbird #Mail
    nwg-clipman #Clipboard manager
    cliphist #Clipboard manager
    wl-clipboard #Clipboard manager
    lutris #Gaming
    protonup-qt #Proton handler

    # # It is sometimes useful to fine-tune packages, for example, by applying
    # # overrides. You can do that directly here, just don't forget the
    # # parentheses. Maybe you want to install Nerd Fonts with a limited number of
    # # fonts?
    # (pkgs.nerdfonts.override { fonts = [ "FantasqueSansMono" ]; })

    # # You can also create simple shell scripts directly inside your
    # # configuration. For example, this adds a command 'my-hello' to your
    # # environment:
    # (pkgs.writeShellScriptBin "my-hello" ''
    #   echo "Hello, ${config.home.username}!"
    # '')
  ];

  # Home Manager is pretty good at managing dotfiles. The primary way to manage
  # plain files is through 'home.file'.
  home.file = {
    # # Building this configuration will create a copy of 'dotfiles/screenrc' in
    # # the Nix store. Activating the configuration will then make '~/.screenrc' a
    # # symlink to the Nix store copy.
    # ".screenrc".source = dotfiles/screenrc;

    #"/home/andy/.config/hypr/hyprland.lua".source = dotfiles/hyprland/hyprland-luna.lua;
    #"/home/andy/.config/hypr/hyprland-autostart.lua".source = dotfiles/hyprland/hyprland-autostart-luna.lua;
    #"/home/andy/.config/hypr/hyprland-etc.lua".source = dotfiles/hyprland/hyprland-etc.lua;
    #"/home/andy/.config/hypr/hyprland-input.lua".source = dotfiles/hyprland/hyprland-input-luna.lua;
    #"/home/andy/.config/hypr/hyprland-monitors.lua".source = dotfiles/hyprland/hyprland-monitors-luna.lua;
    #"/home/andy/.config/hypr/hyprland-workspace_rules-window_rules.lua".source = dotfiles/hyprland/hyprland-workspace_rules-window_rules-luna.lua;


    #"/home/andy/.config/hypr/hyprland.lua".source = dotfiles/hyprland/hyprland.lua;
    "/home/andy/.config/hypr/hyprpaper.conf".source = dotfiles/hyprland/hyprpaper.conf;

    "/home/andy/.config/waybar/config".source = dotfiles/waybar/config;
    "/home/andy/.config/waybar/style.css".source = dotfiles/waybar/style.css;

    # # You can also set the file content immediately.
    # ".gradle/gradle.properties".text = ''
    #   org.gradle.console=verbose
    #   org.gradle.daemon.idletimeout=3600000
    # '';
  };

  # Home Manager can also manage your environment variables through
  # 'home.sessionVariables'. These will be explicitly sourced when using a
  # shell provided by Home Manager. If you don't want to manage your shell
  # through Home Manager then you have to manually source 'hm-session-vars.sh'
  # located at either
  #
  #  ~/.nix-profile/etc/profile.d/hm-session-vars.sh
  #
  # or
  #
  #  ~/.local/state/nix/profiles/profile/etc/profile.d/hm-session-vars.sh
  #
  # or
  #
  #  /etc/profiles/per-user/andy/etc/profile.d/hm-session-vars.sh
  #

  #home.sessionVariables = {
  #  EDITOR = "nvim";
  #};

  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;
  

}
