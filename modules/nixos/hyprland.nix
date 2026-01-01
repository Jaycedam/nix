{ pkgs, ... }:
{
  programs = {
    hyprland = {
      enable = true;
      withUWSM = true;
      xwayland.enable = true;
    };

    # autostart hyprland on tty1 with uwsm
    fish.loginShellInit = ''
      # autostart hyprland on tty1 
      if status is-login
          if test -z "$DISPLAY" -a (tty) = "/dev/tty1"
            if uwsm check may-start >/dev/null
              exec uwsm start default >/dev/null
            end
          end
      end
    '';
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
