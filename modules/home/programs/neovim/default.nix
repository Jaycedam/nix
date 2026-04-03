{ pkgs, ... }:
{
  programs.neovim = {
    enable = true;
    defaultEditor = true;
    viAlias = true;
    vimAlias = true;
    vimdiffAlias = true;
    plugins = with pkgs.vimPlugins; [
      nvim-treesitter.withAllGrammars
      fzf-lua
      flash-nvim
      conform-nvim
      nvim-lspconfig
      nvim-web-devicons
      rose-pine
      which-key-nvim
      gitsigns-nvim
      nvim-lint
      supermaven-nvim
      oil-nvim
      nvim-surround
    ];

    initLua = ''
      ${builtins.readFile ./config.lua}
      ${builtins.readFile ./languages.lua}
      ${builtins.readFile ./plugins.lua}
    '';
  };
}
