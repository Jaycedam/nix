{
  description = "Main flake configuration for NixOS";

  inputs = {
    nixpkgs.url = "nixpkgs/nixos-26.05";
    nixpkgs-unstable.url = "nixpkgs/nixos-unstable";
    apple-silicon.url = "github:nix-community/nixos-apple-silicon";
    waybar.url = "github:Alexays/Waybar/456f78ecb1cf16e5397a29691e69fc2906843387";
  };

  nixConfig = {
    extra-substituters = [
      "https://nix-community.cachix.org"
    ];
    extra-trusted-public-keys = [
      "nix-community.cachix.org-1:mB9FSh9qf2dCimDSUo8Zy7bkq5CX+/rkCWyvRCYg3Fs="
    ];
  };

  outputs = {nixpkgs, ...} @ inputs: let
    inherit (nixpkgs) lib;

    user = "jay";
    systems = {
      linux-arm = "aarch64-linux";
      linux = "x86_64-linux";
    };

    commonArgs = {
      inherit inputs user;
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
  in {
    nixosConfigurations =
      lib.mapAttrs (
        name: overrides: let
          baseArgs = commonArgs // overrides;
          args =
            baseArgs
            // {
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
              ./modules
              ./overlays
            ];
          }
      )
      profiles;
  };
}
