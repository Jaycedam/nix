{ pkgs, ... }:
let
  lua = builtins.readFile;
in
{
  programs.neovim = {
    enable = true;
    viAlias = true;
    vimAlias = true;

    plugins = with pkgs.vimPlugins; [
      render-markdown-nvim
      diffview-nvim
      friendly-snippets
      {
        plugin = blink-cmp;
        config = lua ./plugins/blink.lua;
      }
      {
        plugin = conform-nvim;
        config = lua ./plugins/conform.lua;
      }
      {
        plugin = nvim-lspconfig;
        config = lua ./plugins/lsp.lua;
      }
      {
        plugin = fzf-lua;
        config = lua ./plugins/fzf.lua;
      }
      {
        plugin = flash-nvim;
        config = lua ./plugins/flash.lua;
      }
      {
        plugin = copilot-vim;
      }
      {
        plugin = pkgs.vimPlugins.nvim-treesitter;
        config = lua ./plugins/treesitter.lua;
      }
      {
        plugin = nvim-colorizer-lua;
        config = ''
          require("colorizer").setup()
        '';
      }
      {
        plugin = mini-surround;
        config = ''
          require("mini.surround").setup()
        '';
      }
      {
        plugin = mini-diff;
        config = ''
          require("mini.diff").setup()
        '';
      }
      {
        plugin = mini-pairs;
        config = ''
          require("mini.pairs").setup()
        '';
      }
      {
        plugin = which-key-nvim;
        config = ''
          require("which-key").setup({
          	preset = "helix",
          	delay = 500,
          })
        '';
      }
      {
        plugin = oil-nvim;
        config = ''
          require("oil").setup({
          	view_options = {
          		show_hidden = true,
          	},
          })
          vim.keymap.set("n", "<leader>e", "<CMD>Oil<CR>", { desc = "Open parent directory" })
        '';
      }
      {
        plugin = neogit;
        config = ''
          vim.keymap.set("n", "<leader>g", "<cmd>Neogit<cr>", { desc = "Open Neogit UI" })
        '';
      }
    ];

    initLua = ''
      ${lua ./config/options.lua}
      ${lua ./config/keymaps.lua}
      ${lua ./config/autocmd.lua}
      ${lua ./config/statusline.lua}
      ${lua ./config/terminal.lua}
      ${lua ./config/builtin.lua}
    '';
  };
  stylix.targets.neovim = {
    transparentBackground.main = true;
    transparentBackground.numberLine = true;
    transparentBackground.signColumn = true;
  };
}
