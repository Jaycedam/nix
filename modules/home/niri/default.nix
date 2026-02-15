{
  config,
  ...
}:

{
  home = {
    # manual niri config
    file."${config.xdg.configHome}/niri/config.kdl".source = ./niri.kdl;
  };
}
