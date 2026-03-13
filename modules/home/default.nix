{ user, config, ... }:
{
  imports = [
    ./programs
    ./services
    ./scripts
  ];

  home = {
    preferXdgDirectories = true;
    username = user;
    homeDirectory = "/home/${user}";
    # don't change this!
    stateVersion = "25.11";
  };

  fonts.fontconfig.enable = true;

  # autocreate user dirs
  xdg.userDirs = {
    enable = true;
    createDirectories = true;
    extraConfig = {
      WALLPAPERS = "${config.home.homeDirectory}/Pictures/Wallpapers";
    };
  };
}
