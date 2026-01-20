{
  config,
  ...
}:

{
  # Symlink default wallpaper to user dir
  home.file."Pictures/wall/default.jpg".source = ../../wall/default.jpg;

  # manual niri config
  home.file."${config.xdg.configHome}/niri/config.kdl".source = ./niri.kdl;
}
