{ pkgs, ... }:

{
  services.pcscd.enable = true;
  security.pam.services = {
    sudo.u2fAuth = true;
  };
  security.pam.yubico = {
    enable = true;
    #debug = true;
    mode = "challenge-response";
    id = [ "26691363" ];
  };

  environment.systemPackages = with pkgs; [
    yubioath-flutter
  ];
}
