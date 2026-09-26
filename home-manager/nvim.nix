{ pkgs, ... }:

{
  programs.neovim = {
    enable = true;
    package = pkgs.neovim-unwrapped;
    # Avoid wrapping Neovim with legacy remote-plugin hosts.
    withPython3 = false;
    withRuby = false;
    defaultEditor = true;
    viAlias = true;
    vimAlias = true;
  };

  home.file.".config/nvim" = {
    source = ../nvim;
    recursive = true;
  };
}
