{
  description = "Main flake configuration for NixOS, nix-darwin, and home-manager";

  inputs = {
    nixpkgs.url = "nixpkgs/nixos-unstable";

    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    stylix = {
      url = "github:nix-community/stylix";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    nixvim = {
      url = "github:nix-community/nixvim";
    };

    zen-browser = {
      url = "github:0xc000022070/zen-browser-flake";
      inputs.nixpkgs.follows = "nixpkgs";
      inputs.home-manager.follows = "home-manager";
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
      stylix,
      nixvim,
      nix-darwin,
      nix-homebrew,
      homebrew-core,
      homebrew-cask,
      zen-browser,
      ...
    }:
    let
      lib = nixpkgs.lib;
      user = "jay";
      nixosHyprlandProfile = import ./profiles/nixos-hyprland.nix {
        inherit
          nixpkgs
          home-manager
          stylix
          user
          nixvim
          zen-browser
          ;
      };
      nixosNiriProfile = import ./profiles/nixos-niri.nix {
        inherit
          nixpkgs
          home-manager
          stylix
          user
          nixvim
          zen-browser
          ;
      };
      darwinProfile = import ./profiles/darwin.nix {
        inherit
          nixpkgs
          home-manager
          stylix
          nix-darwin
          nix-homebrew
          homebrew-core
          homebrew-cask
          user
          nixvim
          zen-browser
          ;
      };
    in
    {
      nixosConfigurations = {
        nixos-hyprland = lib.nixosSystem {
          specialArgs = { inherit user; };
          # host module is hw specific so we add it outside the profile
          modules = [ ./hosts/nixos/default.nix ] ++ nixosHyprlandProfile;
        };

        nixos-niri = lib.nixosSystem {
          specialArgs = { inherit user; };
          # host module is hw specific so we add it outside the profile
          modules = [ ./hosts/nixos/default.nix ] ++ nixosNiriProfile;
        };
      };

      darwinConfigurations = {
        darwin = nix-darwin.lib.darwinSystem {
          specialArgs = { inherit user; };
          modules = [ ] ++ darwinProfile;
        };
      };
    };
}
