{ 
  config, pkgs, ... 
}:

{
  imports = [ ./home.nix ];

  home.file = {
    ".config/hypr/hyprland-autostart.lua".source = ./dotfiles/hyprland/nika/hyprland-autostart.lua;
    ".config/hypr/hyprland-input.lua".source = ./dotfiles/hyprland/nika/hyprland-input.lua;
    ".config/hypr/hyprland-monitors.lua".source = ./dotfiles/hyprland/nika/hyprland-monitors.lua;
    ".config/hypr/hyprland-workspace_rules-window_rules.lua".source = ./dotfiles/hyprland/nika/hyprland-workspace_rules-window_rules.lua;
  };
}
