{ pkgs, ... }:

{ 
  users.users."andy" = {
    isNormalUser = true;
    description = "andy";
    extraGroups = [ "disk" "networkmanager" "wheel" "dialout" ];
    #Uses home manager istead
    packages = with pkgs; [ ];
  };

  #Move and split to two configs?
  home-manager = {
    users = {
     "andy" = import ./home.nix;
    };
  };

}
