{
  description = "Main flake";

  inputs = {
    # use the following for unstable:
    nixpkgs.url = "nixpkgs/nixos-unstable";

    # or any branch you want:
    # nixpkgs.url = "nixpkgs/{BRANCH-NAME}";
  };

  outputs =
    { self, nixpkgs, ... }:
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
            # host specific configuration
            ./hosts/nixos/hardware-configuration.nix
            ./hosts/nixos/default.nix
          ];
        };
      };
    };
}
