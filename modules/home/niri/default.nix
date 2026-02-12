{
  config,
  ...
}:

{
  home = {
    # manual niri config
    file."${config.xdg.configHome}/niri/config.kdl".source = ./niri.kdl;
  };

  # dark theme
  dconf.settings = {
    "org/gnome/desktop/interface" = {
      color-scheme = "prefer-dark";
    };
  };
}
