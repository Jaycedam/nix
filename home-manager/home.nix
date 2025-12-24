{ config, pkgs, ... }:

{
  home.username = "jay";
  home.homeDirectory = "/home/jay";

  programs = {
    bat = {
      enable = true;
    };
    btop = {
      enable = true;
    };
    fish = {
      enable = true;
      shellAbbrs = {
        v = "nvim";
        n = "nvim";
        h = "helix";
        ll = "ls -lA";
      };
    };
    fzf = {
      enable = true;
      enableFishIntegration = true;
    };
    tmux = {
      enable = true;
      prefix = "C-t";
      reverseSplit = true;
      baseIndex = 1;
      escapeTime = 0;
      focusEvents = true;
      historyLimit = 5000;
      keyMode = "vi";
      mouse = true;
      terminal = "screen-256color";
      extraConfig = ''
        # Set popup border style to "rounded"
        set -g popup-border-lines "rounded"

        # Open windows/panes on the same directory
        bind '"' split-window -v -c "#{pane_current_path}"
        bind % split-window -h -c "#{pane_current_path}"
        bind c new-window -c "#{pane_current_path}"

        # Reload config
        bind r source-file "$HOME/.config/tmux/tmux.conf" \; display-message "Config reloaded..."

        #------------------------ Popups --------------------------
        # Session manager
        bind k run-shell '~/.config/tmux/scripts/session.sh > /dev/null 2>&1 || true'
        # lazygit
        bind g display-popup -d "#{pane_current_path}" -w 90% -h 90% -E lazygit
        # ai
        bind a new-window -c "#{pane_current_path}" -n AI "opencode"
        # Open remote git repository on the Browser
        bind b run-shell "gh browse"
      '';
    };
    yazi = {
      enable = true;
      enableFishIntegration = true;
    };
    kitty = {
      enable = true;
      settings = {
        cursor_trail = 1;
      };
    };
    ghostty = {
      enable = true;
      settings = {
        mouse-hide-while-typing = "true";
      };
    };
    opencode.enable = true;
    rofi = {
      enable = true;
    };
  };

  services = {
    dunst = {
      enable = true;
      settings = {
        global = {
          width = "(200,300)";
          offset = "(30,50)";
          origin = "top-right";
          corner_radius = 5;
        };
      };
    };
  };

  # enable theming
  qt.enable = true;
  gtk.enable = true;

  # This value determines the Home Manager release that your
  # configuration is compatible with. This helps avoid breakage
  # when a new Home Manager release introduces backwards
  # incompatible changes.
  #
  # You can update Home Manager without changing this value. See
  # the Home Manager release notes for a list of state version
  # changes in each release.
  home.stateVersion = "25.11";
}
