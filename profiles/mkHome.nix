{
  nixpkgs,
  home-manager,
  user,
  nixvim,
  stylix,
  asahi,
  system,
  ...
}:
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
      asahi
      theme
      ;
  };
  modules = [
    { programs.home-manager.enable = true; }
    stylix.homeModules.stylix
    ../modules/home/default.nix
    ../modules/home/standalone-conf.nix
  ];
}
