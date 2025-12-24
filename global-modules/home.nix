{
  pkgs,
  ...
}:
{
  home.username = "jay";
  home.homeDirectory = "/home/jay";

  programs = {
    bat = {
      enable = true;
    };
    neovim = {
      enable = true;
      defaultEditor = true;
      viAlias = true;
      vimAlias = true;
      extraLuaConfig = ''
        ${builtins.readFile ../programs/nvim/config/options.lua}
        ${builtins.readFile ../programs/nvim/config/keymaps.lua}
        ${builtins.readFile ../programs/nvim/config/autocmd.lua}
      '';
      # todo: use var for the whole builtins function
      plugins = with pkgs.vimPlugins; [
        nvim-treesitter.withAllGrammars
        supermaven-nvim
        which-key-nvim
        gitsigns-nvim
        {
          plugin = nvim-lint;
          type = "lua";
          config = "${builtins.readFile ../programs/nvim/plugins/linter.lua}";
        }
        {
          plugin = fzf-lua;
          type = "lua";
          config = "${builtins.readFile ../programs/nvim/plugins/fzf.lua}";
        }
        {
          plugin = mini-nvim;
          type = "lua";
          config = ''
            require("mini.pairs").setup()
            require("mini.icons").setup()
            require("mini.surround").setup()
          '';
        }
        {
          plugin = nvim-lspconfig;
          type = "lua";
          config = "${builtins.readFile ../programs/nvim/plugins/lsp.lua}";
        }
        {
          plugin = conform-nvim;
          type = "lua";
          config = "${builtins.readFile ../programs/nvim/plugins/formatter.lua}";
        }
      ];
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
        set -g renumber-windows on
        set -g popup-border-lines "rounded"

        bind '"' split-window -v -c "#{pane_current_path}"
        bind % split-window -h -c "#{pane_current_path}"
        bind c new-window -c "#{pane_current_path}"

        bind r source-file "$HOME/.config/tmux/tmux.conf" \; display-message "Config reloaded..."

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

  # enable theming
  qt.enable = true;
  gtk.enable = true;

  # don't change this
  home.stateVersion = "25.11";
}
