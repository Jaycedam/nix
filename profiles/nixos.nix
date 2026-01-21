{
  nixpkgs,
  home-manager,
  user,
  nixvim,
  compositor,
  ...
}:

let
  homeCompositorModules = import ../home/compositor/default.nix { inherit compositor; };
  compositorModules = import ../modules/compositors/default.nix { inherit compositor; };
in
[
  ../modules/default.nix
]
++ compositorModules
++ [
  home-manager.nixosModules.home-manager
  {
    home-manager = {
      useGlobalPkgs = true;
      useUserPackages = true;
      backupFileExtension = "backup";
      extraSpecialArgs = {
        inherit
          user
          nixvim
          compositor
          ;
      };
      users.${user} = {
        imports = [
          ../home/default.nix
        ]
        ++ homeCompositorModules;
      };
    };
  }
]
