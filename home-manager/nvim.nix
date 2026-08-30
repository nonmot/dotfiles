{ pkgs, pkgs-nvim, ... }:

let
  # pkgs-nvim は flake.nix で固定した旧 nixpkgs。
  # 新しい nixpkgs の tree-sitter では 0.11.2 がビルドできないため。
  neovim-v11 = pkgs-nvim.neovim-unwrapped.overrideAttrs (_: {
    version = "0.11.2";
    src = pkgs-nvim.fetchFromGitHub {
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
