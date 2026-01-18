{
  description = "Main flake configuration for NixOS, nix-darwin, and home-manager";

  inputs = {
    nixpkgs.url = "nixpkgs/nixos-unstable";

    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    nixvim = {
      url = "github:nix-community/nixvim";
    };

    # Darwin specific inputs
    nix-darwin = {
      url = "github:nix-darwin/nix-darwin";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    nix-homebrew.url = "github:zhaofengli/nix-homebrew";
    homebrew-core = {
      url = "github:homebrew/homebrew-core";
      flake = false;
    };
    homebrew-cask = {
      url = "github:homebrew/homebrew-cask";
      flake = false;
    };
  };

  nixConfig = {
    extra-substituters = [
      "https://nix-community.cachix.org"
    ];
    extra-trusted-public-keys = [
      "nix-community.cachix.org-1:mB9FSh9qf2dCimDSUo8Zy7bkq5CX+/rkCWyvRCYg3Fs="
    ];
  };

  outputs =
    {
      nixpkgs,
      home-manager,
      nixvim,
      nix-darwin,
      nix-homebrew,
      homebrew-core,
      homebrew-cask,
      ...
    }:
    let
      inherit (nixpkgs) lib;
      user = "jay";

      commonArgs = {
        inherit
          nixpkgs
          home-manager
          user
          nixvim
          ;
      };
    in
    {
      nixosConfigurations = {
        nixos-niri = lib.nixosSystem {
          specialArgs = { inherit user; };
          modules = [
            ./hosts/nixos/default.nix
          ]
          ++ (import ./profiles/nixos.nix (commonArgs // { compositor = "niri"; }));
        };

        nixos-hyprland = lib.nixosSystem {
          specialArgs = { inherit user; };
          modules = [
            ./hosts/nixos/default.nix
          ]
          ++ (import ./profiles/nixos.nix (commonArgs // { compositor = "hyprland"; }));
        };
      };

      darwinConfigurations = {
        darwin = nix-darwin.lib.darwinSystem {
          specialArgs = { inherit user; };
          modules = import ./profiles/darwin.nix (
            commonArgs
            // {
              inherit
                nix-darwin
                nix-homebrew
                homebrew-core
                homebrew-cask
                ;
            }
          );
        };
      };
    };
}
