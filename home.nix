
{ config, pkgs, ... }:

{
  home.username = "haiminh256";
  home.homeDirectory = "/home/haiminh256";
  home.stateVersion = "25.05";

  programs.bash = {
    enable = true;
    shellAliases = {
      nrs = "sudo nixos-rebuild switch";
    };

    initExtra = ''
	export PS1='\[\e[1;32m\]\u@\h \[\e[1;34m\]\w\[\e[0m\] \$ '
    '';
  };

  home.packages = with pkgs; [
  ];
}
