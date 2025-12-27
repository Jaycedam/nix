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
        "ctrl+t>w" = "select_tab";
        "ctrl+t>x" = "close_tab";
        "ctrl+t>n>" = "next_tab";
        "ctrl+t>p" = "previous_tab";
        "ctrl+t>N>" = "move_tab_forward";
        "ctrl+t>P" = "move_tab_backward";
        "ctrl+t>comma" = "set_tab_title";
        "ctrl+t>c" = "new_tab_with_cwd";
        "ctrl+t>t" = "toggle_tab";

        ## windows (splits)
        "ctrl+t>s" = "new_window_with_cwd";

        ## actions
        "ctrl+t>[" = "show_scrollback";
        "ctrl+t>r" = "load_config_file";

        # custom lauch commands
        "ctrl+t>g" = "launch --cwd=current --type=tab 'lazygit'";
        "ctrl+t>a" = "launch --cwd=current --type=tab 'opencode'";
        "ctrl+t>b" = "launch 'gh browse > /dev/null'";
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
