{ pkgs, ... }:

{
  environment.systemPackages = [
    (import ../../scripts/rofi/power-menu.nix { inherit pkgs; })
    (import ../../scripts/hypr/launch-or-focus.nix { inherit pkgs; })
    (import ../../scripts/system/brightness.nix { inherit pkgs; })
    (import ../../scripts/tmux/sessions.nix { inherit pkgs; })
  ];
}
