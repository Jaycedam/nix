{
  pkgs,
  ...
}:
{
  home.username = "jay";

  # large configs go to ./programs/
  # consider move them all?
  imports = [
    ./neovim/default.nix
    ./helix.nix
    ./tmux.nix
  ];

  programs = {
    git = {
      enable = true;
      settings = {
        user = {
          name = "Jaycedam";
          email = "45575946+Jaycedam@users.noreply.github.com";
        };
        credential.helper = "!${pkgs.gh}/bin/gh auth git-credential";
      };
    };
    bat = {
      enable = true;
    };
    btop.enable = true;
    fish = {
      enable = true;
      interactiveShellInit = ''
        set fish_greeting ""
      '';
      shellAbbrs = {
        v = "nvim";
        n = "nvim";
        h = "hx";
        ll = "ls -lA";
      };
    };
    fzf = {
      enable = true;
      enableFishIntegration = true;
    };
    yazi = {
      enable = true;
      enableFishIntegration = true;
    };
    kitty = {
      enable = true;
      enableGitIntegration = true;
      shellIntegration.enableFishIntegration = true;
      settings = {
        cursor_trail = 1;
      };
      keybindings = {
        # tmux like keybinds https://sw.kovidgoyal.net/kitty/actions/
        # possible future actions: open_url

        ## tabs
        "ctrl+b>w" = "select_tab";
        "ctrl+b>x" = "close_tab";
        "ctrl+b>n>" = "next_tab";
        "ctrl+b>p" = "previous_tab";
        "ctrl+b>N>" = "move_tab_forward";
        "ctrl+b>P" = "move_tab_backward";
        "ctrl+b>comma" = "set_tab_title";
        "ctrl+b>c" = "new_tab_with_cwd";
        "ctrl+b>t" = "toggle_tab";

        ## windows (splits)
        "ctrl+b>s" = "new_window_with_cwd";

        ## actions
        "ctrl+b>[" = "show_scrollback";
        "ctrl+b>r" = "load_config_file";

        # custom lauch commands
        "ctrl+b>g" = "launch --cwd=current --type=tab 'lazygit'";
      };
    };
    lazygit = {
      enable = true;
      enableFishIntegration = true;
    };
    ghostty = {
      enable = true;
      settings = {
        mouse-hide-while-typing = "true";
      };
    };
    opencode.enable = true;
  };

  # don't change this
  home.stateVersion = "25.11";
}
