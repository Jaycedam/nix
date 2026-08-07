{config, ...}: {
  programs = {
    kitty = {
      enable = true;
      enableGitIntegration = true;
      settings = {
        cursor_trail = 1;
        tab_bar_edge = "top";
        background_blur = 1;
      };
      quickAccessTerminalConfig = {
        background_opacity = config.stylix.opacity.terminal;
      };
      actionAliases = {
        launch_window = "launch --cwd current --type os-window";
        launch_overlay = "launch --cwd current --type overlay";
      };
      keybindings = {
        "kitty_mod+n" = "launch_window";
        "kitty_mod+g" = "launch_window --os-window-class git lazygit";
        "kitty_mod+a" = "launch_window --os-window-class opencode opencode";
      };
    };

    ghostty = {
      enable = true;
      settings = {
        mouse-hide-while-typing = "true";
      };
    };
  };
}
