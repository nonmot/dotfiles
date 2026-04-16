{ pkgs, ... }:

{
  programs.fish.enable = true;

  home.file.".config/fish/conf.d/config.fish".source = ../config.fish;
}
