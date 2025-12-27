{
  description = "Darwin configuration";

  inputs = {
    nixpkgs.url = "nixpkgs/nixos-25.11";
    home-manager = {
      url = "github:nix-community/home-manager/release-25.11";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    nix-darwin = {
      url = "github:nix-darwin/nix-darwin/nix-darwin-25.11";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    stylix = {
      url = "github:nix-community/stylix/release-25.11";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs =
    {
      home-manager,
      nix-darwin,
      stylix,
      ...
    }:
    {
      darwinConfigurations = {
        darwin = nix-darwin.lib.darwinSystem {
          nixpkgs.hostPlatform = "aarch64-darwin";
          modules = [
            ./configuration.nix
            # base16 global themes
            stylix.darwinModules.stylix
            # home manager
            home-manager.darwinModules.home-manager
            {
              home-manager.useGlobalPkgs = true;
              home-manager.useUserPackages = true;
              home-manager.backupFileExtension = "backup";
              home-manager.users.jay = {
                imports = [
                  ./home.nix
                ];
              };
            }

          ];
        };
      };
    };
}
