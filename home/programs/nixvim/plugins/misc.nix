let
  mkKeymap = (import ../lib/binds.nix).mkKeymap;
  mkRawKeymap = (import ../lib/binds.nix).mkRawKeymap;
in
{
  plugins = {
    lspconfig.enable = true;
    treesitter.enable = true;
    treesitter-context.enable = true;
    mini-diff.enable = true;
    mini-icons.enable = true;
    mini-git.enable = true;
    mini-statusline.enable = true;
    mini-pairs.enable = true;
    mini-surround.enable = true;
    neogit.enable = true;
    highlight-colors.enable = true;
    copilot-lua.enable = true;

    flash = {
      enable = true;
      settings.rainbox.enabled = true;
    };

    oil = {
      enable = true;
      settings.view_options.show_hidden = false;
    };

    which-key = {
      enable = true;
      settings = {
        preset = " helix";
        delay = 500;
      };
    };
  };

  keymaps = [
    (mkKeymap "n" "<leader>g" "<cmd>Neogit<cr>" { desc = "Open Neogit"; })
    (mkKeymap "n" "<leader>e" "<cmd>Oil<cr>" { desc = "Open File Explorer"; })
    (mkRawKeymap "n" "gw" "function() require('flash').jump() end" { desc = "Go to word"; })
    (mkRawKeymap "n" "gW" "function() require('flash').treesitter() end" {
      desc = "Go to word (treesitter)";
    })
  ];
}
