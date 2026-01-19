{
  pkgs,
  user,
  ...
}:
{
  imports = [
    ../../home/beets.nix
    ../../home/mpd.nix
    ../../home/rmpc.nix
    ../../home/waybar/waybar.nix
    ../../home/hyprlock.nix
    ../../home/hypridle.nix
    ../../home/fuzzel.nix
    ../../home/dunst.nix
    ../../home/mako.nix
    ../../home/swaync.nix
    ../../home/desktop-entries.nix
    ../../home/matugen/default.nix
  ];

  services = {
    udiskie.enable = true;
    polkit-gnome.enable = true;

    swww.enable = true;
  };

  # enable theming
  qt.enable = true;
  gtk = {
    enable = true;
    theme = {
      name = "adw-gtk3-dark";
      package = pkgs.adw-gtk3;
    };
    iconTheme = {
      package = pkgs.candy-icons;
      name = "candy-icons";
    };
    gtk3.extraCss = "@import 'colors.css';";
    gtk4.extraCss = "@import 'colors.css';";
  };

  # autocreate user dirs

  xdg.userDirs.enable = true;

  # home-manager configuration
  home = {
    username = user;
    homeDirectory = "/home/${user}";
    pointerCursor = {
      enable = true;
      package = pkgs.bibata-cursors;
      name = "Bibata-Modern-Classic";
      size = 24;

      gtk.enable = true;
      x11 = {
        defaultCursor = "Bibata-Modern-Classic";
        enable = true;
      };
    };

    # don't change this
    stateVersion = "25.11";
  };
}
