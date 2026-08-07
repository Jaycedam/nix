{config, ...}: {
  programs.fuzzel = {
    enable = true;
    settings = {
      main = {
        terminal = "kitty --app-id '{cmd}' -T '{cmd}' {cmd}";
        width = 60;
        lines = 20;
      };
      border = {
        width = 2;
        radius = 0;
        selection-radius = 0;
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
