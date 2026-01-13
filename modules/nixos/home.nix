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
    ../../home/rofi.nix
    ../../home/dunst.nix
  ];

  services = {
    udiskie.enable = true;
    polkit-gnome.enable = true;

    hyprpaper = {
      enable = true;
      settings = {
        wallpaper = {
          monitor = "";
          path = "${../../wallpapers/1.jpg}";
        };
      };
    };
  };

  # enable theming
  qt.enable = true;
  gtk.enable = true;

  # autocreate user dirs

  xdg.userDirs.enable = true;

  # home-manager configuration
  home = {
    username = user;
    homeDirectory = "/home/${user}";
    pointerCursor = {
      enable = true;
      package = pkgs.bibata-cursors;
      name = "Bibata-Modern-Ice";
      size = 24;

      gtk.enable = true;
      x11 = {
        defaultCursor = "Bibata-Modern-Ice";
        enable = true;
      };
    };

    # don't change this
    stateVersion = "25.11";
  };
}
