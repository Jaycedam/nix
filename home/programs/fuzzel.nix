{
  config,
  theme,
  ...
}: {
  programs.fuzzel = {
    enable = true;
    settings = {
      main = {
        terminal = "kitty -1 --app-id '{cmd}' -T '{cmd}' {cmd}";
        width = 60;
        lines = 20;
      };
      border = {
        width = 2;
        radius = theme.border-radius;
        selection-radius = theme.border-radius;
      };
    };
  };

  stylix.targets.fuzzel.fonts.override = {
    sansSerif = config.stylix.fonts.monospace;
    sizes = {
      popups = config.stylix.fonts.sizes.terminal;
    };
  };
}
