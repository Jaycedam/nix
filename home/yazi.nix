_: {
  programs.yazi = {
    enable = true;
    enableFishIntegration = true;
    # https://github.com/sxyazi/yazi/blob/shipped/yazi-config/preset/keymap-default.toml
    keymap = {
      mgr.prepend_keymap = [
        {
          on = [
            "g"
            "m"
          ];
          run = "cd ~/Music";
          desc = "Go to ~/Music";
        }
        {
          on = [
            "g"
            "p"
          ];
          run = "cd ~/Pictures";
          desc = "Go to ~/Pictures";
        }
        {
          on = [
            "<Space>"
            "w"
          ];
          run = "shell -- matugen image %H";
          desc = "Set wallpaper and theme";
        }
        # toggle
        {
          on = "<Tab>";
          run = [
            "toggle"
            "arrow 1"
          ];
          desc = "Toggle selection";
        }
        # spotting
        {
          on = "i";
          run = "spot";
          desc = "Info hovered file";
        }
        # operation
        {
          on = "o";
          run = "create";
          desc = "Create file";
        }
        {
          on = [
            "<Space>"
            "/"
          ];
          run = "search --via=rg";
          desc = "Grep (rg)";
        }
        {
          on = [
            "<Space>"
            "f"
          ];
          run = "plugin fzf";
          desc = "Find file/directory (fzf)";
        }
        {
          on = "z";
          run = "plugin zoxide";
          desc = "Jump to a directory (zoxide)";
        }
        {
          on = [
            "<Space>"
            "h"
          ];
          run = "help";
          desc = "Help";
        }

      ];
    };
  };

}
