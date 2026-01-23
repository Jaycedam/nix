{ pkgs, ... }:
{
  home.packages = [
    (import ./scripts/dmenu/dmenu-power.nix { inherit pkgs; })
    (import ./scripts/hypr/launch-or-focus.nix { inherit pkgs; })
    (import ./scripts/system/brightness.nix { inherit pkgs; })
    (import ./scripts/system/volume.nix { inherit pkgs; })
    (import ./scripts/niri/launch-or-focus.nix { inherit pkgs; })
    (import ./scripts/programs/nvim-wrapper.nix { inherit pkgs; })
    (import ./scripts/system/launch-webapp.nix { inherit pkgs; })
    (import ./scripts/niri/launch-or-focus-webapp.nix { inherit pkgs; })
    (import ./scripts/tmux/sessions.nix { inherit pkgs; })
  ];
}
