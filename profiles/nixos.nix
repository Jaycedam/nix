{
  nixpkgs,
  user,
  nixvim,
  asahi,
  stylix,
  ...
}:
nixpkgs.lib.nixosSystem {
  specialArgs = {
    inherit
      user
      nixvim
      asahi
      stylix
      ;
  };
  modules = [
    stylix.nixosModules.stylix
    ../modules/hosts/nixos/default.nix
    ../modules/nixos/default.nix
  ];
}
