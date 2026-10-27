{ 
  config, pkgs, ... 
}:

{
  imports = [ ./home.nix ];

  home.file = {
    ".config/hypr/hyprland.lua".source = ../dotfiles/hyprland/hyprland.lua;
    ".config/hypr/hyprland-etc.lua".source = ../dotfiles/hyprland/hyprland-etc.lua;
    ".config/hypr/hyprland-autostart.lua".source = ../dotfiles/hyprland/hyprland-autostart-nika.lua;
    ".config/hypr/hyprland-input.lua".source = ../dotfiles/hyprland/hyprland-input-nika.lua;
    ".config/hypr/hyprland-monitors.lua".source = ../dotfiles/hyprland/hyprland-monitors-nika.lua;
    ".config/hypr/hyprland-workspace_rules-window_rules.lua".source = ../dotfiles/hyprland/hyprland-workspace_rules-window_rules-nika.lua;
  };
}
