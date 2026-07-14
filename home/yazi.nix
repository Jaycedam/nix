{ ... }: {
  programs.yazi = {
    enable = true;

    settings = {
      manager = {
        show_hidden = true;
      };
    };

    keymap = {
      mgr.prepend_keymap = [
        { on = "<Tab>"; run = [ "toggle" "arrow 1" ]; desc = "Toggle selection"; }
        { on = [ "g" "m" ]; run = "cd ~/Music"; desc = "Go to ~/Music"; }
        { on = [ "g" "p" ]; run = "cd ~/Pictures"; desc = "Go to ~/Pictures"; }
        { on = [ "g" "w" ]; run = "cd ~/Pictures/Wallpapers"; desc = "Go to wall directory"; }
        { on = "i"; run = "spot"; desc = "Info hovered file"; }
        { on = "o"; run = "create"; desc = "Create file"; }
        { on = [ "<Space>" "/" ]; run = "search --via=rg"; desc = "Grep (rg)"; }
        { on = [ "<Space>" "f" ]; run = "plugin fzf"; desc = "Find file/directory (fzf)"; }
        { on = [ "<Space>" "h" ]; run = "help"; desc = "Help"; }
        { on = [ "<Space>" "w" ]; run = "shell --orphan -- set-wallpaper %H"; desc = "Set wallpaper"; }
      ];
    };
  };
}
