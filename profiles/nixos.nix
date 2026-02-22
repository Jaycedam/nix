{
  nixpkgs,
  user,
  mango,
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
      mango
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
