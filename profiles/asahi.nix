{
  nixpkgs,
  home-manager,
  user,
  nixvim,
  zen-browser,
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
      zen-browser
      system
      ;
    asahi = true;
  };
  modules = [
    { programs.home-manager.enable = true; }
    ../modules/home/default.nix
    ../modules/home/standalone-conf.nix
  ];
}
