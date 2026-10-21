{ pkgs, ... }:

{
  programs.kitty = {
    enable = true;
    settings = {
      dynamic_background_opacity = true;
      background_opacity = "0.5";
      background_blur = 5;
      confirm_os_window_close = 0;
    };
  };
} 
