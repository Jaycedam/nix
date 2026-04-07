{ pkgs, ... }:
{
  environment.systemPackages = [
    (import ./dmenu/dmenu-power.nix { inherit pkgs; })
    (import ./programs/chromium-focus-site.nix { inherit pkgs; })
    (import ./programs/launch-tui.nix { inherit pkgs; })
    (import ./programs/launch-webapp.nix { inherit pkgs; })
    (import ./system/brightness.nix { inherit pkgs; })
    (import ./system/volume.nix { inherit pkgs; })
    (import ./tmux/sessions.nix { inherit pkgs; })
  ];
}
