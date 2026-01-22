{
  nixpkgs,
  home-manager,
  user,
  nixvim,
  compositor,
  system,
  ...
}:

let
  homeCompositorModules = import ../home/compositor/default.nix { inherit compositor; };
in
[
  { programs.home-manager.enable = true; }
  ../home/default.nix
] ++ homeCompositorModules