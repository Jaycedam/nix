{
  config,
  pkgs,
  ...
}:

{
  home = {
    # Symlink default wallpaper to user dir
    file."Pictures/wall/default.jpg".source = ../../../wall/default.jpg;

    # manual niri config
    file."${config.xdg.configHome}/niri/config.kdl".source = ./niri.kdl;

    packages = with pkgs; [
      niri
      xwayland-satellite # xwayland support
    ];
  };

  # dark theme
  dconf.settings = {
    "org/gnome/desktop/interface" = {
      color-scheme = "prefer-dark";
    };
  };
}
