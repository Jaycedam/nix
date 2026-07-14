{ pkgs, ... }: let
  lua = builtins.readFile;
  concat = builtins.concatStringsSep "\n\n";
in {
  programs.neovim = {
    enable = true;
    viAlias = true;
    vimAlias = true;

    plugins = with pkgs.vimPlugins; [
      nvim-colorizer-lua
      nvim-web-devicons
      supermaven-nvim
      nvim-surround
      nvim-autopairs
      which-key-nvim
      gitsigns-nvim
      render-markdown-nvim
      nvim-treesitter
      nvim-lspconfig
      catppuccin-nvim
      fzf-lua
      flash-nvim
      oil-nvim
      neogit
      diffview-nvim
      blink-cmp
      friendly-snippets
      conform-nvim
    ];

    extraLuaConfig = concat [
      (lua ./config/options.lua)
      (lua ./config/keymaps.lua)
      (lua ./config/autocmd.lua)
      (lua ./config/statusline.lua)
      (lua ./config/terminal.lua)
      (lua ./plugins/treesitter.lua)
      (lua ./plugins/lsp.lua)
      (lua ./plugins/misc.lua)
      (lua ./plugins/theme.lua)
      (lua ./plugins/fzf.lua)
      (lua ./plugins/flash.lua)
      (lua ./plugins/oil.lua)
      (lua ./plugins/neogit.lua)
      (lua ./plugins/blink.lua)
      (lua ./plugins/conform.lua)
    ];
  };
}
