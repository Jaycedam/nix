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
            nixos
            theme
            compositor
            mango
            ;
        };
      };
    }
    ../modules/hosts/nixos
    ../modules/nixos
  ];
}
