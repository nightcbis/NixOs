{ pkgs, ... }:

{
  programs.bash.promptInit = ''
    eval "$(starship init bash)"
    mygitupdate() {
      git commit -m "$1" flake.lock *nix dotfiles/* homemanager/* homemanager/modules/* modules/* && git push
    }
    fastfetch
  '';

  environment.shellAliases = {
    mynix-rebuild = "sudo nixos-rebuild switch --flake ~andy/NixOs";
    mynix-testbuild = "nixos-rebuild build --flake ~andy/NixOs";
    mynix-update-full = "nix flake update --flake ~andy/NixOs";
    mynix-update-nixpkgs = "nix flake update nixpkgs --flake ~andy/NixOs";
    mynix-garbage = "sudo nix-env --profile /nix/var/nix/profiles/system --delete-generations +5; sudo nix-collect-garbage -d; mynix-update";
    vim = "nvim";
    vi = "nvim";
    cat = "bat";
    clear = "clear; fastfetch";
  };

}
