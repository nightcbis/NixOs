{ pkgs, ... }:

{
  #Fonts
  fonts.packages = with pkgs; [
    font-awesome
    font-awesome_7
    roboto
    nerd-fonts.arimo
  ];
}

