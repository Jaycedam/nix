{
  nixpkgs,
  user,
  nixvim,
  nixos,
  stylix,
  theme,
  ...
}:
nixpkgs.lib.nixosSystem {
  specialArgs = {
    inherit
      user
      nixvim
      nixos
      stylix
      theme
      ;
  };
  modules = [
    stylix.nixosModules.stylix
    ../modules/hosts/nixos
    ../modules/nixos
  ];
}
