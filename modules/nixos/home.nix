{
  pkgs,
  user,
  ...
}:
{
  programs = {
    rofi = {
      enable = true;
      # todo= increase font and remove table cells
    };
    foot = {
      enable = true;
    };
  };

  services = {
    udiskie.enable = true;
    polkit-gnome.enable = true;
  };

  # enable theming
  qt.enable = true;
  gtk.enable = true;

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
