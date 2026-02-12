_: {
  plugins.lsp = {
    enable = true;
    servers = {
      pyright = {
        enable = true;
      };
      gopls = {
        enable = true;
      };
      ts_ls = {
        enable = true;
      };
      rust_analyzer = {
        enable = true;
        installCargo = true;
        installRustc = true;
      };
      bashls = {
        enable = true;
      };
      astro = {
        enable = true;
      };
      html = {
        enable = true;
      };
      tailwindcss = {
        enable = true;
      };
      cssls = {
        enable = true;
      };
      marksman = {
        enable = true;
      };
      lua_ls = {
        enable = true;
      };
      taplo = {
        enable = true;
      };
      yamlls = {
        enable = true;
      };
      nil_ls = {
        enable = true;
      };
    };
  };
}
