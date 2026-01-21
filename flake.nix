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

      homeConfigurations = {
        "${user}-niri" = home-manager.lib.homeManagerConfiguration {
          extraSpecialArgs = commonArgs // {
            compositor = "niri";
          };
          modules = [
            ./home/default.nix
          ]
          ++ (import ./home/compositor/default.nix) "niri";
        };

        "${user}-hyprland" = home-manager.lib.homeManagerConfiguration {
          extraSpecialArgs = commonArgs // {
            compositor = "hyprland";
          };
          modules = [
            ./home/default.nix
          ]
          ++ (import ./home/compositor/default.nix) "hyprland";
        };
      };
    };
}
