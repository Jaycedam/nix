{
  description = "Main flake";

  nixConfig = {
    extra-substituters = [
      "https://nix-community.cachix.org"
    ];
    extra-trusted-public-keys = [
      "nix-community.cachix.org-1:mB9FSh9qf2dCimDSUo8Zy7bkq5CX+/rkCWyvRCYg3Fs="
    ];
  };

  inputs = {
    nixpkgs.url = "nixpkgs/nixos-unstable";
    neovim-nightly-overlay.url = "github:nix-community/neovim-nightly-overlay";
  };

  outputs =
    { nixpkgs, neovim-nightly-overlay, ... }:
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
          specialArgs = { overlays = [ neovim-nightly-overlay.overlays.default ]; };
        };
      };
    };
}
