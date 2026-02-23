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
nixpkgs.lib.nixosSystem {
  specialArgs = {
    inherit
      user
      nixvim
      nixos
      mango
      stylix
      theme
      compositor
      ;
  };
  modules = [
    ../modules/hosts/nixos
    ../modules/nixos

    stylix.nixosModules.stylix
    home-manager.nixosModules.home-manager
    {
      home-manager = {
        useUserPackages = true;
        useGlobalPkgs = true;
        users.${user} = ../modules/home;
        extraSpecialArgs = {
          inherit
            user
            nixvim
            stylix
            system
            nixos
            theme
            compositor
            mango
            ;
        };
      };
    }
  ];
}
