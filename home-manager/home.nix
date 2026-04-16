{ config, pkgs, ... }:

{
  home.username = "nonakamotoya";
  home.homeDirectory = "/Users/nonakamotoya";

  home.stateVersion = "25.11"; # Please read the comment before changing.

  home.packages = with pkgs; [
    tree
    marp-cli
    pre-commit
    terraform
    gh
  ];

  home.file = {
    ".config/starship.toml".source = ./starship/starship.toml;
    ".tmux.conf".source = ../tmux.conf;
    ".config/gh/config.yml".source = ./gh/config.yml;
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

  programs.fzf = {
    enable = true;
  };

  programs.zoxide = {
    enable = true;
  };

  programs.yazi = {
    enable = true;
  };

  programs.lazygit = {
    enable = true;
  };

  programs.gh = {
    enable = false;
  };

  programs.mise = {
    enable = true;
  };

  programs.btop = {
    enable = true;
  };
}
