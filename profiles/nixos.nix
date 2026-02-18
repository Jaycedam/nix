{
  nixpkgs,
  user,
  nixvim,
  asahi,
  stylix,
  theme,
  ...
}:
nixpkgs.lib.nixosSystem {
  specialArgs = {
    inherit
      user
      nixvim
      asahi
      stylix
      theme
      ;
  };
  modules = [
    stylix.nixosModules.stylix
    ../modules/hosts/nixos/default.nix
    ../modules/nixos/default.nix
  ];
}
