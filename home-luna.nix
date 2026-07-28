{ 
  config, pkgs, ... 
}:

{
  imports = [ ./home.nix ];

  home.file = {
    "/home/andy/.config/hypr/hyprland.lua".source = dotfiles/hyprland/hyprland.lua;
    "/home/andy/.config/hypr/hyprland-etc.lua".source = dotfiles/hyprland/hyprland-etc.lua;
    "/home/andy/.config/hypr/hyprland-autostart.lua".source = dotfiles/hyprland/hyprland-autostart-luna.lua;
    "/home/andy/.config/hypr/hyprland-input.lua".source = dotfiles/hyprland/hyprland-input-luna.lua;
    "/home/andy/.config/hypr/hyprland-monitors.lua".source = dotfiles/hyprland/hyprland-monitors-luna.lua;
    "/home/andy/.config/hypr/hyprland-workspace_rules-window_rules.lua".source = dotfiles/hyprland/hyprland-workspace_rules-window_rules-luna.lua;
  };
}
