{
  config,
  ...
}:

{
  # manual niri config symlink, since we don't have a home-manager module for it
  home.file."${config.xdg.configHome}/niri/config.kdl".source = ./niri.kdl;
}
