{
  nixpkgs,
  user,
  mango,
  nixvim,
  nixos,
  stylix,
  theme,
  compositor,
  home-manager,
  system,
  ...
}:
let
  commonArgs = {
    inherit
      user
      nixvim
      stylix
      nixos
      theme
      compositor
      mango
      ;
  };
in
nixpkgs.lib.nixosSystem {
  specialArgs = commonArgs;
  modules = [
    ../modules/hosts/nixos
    ../modules/nixos

    stylix.nixosModules.stylix
    home-manager.nixosModules.home-manager
    {
      home-manager = {
        useUserPackages = true;
        useGlobalPkgs = true;
        backupFileExtension = "backup";
        users.${user} = ../modules/home;
        extraSpecialArgs = commonArgs // {
          inherit system;
        };
      };
    }
  ];
}
