{
  description = "Main flake configuration for NixOS";

  inputs = {
    nixpkgs.url = "nixpkgs/nixos-unstable";
    apple-silicon.url = "github:nix-community/nixos-apple-silicon";
    waybar.url = "github:Alexays/Waybar/456f78ecb1cf16e5397a29691e69fc2906843387";
    home-manager.url = "github:nix-community/home-manager";
    stylix.url = "github:nix-community/stylix";
    nixvim.url = "github:nix-community/nixvim";
    caveman = {
      url = "github:JuliusBrussee/caveman/v2.6.0";
      flake = false;
    };
  };

  nixConfig = {
    extra-substituters = [ "https://nix-community.cachix.org" ];
    extra-trusted-public-keys = [
      "nix-community.cachix.org-1:mB9FSh9qf2dCimDSUo8Zy7bkq5CX+/rkCWyvRCYg3Fs="
    ];
  };

  outputs =
    { nixpkgs, ... }@inputs:
    let
      user = "jay";
      commonArgs = { inherit inputs user; };

      systems = {
        linux-arm = "aarch64-linux";
        linux = "x86_64-linux";
      };
    in
    {
      nixosConfigurations = {
        desktop = nixpkgs.lib.nixosSystem {
          system = systems.linux;
          specialArgs = commonArgs;
          modules = [ ./hosts/desktop ];
        };
        asahi = nixpkgs.lib.nixosSystem {
          system = systems.linux-arm;
          specialArgs = commonArgs;
          modules = [ ./hosts/asahi ];
        };
      };

      homeConfigurations = {
        "${user}@desktop" = inputs.home-manager.lib.homeManagerConfiguration {
          pkgs = nixpkgs.legacyPackages.${systems.linux};
          extraSpecialArgs = commonArgs;
          modules = [ ./hosts/desktop/home.nix ];
        };
        "${user}@asahi" = inputs.home-manager.lib.homeManagerConfiguration {
          pkgs = nixpkgs.legacyPackages.${systems.linux-arm};
          extraSpecialArgs = commonArgs;
          modules = [ ./hosts/asahi/home.nix ];
        };
      };
    };
}
