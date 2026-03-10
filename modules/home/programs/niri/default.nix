{
  config,
  pkgs,
  lib,
  theme,
  ...
}:
{
  home = {
    file."${config.xdg.configHome}/niri/config.kdl".source = pkgs.writeText "config.kdl" (
      lib.replaceStrings
        [
          "__ACTIVE_COLOR__"
          "__INACTIVE_COLOR__"
          "__BORDER_RADIUS__"
        ]
        [
          config.lib.stylix.colors.base0D
          config.lib.stylix.colors.base03
          (builtins.toString theme.borderRadius)

        ]
        (builtins.readFile ./niri.kdl)
    );
  };

}
