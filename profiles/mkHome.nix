{
  pkgs,
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
let
  commonArgs = {
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
in
home-manager.lib.homeManagerConfiguration {
  pkgs = nixpkgs.legacyPackages.${system};
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
