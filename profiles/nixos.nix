{
  home-manager,
  user,
  nixvim,
  compositor,
  asahi,
  ...
}:
{
  imports = [
    ../modules/default.nix
    ../modules/compositors/default.nix
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
            compositor
            asahi
            ;
        };
        users.${user} = {
          imports = [
            ../home/default.nix
            ../home/compositor/default.nix
          ];
        };
      };
    }
  ];
}
