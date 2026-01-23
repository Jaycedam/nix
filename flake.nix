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

      # Define both systems for future use
      systems = {
        x86 = "x86_64-linux";
        arm-linux = "aarch64-linux";
      };

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
          specialArgs = commonArgs // {
            inherit user;
            compositor = "niri";
            asahi = false;
          };
          modules = [
            ./hosts/nixos/default.nix
            ./profiles/nixos.nix
          ];
        };
      };

      homeConfigurations = {
        "${user}-niri-arm" = home-manager.lib.homeManagerConfiguration {
          pkgs = nixpkgs.legacyPackages.${systems.arm-linux};
          extraSpecialArgs = commonArgs // {
            compositor = "niri";
            system = systems.arm-linux;
            asahi = true;
          };
          modules = import ./profiles/asahi.nix;
        };

      };
    };
}
