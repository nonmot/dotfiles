{ config, pkgs, ... }:

{
  home.username = "nonakamotoya";
  home.homeDirectory = "/Users/nonakamotoya";

  home.stateVersion = "25.11"; # Please read the comment before changing.

  home.packages = [
  ];

  home.file = {
    ".config/starship.toml".source = ./starship/starship.toml;
    ".tmux.conf".source = ../tmux.conf;
  };

  home.sessionVariables = {
  };

  programs.home-manager.enable = true;

  programs.starship = {
    enable = true;
  };

  programs.tmux = {
    enable = true;
  };
}
