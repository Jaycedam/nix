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
    apple-silicon = {
      url = "github:nix-community/nixos-apple-silicon";
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
      "https://nixos-apple-silicon.cachix.org"
    ];
    extra-trusted-public-keys = [
      "nix-community.cachix.org-1:mB9FSh9qf2dCimDSUo8Zy7bkq5CX+/rkCWyvRCYg3Fs="
      "nixos-apple-silicon.cachix.org-1:8psDu5SA5dAD7qA0zMy5UT292TxeEPzIz8VVEr2Js20="
    ];
  };

  outputs =
    { nixpkgs, ... }@inputs:
    let
      inherit (nixpkgs) lib;

      systems = {
        linux-arm = "aarch64-linux";
        linux = "x86_64-linux";
      };

      compositors = {
        niri = "niri";
        mango = "mango";
      };

      commonArgs = {
        inherit
          inputs
          ;
        # you can override these per profile bellow
        user = "jay";
        system = systems.linux;
        desktop = true;
        # used to import the host config, needs to be set in profiles
        host = throw "host must be set in the current profile";
        compositor = throw "compositor must be set in the current profile";
        theme = {
          # name of the theme file in ./modules/themes
          name = "matte-black";
          border-radius = 10;
          shadows = false;
        };

      };

      profiles = {
        desktop = {
          host = "desktop";
          compositor = compositors.niri;
        };
        desktop-mango = {
          host = "desktop";
          compositor = compositors.mango;
        };

        asahi = {
          host = "asahi";
          system = systems.linux-arm;
          desktop = false;
          compositor = compositors.niri;
        };
        asahi-mango = {
          host = "asahi";
          system = systems.linux-arm;
          desktop = false;
          compositor = compositors.mango;
        };

      };
    in
    {
      nixosConfigurations = lib.mapAttrs (
        name: overrides:
        let
          args = commonArgs // overrides;
          hostModule = ./hosts/${args.host};
        in
        nixpkgs.lib.nixosSystem {
          specialArgs = args;
          modules = [
            hostModule
            ./modules/nixos

            inputs.home-manager.nixosModules.home-manager
            {
              home-manager = {
                useGlobalPkgs = true;
                useUserPackages = true;
                backupFileExtension = "backup";
                users.${args.user} = ./modules/home;
                extraSpecialArgs = args // {
                  inherit (args) system;
                };
              };
            }
          ];
        }
      ) profiles;

    };
}
