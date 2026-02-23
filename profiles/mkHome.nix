{
  nixpkgs,
  mango,
  home-manager,
  user,
  nixvim,
  stylix,
  nixos,
  system,
  theme,
  compositor,
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
      nixos
      theme
      compositor
      ;
  };
  modules = [
    { programs.home-manager.enable = true; }
    stylix.homeModules.stylix
    ../modules/home
    ../modules/home/standalone-conf.nix
  ];
}
