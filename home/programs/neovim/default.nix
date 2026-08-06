{pkgs, ...}: let
  lua = builtins.readFile;
in {
  programs.neovim = {
    enable = true;
    viAlias = true;
    vimAlias = true;
    plugins = with pkgs.vimPlugins; [
      blink-cmp
      conform-nvim
      copilot-vim
      flash-nvim
      friendly-snippets
      fzf-lua
      mini-diff
      mini-icons
      mini-pairs
      mini-surround
      neogit
      nvim-colorizer-lua
      nvim-lspconfig
      nvim-treesitter
      oil-nvim
      render-markdown-nvim
      which-key-nvim
    ];

    initLua = ''
      ${lua ./config/options.lua}
      ${lua ./config/keymaps.lua}
      ${lua ./config/autocmd.lua}
      ${lua ./config/statusline.lua}
      ${lua ./plugins/misc.lua}
      ${lua ./plugins/blink.lua}
      ${lua ./plugins/conform.lua}
      ${lua ./plugins/flash.lua}
      ${lua ./plugins/fzf.lua}
      ${lua ./plugins/lsp.lua}
      ${lua ./plugins/treesitter.lua}
    '';
  };
}
