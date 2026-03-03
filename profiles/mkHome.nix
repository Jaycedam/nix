{
  nixpkgs,
  mangowc,
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
let
  pkgs = nixpkgs.legacyPackages.${system};
  commonArgs = {
    inherit
      nixpkgs
      home-manager
      mangowc
      user
      nixvim
      stylix
      system
      nixos
      theme
      compositor
      ;
  };
in
home-manager.lib.homeManagerConfiguration {
  inherit pkgs;
  extraSpecialArgs = commonArgs;
  modules = [
    stylix.homeModules.stylix
    ../modules/home

    # standalone hm config
    {
      programs.home-manager.enable = true;

      nixpkgs.config = {
        allowUnfree = true;
        allow32Bit = true;
      };

      # Configure nix for the user
      nix = {
        package = pkgs.nix;
        settings.trusted-users = [ user ];
      };

      # use system gpu drivers for gpu acceleration on non-NixOS
      targets.genericLinux.enable = true;
    }
  ];
}
