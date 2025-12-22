{
  description = "Main flake";

  inputs = {
    nixpkgs.url = "nixpkgs/nixos-unstable";
  };

  outputs =
    { nixpkgs, ... }:
    let
      lib = nixpkgs.lib;
    in
    {
      nixosConfigurations = {
        nixos = lib.nixosSystem {
          system = "x86_64-linux";
          modules = [
            ./global/keyboard-layout.nix
            ./global/apps-services.nix
            ./global/locale.nix
            ./global/options.nix
            ./global/scripts.nix
            # host specific configuration
            ./hosts/nixos/default.nix
            ./hosts/nixos/hardware-configuration.nix
          ];
        };
      };
    };
}
