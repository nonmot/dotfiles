{ config, pkgs, username, ... }:

{
  home.username = username;
  home.homeDirectory = "/Users/${username}";

  home.stateVersion = "25.11"; # Please read the comment before changing.

  home.packages = with pkgs; [
    tree
    marp-cli
    pre-commit
    terraform
    gh
  ];

  home.file = {
    ".config/gh/config.yml".source = ./gh/config.yml;
    ".claude/settings.json".source = config.lib.file.mkOutOfStoreSymlink "${config.home.homeDirectory}/dotfiles/home-manager/claude/settings.json";
    ".claude/keybindings.json".source = config.lib.file.mkOutOfStoreSymlink "${config.home.homeDirectory}/dotfiles/home-manager/claude/keybindings.json";
  };

  xdg.configFile."starship.toml".source = ./starship/starship.toml;

  programs.home-manager.enable = true;

  programs.starship = {
    enable = true;
  };

  programs.tmux = {
    enable = true;
    extraConfig = builtins.readFile ../tmux.conf;
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

  programs.mise = {
    enable = true;
  };

  programs.btop = {
    enable = true;
  };
}
