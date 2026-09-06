let
  mkKeymap = on: run: desc: { inherit on run desc; };
in
{
  programs.yazi = {
    enable = true;
    settings.mgr.show_hidden = true;

    keymap.mgr.prepend_keymap = [
      (mkKeymap "<Tab>" [ "toggle" "arrow 1" ] "Toggle selection")
      (mkKeymap [ "g" "m" ] "cd ~/Music" "Go to ~/Music")
      (mkKeymap [ "g" "p" ] "cd ~/Pictures" "Go to ~/Pictures")
      (mkKeymap [ "g" "w" ] "cd ~/Pictures/Wallpapers" "Go to wall directory")
      (mkKeymap "i" "spot" "Info hovered file")
      (mkKeymap "o" "create" "Create file")
      (mkKeymap [ "<Space>" "/" ] "search --via=rg" "Grep (rg)")
      (mkKeymap [ "<Space>" "f" ] "plugin fzf" "Find file/directory (fzf)")
      (mkKeymap [ "<Space>" "h" ] "help" "Help")
      (mkKeymap [ "<Space>" "w" ] "shell --orphan -- set-wallpaper %H" "Set wallpaper")
    ];
  };
}
