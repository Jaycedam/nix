{
  config,
  ...
}:

{
  # Symlink default wallpaper to user dir
  home.file."Pictures/wallpapers/default.jpg".source = ../../wallpapers/default.jpg;

  # manual niri config
  home.file."${config.xdg.configHome}/niri/config.kdl".source = ./niri.kdl;
}
