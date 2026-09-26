{
  description = "Home Manager configuration of nonakamotoya";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixpkgs-unstable";
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs =
    { nixpkgs, home-manager, ... }:
    let
      system = "aarch64-darwin";
      pkgs = import nixpkgs {
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
        extraSpecialArgs = { inherit username; };
      };
    in
    {
      homeConfigurations."nonakamotoya" = mkHome "nonakamotoya" [];
      homeConfigurations."aa549998" = mkHome "aa549998" [ ./home-manager/podman.nix ];
    };
}
