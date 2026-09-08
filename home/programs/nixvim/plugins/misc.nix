let
  mkKeymap = (import ../lib/binds.nix).mkKeymap;
  mkRawKeymap = (import ../lib/binds.nix).mkRawKeymap;
in
{
  plugins = {
    lspconfig.enable = true;
    treesitter.enable = true;
    mini-diff.enable = true;
    mini-pairs.enable = true;
    mini-ai.enable = true;
    mini-statusline.enable = true;
    mini-surround.enable = true;
    neogit.enable = true;
    highlight-colors.enable = true;
    copilot-vim.enable = true;
    render-markdown.enable = true;

    mini-icons = {
      enable = true;
      mockDevIcons = true;
    };

    flash = {
      enable = true;
      settings.rainbox.enabled = true;
    };

    oil = {
      enable = true;
      settings.view_options.show_hidden = true;
    };

    which-key = {
      enable = true;
      settings = {
        preset = "helix";
        delay = 500;
      };
    };
  };

  keymaps = [
    (mkKeymap "n" "<leader>gg" "<cmd>Neogit<cr>" { desc = "Open Neogit"; })
    (mkKeymap "n" "<leader>e" "<cmd>Oil<cr>" { desc = "Open File Explorer"; })
    (mkRawKeymap [ "n" "x" "o" ] "gw" "function() require('flash').jump() end" { desc = "Go to word"; })
    (mkRawKeymap [ "n" "x" "o" ] "gW" "function() require('flash').treesitter() end" {
      desc = "Go to word (treesitter)";
    })
  ];
}
