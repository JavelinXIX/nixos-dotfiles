# Edit this configuration file to define what should be installed on
# your system. Help is available in the configuration.nix(5) man page, on
# https://search.nixos.org/options and in the NixOS manual (`nixos-help`).

# NixOS-WSL specific options are documented on the NixOS-WSL repository:
# https://github.com/nix-community/NixOS-WSL

{ config, lib, pkgs, ... }:

{
	imports = [
		# include NixOS-WSL modules
		<nixos-wsl/modules>
	];

	wsl.enable = true;
	wsl.defaultUser = "tomoya-f";
	

		users.users.tomoya-f = {
		isNormalUser = true;
		extraGroups = ["wheel" "docker"];
		home = "/home/tomoya-f";
		shell = pkgs.zsh;
	};

	# enabled programs
	programs = {
		zsh = {
			enable = true;
		};
		neovim = {
			enable = true;
			defaultEditor = true;
			viAlias = true;
			vimAlias = true;
		};
		git = {
			enable = true;
		};
		tmux = {
			enable = true;
		};
        rustc = {
            enabled = true;
        };
        cargo = {
            enabled = true;
        };
	};

	# enabled system packages
	environment.systemPackages = with pkgs; [
		unzip
		p7zip
        gnumake
	];
 
	# Docker
	virtualisation.docker.enable = true;
    virtualisation.docker.rootless = {
	    enable = true;
	    setSocketVariable = true;
    };


	nix = {
		settings = {
			experimental-features = ["nix-command" "flakes"];
		};
	};

	system.stateVersion = "23.11"; # Did you read the comment?
}
