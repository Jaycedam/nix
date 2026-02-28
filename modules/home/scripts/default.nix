{ pkgs, compositor, ... }:
{
  home.packages = [
    (import ./dmenu/dmenu-power.nix { inherit pkgs; })
    (import ./programs/chromium-focus-site.nix { inherit pkgs; })
    (import ./programs/launch-tui.nix { inherit pkgs; })
    (import ./programs/nvim-projects.nix { inherit pkgs; })
    (import ./programs/launch-webapp.nix { inherit pkgs; })
    (import ./system/brightness.nix { inherit pkgs; })
    (import ./system/volume.nix { inherit pkgs; })
    (import ./system/nix-utils.nix { inherit pkgs; })
    (import ./tmux/sessions.nix { inherit pkgs; })
  ]
  ++ (
    if compositor == "niri" then
      [
        (import ./niri/launch-or-focus.nix { inherit pkgs; })
        (import ./niri/launch-or-focus-webapp.nix { inherit pkgs; })
      ]
    else
      [ ]
  );
}
