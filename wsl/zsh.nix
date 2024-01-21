 {pkgs, ...}: {
   programs.zsh = {
    enable = true;
    shellAliases = {
      ll = "ls -l";
      update = "sudo nixos-rebuild switch --flake ~/.dotfiles/flake.nix#nixos";
    };
    oh-my-zsh = {
      enable = true;
      plugins = [ "git"];
      theme = "bira";
    };
  };
}
