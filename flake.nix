{
  description = "Main flake configuration for NixOS";

  inputs = {
    nixpkgs.url = "nixpkgs/nixos-unstable";
    apple-silicon.url = "github:nix-community/nixos-apple-silicon";
    waybar.url = "github:Alexays/Waybar/456f78ecb1cf16e5397a29691e69fc2906843387";
    home-manager.url = "github:nix-community/home-manager";
    stylix.url = "github:nix-community/stylix";
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
    { nixpkgs, ... }@inputs:
    let
      inherit (nixpkgs) lib;

      user = "jay";
      systems = {
        linux-arm = "aarch64-linux";
        linux = "x86_64-linux";
      };
      theme = {
        # name for theme file to import in home/stylix/themes/
        name = "gruvbox-material-dark-hard";
        border-radius = 0;
        opacity = 1.0;
        blur = true;
      };

      commonArgs = {
        inherit inputs user theme;
        # you can override these per profile bellow
        system = systems.linux;
        desktop = true;
        # used to import the host config, needs to be set in profiles
        host = throw "host must be set in the current profile";
      };

      profiles = {
        desktop.host = "desktop";
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
          args = commonArgs // overrides;
        in
        nixpkgs.lib.nixosSystem {
          specialArgs = args;
          modules = [
            ./hosts/${args.host}
            ./nixos
          ];
        }
      ) profiles;

      homeConfigurations = lib.mapAttrs' (
        name: overrides:
        let
          args = commonArgs // overrides;
        in
        {
          name = "${user}@${name}";
          value = inputs.home-manager.lib.homeManagerConfiguration {
            pkgs = inputs.nixpkgs.legacyPackages.${args.system};
            modules = [ ./home ];
            extraSpecialArgs = {
              inherit (args)
                inputs
                user
                theme
                system
                host
                ;
            };
          };
        }
      ) profiles;
    };
}
