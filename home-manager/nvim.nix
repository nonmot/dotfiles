{ pkgs, ... }:

let
  neovim-v11 = pkgs.neovim-unwrapped.overrideAttrs (_: {
    version = "0.11.2";
    src = pkgs.fetchFromGitHub {
      owner = "neovim";
      repo = "neovim";
      rev = "v0.11.2";
      hash = "sha256-sNunEdIFrSMqYaNg0hbrSXALRQXxFkdDOl/hhX1L1WA=";
    };
    doCheck = false;
  });
in

{
  programs.neovim = {
    enable = true;
    package = neovim-v11;
    defaultEditor = true;
    viAlias = true;
    vimAlias = true;
  };

  home.file.".config/nvim" = {
    source = ../nvim;
    recursive = true;
  };
}
