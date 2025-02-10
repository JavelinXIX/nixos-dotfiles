{ config, pkgs, ... }:

{
  programs.neovim = {
    enable = true;
    plugins = with pkgs.vimPlugins; [
      nvim-tree-lua
      toggleterm-nvim
      nightfox-nvim
    ];
    extraConfig = ''
        "basic config
    	set number
        syntax on
        set number
        set expandtab
        set smartindent
        set shiftwidth=4
        set softtabstop=4
        set tabstop=4
        set cursorline
        set nowritebackup
        set nobackup
        set shell=zsh
        
        "pakage config
	packadd! nvim-tree.lua
	packadd! toggleterm.nvim
	packadd! nightfox.nvim
	lua require 'nvim-tree'.setup()
	lua require 'toggleterm'.setup()
	lua require 'nightfox'.setup()

        colorscheme nordfox
    '';
  };
}

