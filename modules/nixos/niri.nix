{ pkgs, ... }:
{
  programs = {
    niri.enable = true;
  };

  # enable extra xdg-portal-hyprland and gtk for file picker
  xdg.portal = {
    enable = true;
    extraPortals = with pkgs; [
      xdg-desktop-portal-gtk # implements most of the basic functionality, this is the "default fallback portal".
      xdg-desktop-portal-gnome # required for screencasting support
    ];
  };

  environment.loginShellInit = ''
    if [ -z "$DISPLAY" ] && [ "$(tty)" = "/dev/tty1" ]; then
        exec niri-session &>/dev/null
    fi   
  '';
}
