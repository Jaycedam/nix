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
      stylix,
      ...
    }:
    let
      user = "jay"; # used for home-manager config, default profile

      systems = {
        linux-arm = "aarch64-linux";
        linux = "x86_64-linux";
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
          systems
          theme
          ;
        asahi = false; # default is non asahi systems, override for asahi
      };

      hmArgs = commonArgs // {
        inherit home-manager;
      };

    in
    {
      nixosConfigurations = {
        nixos = import ./profiles/nixos.nix commonArgs;
      };

      homeConfigurations = {
        "${user}" = import ./profiles/mkHome.nix (
          hmArgs
          // {
            system = systems.linux;
          }
        );
        asahi = import ./profiles/mkHome.nix (
          hmArgs
          // {
            asahi = true;
            system = systems.linux-arm;
          }
        );
      };
    };
}
