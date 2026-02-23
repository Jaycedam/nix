{
  config,
  ...
}:

{
  home = {
    file."${config.xdg.configHome}/niri/config.kdl".source = ./niri.kdl;
  };
}
