{ pkgs, ... }:

{
  environment.systemPackages = [
    (import ../scripts/rofi/power-menu.nix { inherit pkgs; })
  ];
}
