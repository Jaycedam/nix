{config, ...}: {
  programs.fuzzel = {
    enable = true;
    settings = {
      main = {
        terminal = "kitty --app-id '{cmd}' -T '{cmd}' {cmd}";
        width = 40;
        lines = 20;
        line-height = 20;
      };
      border = {
        width = 2;
        radius = config.userSettings.borderRadius;
        selection-radius = config.userSettings.borderRadius;
      };
    };
  };

  stylix.targets.fuzzel.fonts.override = {
    sansSerif = config.stylix.fonts.monospace;
    sizes.popups = config.stylix.fonts.sizes.terminal;
  };
}
