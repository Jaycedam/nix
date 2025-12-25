{ pkgs, ... }:
{
  programs.neovim = {
    enable = true;
    defaultEditor = true;
    viAlias = true;
    vimAlias = true;
    extraLuaConfig = ''
      ${builtins.readFile ./config/options.lua}
      ${builtins.readFile ./config/keymaps.lua}
      ${builtins.readFile ./config/autocmd.lua}
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
        config = "${builtins.readFile ./plugins/linter.lua}";
      }
      {
        plugin = fzf-lua;
        type = "lua";
        config = "${builtins.readFile ./plugins/fzf.lua}";
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
        config = "${builtins.readFile ./plugins/lsp.lua}";
      }
      {
        plugin = conform-nvim;
        type = "lua";
        config = "${builtins.readFile ./plugins/formatter.lua}";
      }
    ];
  };
}
