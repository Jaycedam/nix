_: {
  plugins.conform-nvim = {
    enable = true;
    autoInstall.enable = true;
    settings = {
      formatters_by_ft = {
        python = [ "ruff" ];
        htmldjango = [ "djlint" ];
        javascript = [ "prettier" ];
        astro = [ "prettier" ];
        typescript = [ "prettier" ];
        typescriptreact = [ "prettier" ];
        javascriptreact = [ "prettier" ];
        css = [ "prettier" ];
        scss = [ "prettier" ];
        html = [ "prettier" ];
        sh = [ "shfmt" ];
        zsh = [ "shfmt" ];
        nix = [ "nixfmt" ];
        markdown = [ "prettier" ];
        json = [ "prettier" ];
        jsonc = [ "prettier" ];
        lua = [ "stylua" ];
      };

      format_after_save = {
        lsp_format = "fallback";
      };
    };
  };
}
