{
  description = "Main flake configuration for NixOS, and home-manager";

  inputs = {
    nixpkgs.url = "nixpkgs/nixos-unstable";
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    nixvim = {
      url = "github:nix-community/nixvim";
    };
    stylix = {
      url = "github:nix-community/stylix";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    mangowc = {
      url = "github:mangowm/mango";
      inputs.nixpkgs.follows = "nixpkgs";
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
      mangowc,
      home-manager,
      nixvim,
      stylix,
      ...
    }:
    let
      inherit (nixpkgs) lib;
      user = "jay"; # used for home-manager config, default profile

      systems = {
        linux-arm = "aarch64-linux";
        linux = "x86_64-linux";
      };

      compositors = {
        niri = "niri";
        mango = "mango";
        hypr = "hyprland";
      };

      theme = {
        borderRadius = 5;
      };

      commonArgs = {
        inherit
          nixpkgs
          user
          nixvim
          stylix
          mangowc
          theme
          home-manager
          ;
        nixos = true; # default nixos system
        system = systems.linux; # default x86_64-linux
      };

      homeCommonArgs = commonArgs // {
        nixos = false;
      };

      nixosVariants = {
        nixos-niri = {
          compositor = compositors.niri;
        };
        nixos-mango = {
          compositor = compositors.mango;
        };
        nixos-hypr = {
          compositor = compositors.hypr;
        };
      };

      homeVariants = {
        asahi-niri = {
          compositor = compositors.niri;
          system = systems.linux-arm;
        };
        asahi-mango = {
          compositor = compositors.mango;
          system = systems.linux-arm;
        };
        asahi-hypr = {
          compositor = compositors.hypr;
          system = systems.linux-arm;
        };
      };

    in
    {
      nixosConfigurations = lib.mapAttrs (
        name: overrides: import ./profiles/nixos.nix (commonArgs // overrides)
      ) nixosVariants;

      homeConfigurations = lib.mapAttrs (
        name: overrides: import ./profiles/mkHome.nix (homeCommonArgs // overrides)
      ) homeVariants;
    };
}
