{
  description = "Main flake configuration for NixOS";

  inputs = {
    nixpkgs.url = "nixpkgs/nixos-26.05";
    nixpkgs-unstable.url = "nixpkgs/nixos-unstable";
    apple-silicon.url = "github:nix-community/nixos-apple-silicon";
    waybar.url = "github:Alexays/Waybar";
    home-manager.url = "github:nix-community/home-manager/release-26.05";
    stylix.url = "github:nix-community/stylix/release-26.05";
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
        theme = {
          border-radius = 5;
        };
      };

      profiles = {
        desktop = {
          host = "desktop";
        };

        asahi = {
          host = "asahi";
          system = systems.linux-arm;
          desktop = false;
        };
      };
    in
    {
      nixosConfigurations = lib.mapAttrs (
        name: overrides:
        let
          baseArgs = commonArgs // overrides;
          args = baseArgs // {
            pkgs-unstable = import inputs.nixpkgs-unstable {
              system = baseArgs.system;
              config.allowUnfree = true;
            };
          };
          hostModule = ./hosts/${args.host};
        in
        nixpkgs.lib.nixosSystem {
          specialArgs = args;
          modules = [
            hostModule
            ./nixos
            inputs.home-manager.nixosModules.home-manager
            {
              home-manager = {
                useGlobalPkgs = true;
                useUserPackages = true;
                backupFileExtension = "backup";
                users.${args.user} = ./home;
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
