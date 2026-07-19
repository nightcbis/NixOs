{ 
  config, pkgs, ... 
}:

{
  imports = [ ./home.nix ];

  home.packages = with pkgs; [
    lutris #Gaming
    protonup-qt #Proton version installer
    plasticity #3D Program
    prusa-slicer #Prusa Slicer
    wine #Gaming
    mangohud #Gaming
    gamemode #Gaming
    openrgb #OpenRGB
  ];

  home.file = {
    # # Building this configuration will create a copy of 'dotfiles/screenrc' in
    # # the Nix store. Activating the configuration will then make '~/.screenrc' a
    # # symlink to the Nix store copy.
    # ".screenrc".source = dotfiles/screenrc;

    "/home/andy/.config/hypr/hyprland.lua".source = dotfiles/hyprland/hyprland.lua;
    "/home/andy/.config/hypr/hyprland-etc.lua".source = dotfiles/hyprland/hyprland-etc.lua;
    "/home/andy/.config/hypr/hyprland-autostart.lua".source = dotfiles/hyprland/hyprland-autostart-luna.lua;
    "/home/andy/.config/hypr/hyprland-input.lua".source = dotfiles/hyprland/hyprland-input-luna.lua;
    "/home/andy/.config/hypr/hyprland-monitors.lua".source = dotfiles/hyprland/hyprland-monitors-luna.lua;
    "/home/andy/.config/hypr/hyprland-workspace_rules-window_rules.lua".source = dotfiles/hyprland/hyprland-workspace_rules-window_rules-luna.lua;

  };
}
