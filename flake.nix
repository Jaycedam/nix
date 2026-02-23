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

    mango = {
      url = "github:DreamMaoMao/mango";
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
      mango,
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
          mango
          theme
          home-manager
          ;
        nixos = true;
        system = systems.linux;
      };

    in
    {
      nixosConfigurations = {
        nixos-niri = import ./profiles/nixos.nix (commonArgs // { compositor = "niri"; });
        nixos-mango = import ./profiles/nixos.nix (commonArgs // { compositor = "mango"; });
      };

      # home-manager standalone for non-NixOS systems
      # not needed on NixOS, home-manager is setup as a NixOS module
      homeConfigurations = {
        # x86_64 linux
        niri = import ./profiles/mkHome.nix (commonArgs // { compositor = "niri"; });
        mango = import ./profiles/mkHome.nix (commonArgs // { compositor = "mango"; });

        # asahi linux (arm64)
        asahi-niri = import ./profiles/mkHome.nix (
          commonArgs
          // {
            nixos = false;
            system = systems.linux-arm;
            compositor = "niri";
          }
        );
        asahi-mango = import ./profiles/mkHome.nix (
          commonArgs
          // {
            nixos = false;
            system = systems.linux-arm;
            compositor = "mango";
          }
        );
      };
    };
}
