{
  nixpkgs,
  home-manager,
  user,
  nixvim,
  asahi,
  stylix,
  ...
}:
nixpkgs.lib.nixosSystem {
  specialArgs = {
    inherit
      user
      nixvim
      home-manager
      asahi
      stylix
      ;
  };
  modules = [
    stylix.nixosModules.stylix
    ../modules/hosts/nixos/default.nix
    ../modules/nixos/default.nix
    home-manager.nixosModules.home-manager
    {
      home-manager = {
        useGlobalPkgs = true;
        useUserPackages = true;
        backupFileExtension = "backup";
        extraSpecialArgs = {
          inherit
            user
            nixvim
            asahi
            stylix
            ;
        };
        users.${user} = {
          imports = [
            ../modules/home/default.nix
          ];
        };
      };
    }
  ];
}
