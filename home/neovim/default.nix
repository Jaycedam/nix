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
      gitsigns-nvim
      render-markdown-nvim
      diffview-nvim
      nvim-surround
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
        plugin = nvim-colorizer-lua;
        config = ''
          require("colorizer").setup()
        '';
      }
      {
        plugin = nvim-web-devicons;
        config = ''
          require("nvim-web-devicons").setup()
        '';
      }
      {
        plugin = supermaven-nvim;
        config = ''
          require("supermaven-nvim").setup({})
        '';
      }
      {
        plugin = nvim-autopairs;
        config = ''
          require("nvim-autopairs").setup({})
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
        plugin = pkgs.vimPlugins.nvim-treesitter.withAllGrammars;
        config = ''
          require("nvim-treesitter").setup({})
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
}
