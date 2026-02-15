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
      user = "jay";

      commonArgs = {
        inherit
          nixpkgs
          home-manager
          user
          nixvim
          stylix
          ;
        asahi = false;
      };

    in
    {
      nixosConfigurations = {
        nixos = import ./profiles/nixos.nix commonArgs;
      };

      homeConfigurations = {
        "asahi" = import ./profiles/asahi.nix commonArgs;
      };
    };
}
