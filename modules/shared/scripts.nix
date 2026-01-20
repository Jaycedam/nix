{ pkgs, ... }:
{
  environment.systemPackages = [
    (import ../../scripts/tmux/sessions.nix { inherit pkgs; })
  ];
}
