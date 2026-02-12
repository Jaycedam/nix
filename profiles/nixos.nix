{
  nixpkgs,
  home-manager,
  user,
  nixvim,
  zen-browser,
  asahi,
  ...
}:
nixpkgs.lib.nixosSystem {
  specialArgs = {
    inherit user nixvim zen-browser home-manager asahi;
  };
  modules = [
    ../modules/hosts/nixos/default.nix
    ../modules/nixos/default.nix
    home-manager.nixosModules.home-manager
    {
      home-manager = {
        useGlobalPkgs = true;
        useUserPackages = true;
        backupFileExtension = "backup";
        extraSpecialArgs = {
          inherit user nixvim zen-browser asahi;
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
