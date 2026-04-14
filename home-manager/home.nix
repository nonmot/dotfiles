{ config, pkgs, ... }:

{
  home.username = "nonakamotoya";
  home.homeDirectory = "/Users/nonakamotoya";

  home.stateVersion = "25.11"; # Please read the comment before changing.

  home.packages = [
  ];

  home.file = {
  };

  home.sessionVariables = {
  };

  programs.home-manager.enable = true;
}
