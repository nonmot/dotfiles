{
  description = "Home Manager configuration of nonakamotoya";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixpkgs-unstable";
    # neovim 0.11.2 用に固定。新しい nixpkgs の tree-sitter は
    # ts_parser_timeout_micros を削除しており 0.11.2 がビルドできない。
    nixpkgs-nvim.url = "github:nixos/nixpkgs/b86751bc4085f48661017fa226dee99fab6c651b";
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs =
    { nixpkgs, nixpkgs-nvim, home-manager, ... }:
    let
      system = "aarch64-darwin";
      pkgs = import nixpkgs {
        inherit system;
        config.allowUnfree = true;
      };
      pkgs-nvim = import nixpkgs-nvim {
        inherit system;
        config.allowUnfree = true;
      };
      mkHome = username: extraModules: home-manager.lib.homeManagerConfiguration {
        inherit pkgs;
        modules = [
          ./home-manager/home.nix
          ./home-manager/nvim.nix
          ./home-manager/fish.nix
        ] ++ extraModules;
        extraSpecialArgs = { inherit username pkgs-nvim; };
      };
    in
    {
      homeConfigurations."nonakamotoya" = mkHome "nonakamotoya" [];
      homeConfigurations."aa549998" = mkHome "aa549998" [ ./home-manager/podman.nix ];
    };
}
