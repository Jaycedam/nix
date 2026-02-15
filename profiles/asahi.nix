{
  nixpkgs,
  home-manager,
  user,
  nixvim,
  stylix,
  ...
}:
let
  system = "aarch64-linux";
in
home-manager.lib.homeManagerConfiguration {
  pkgs = nixpkgs.legacyPackages.${system};
  extraSpecialArgs = {
    inherit
      nixpkgs
      home-manager
      user
      nixvim
      stylix
      system
      ;
    asahi = true;
  };
  modules = [
    { programs.home-manager.enable = true; }
    stylix.homeModules.stylix
    ../modules/home/default.nix
    ../modules/home/standalone-conf.nix
  ];
}
