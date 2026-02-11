{
  home-manager,
  user,
  nixvim,
  asahi,
  zen-browser,
  ...
}:
{
  imports = [
    ../modules/default.nix
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
            zen-browser
            ;
        };
        users.${user} = {
          imports = [
            ../home/default.nix
          ];
        };
      };
    }
  ];
}
