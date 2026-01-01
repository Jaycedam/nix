{ pkgs, ... }:
{
  environment.systemPackages = with pkgs; [
    hyprpolkitagent
  ];

  programs = {
    hyprland = {
      enable = true;
      withUWSM = true;
      xwayland.enable = true;
    };
  };

  # enable extra xdg-portal-hyprland and gtk for file picker
  xdg.portal = {
    enable = true;
    extraPortals = with pkgs; [
      xdg-desktop-portal-hyprland
      xdg-desktop-portal-gtk
    ];
  };

}
