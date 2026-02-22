{
  nixpkgs,
  mango,
  noctalia,
  home-manager,
  user,
  nixvim,
  stylix,
  nixos,
  system,
  theme,
  ...
}:
home-manager.lib.homeManagerConfiguration {
  pkgs = nixpkgs.legacyPackages.${system};
  extraSpecialArgs = {
    inherit
      nixpkgs
      home-manager
      mango
      user
      nixvim
      stylix
      system
      noctalia
      nixos
      theme
      ;
  };
  modules = [
    { programs.home-manager.enable = true; }
    stylix.homeModules.stylix
    ../modules/home
    ../modules/home/standalone-conf.nix
  ];
}
