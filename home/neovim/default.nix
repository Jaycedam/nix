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
      blink-cmp
      conform-nvim
      nvim-lspconfig
      fzf-lua
      flash-nvim
      copilot-vim
      nvim-treesitter
      fff-nvim
      nvim-colorizer-lua
      mini-surround
      mini-diff
      mini-pairs
      which-key-nvim
      neogit
      oil-nvim
    ];

    initLua = ''
      ${lua ./config/options.lua}
      ${lua ./config/keymaps.lua}
      ${lua ./config/autocmd.lua}
      ${lua ./config/statusline.lua}
      ${lua ./config/terminal.lua}
      ${lua ./plugins/misc.lua}
      ${lua ./plugins/blink.lua}
      ${lua ./plugins/conform.lua}
      ${lua ./plugins/fff.lua}
      ${lua ./plugins/flash.lua}
      ${lua ./plugins/fzf.lua}
      ${lua ./plugins/lsp.lua}
      ${lua ./plugins/treesitter.lua}
    '';
  };
}
