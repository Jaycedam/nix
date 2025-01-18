{
  # enable = true;
  settings = {
    theme = "tokyonight_moon";
    #background = #111111;

    font-size = 14;
    mouse-hide-while-typing = "true";
    macos-titlebar-style = "tabs";
    window-save-state = "always";
    window-new-tab-position = "end";

    # change to "center" when this issue about the quick terminal size is closed https://github.com/ghostty-org/ghostty/issues/2384
    quick-terminal-position = "center";
    # quick-terminal-size = 80%,80%;

    # Keybinds
    # super+enter was originally fullscreen, but macOS has a native keybind for that "fn+f"
    keybind = "global:super+enter=toggle_quick_terminal";
  };
}
