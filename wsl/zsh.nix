 {pkgs, ...}: {
   programs.zsh = {
    enable = true;
    shellAliases = {
      ll = "ls -l";
      flake-update = "sudo nixos-rebuild switch --flake ~/.dotfiles/flake.nix#nixos --impure";
      homemanager-update = "nix run home-manager -- switch --flake .#home"
    };
    oh-my-zsh = {
      enable = true;
      plugins = [ "git"];
      theme = "bira";
    };
  };
}
