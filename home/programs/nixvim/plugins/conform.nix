{ pkgs, ... }: {
  plugins.conform-nvim = {
    enable = true;
    autoInstall = {
      enable = true;
      overrides = {
        nixfmt = pkgs.nixfmt;
        oxfmt = pkgs.oxfmt;
        stylua = pkgs.stylua;
      };
    };
    settings = {
      formatters_by_ft = {
        sh = [ "shfmt" ];
        lua = [ "stylua" ];
        javascript = [ "oxfmt" ];
        typescript = [ "oxfmt" ];
        javascriptreact = [ "oxfmt" ];
        typescriptreact = [ "oxfmt" ];
        json = [ "oxfmt" ];
        jsonc = [ "oxfmt" ];
        yaml = [ "oxfmt" ];
        toml = [ "oxfmt" ];
        html = [ "oxfmt" ];
        css = [ "oxfmt" ];
        scss = [ "oxfmt" ];
        markdown = [ "oxfmt" ];
        nix = [ "nixfmt" ];
      };
      format_on_save = {
        timeout_ms = 500;
        lsp_format = "fallback";
      };
    };
  };
}
