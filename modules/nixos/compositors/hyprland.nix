{ pkgs, ... }:
{
  programs.hyprland.enable = true;

  # compositor tools
  environment.systemPackages = with pkgs; [
    # screenshot
    grim
    slurp
  ];

  # keyring
  services.gnome.gnome-keyring.enable = true;
}
