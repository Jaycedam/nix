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
    apple-silicon = {
      url = "github:tpwrules/nixos-apple-silicon";
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
      user = "jay";

      systems = {
        linux-arm = "aarch64-linux";
        linux = "x86_64-linux";
      };

      compositors = {
        niri = "niri";
        mango = "mango";
      };

      theme = {
        borderRadius = 10;
      };

      commonArgs = {
        inherit
          inputs
          user
          theme
          ;
        # you can override these on the profiles
        compositor = compositors.mango;
        system = systems.linux;
        desktop = true;
        host = null; # used to import the host config, needs to be set in the profiles
      };

      profiles = {
        nixos-mango = {
          host = "nixos";
        };
        nixos-niri = {
          host = "nixos";
          compositor = compositors.niri;
        };

        asahi-mango = {
          host = "asahi";
          system = systems.linux-arm;
          desktop = false;
        };
        asahi-niri = {
          host = "asahi";
          system = systems.linux-arm;
          compositor = compositors.niri;
          desktop = false;
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

            inputs.stylix.nixosModules.stylix
            inputs.home-manager.nixosModules.home-manager
            inputs.apple-silicon.nixosModules.apple-silicon-support
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
