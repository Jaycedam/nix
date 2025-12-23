{
  description = "NixOS configuration";

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
    home-manager.url = "github:nix-community/home-manager";
    home-manager.inputs.nixpkgs.follows = "nixpkgs";
  };

  outputs =
    {
      nixpkgs,
      neovim-nightly-overlay,
      home-manager,
      ...
    }:
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
            # home manager
            home-manager.nixosModules.home-manager
            {
              home-manager.useGlobalPkgs = true;
              home-manager.useUserPackages = true;
              home-manager.users.jay = ./home-manager/home.nix;
              home-manager.backupFileExtension = "backup";
            }

          ];
          specialArgs = {
            overlays = [ neovim-nightly-overlay.overlays.default ];
          };
        };
      };
    };
}
