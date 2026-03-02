{
  pkgs,
  user,
  ...
}:
{
  imports = [
    ./programs
    ./services
    ./scripts
    ../common/stylix.nix
  ];

  home = {
    preferXdgDirectories = true;
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
    # don't change this!
    stateVersion = "25.11";
  };

  fonts.fontconfig.enable = true;

  # autocreate user dirs
  xdg.userDirs.enable = true;
}
