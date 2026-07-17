{ pkgs, ... }:
{
  home.packages = [
    (import ./dmenu/dmenu-power.nix { inherit pkgs; })
    (import ./dmenu/dmenu-opencode.nix { inherit pkgs; })
    (import ./dmenu/dmenu-projects.nix { inherit pkgs; })
    (import ./programs/launch-or-focus.nix { inherit pkgs; })
    (import ./programs/chromium-focus-site.nix { inherit pkgs; })
    (import ./programs/neovim.nix { inherit pkgs; })
    (import ./system/brightness.nix { inherit pkgs; })
    (import ./system/volume.nix { inherit pkgs; })
    (import ./system/fix-audio.nix { inherit pkgs; })
    (import ./system/asahi-fixes.nix { inherit pkgs; })
    (import ./system/set-wallpaper.nix { inherit pkgs; })
    (import ./system/manpages.nix { inherit pkgs; })
    (import ./tmux/sessions.nix { inherit pkgs; })
  ];
}
