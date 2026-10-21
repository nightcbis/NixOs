{ pkgs, ... }:

{
  #Neovim Fick bara defaultEditor att fungera när jag hade den i config.nix istället för home.nix
  programs.neovim = {
    enable = true;
    defaultEditor = true;
  };
}
