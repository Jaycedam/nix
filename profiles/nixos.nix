{
  nixpkgs,
  user,
  mango,
  nixvim,
  nixos,
  stylix,
  theme,
  compositor,
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
    ../modules/hosts/nixos
    ../modules/nixos
  ];
}
