{ pkgs, ... }:
{
  extraPackages = with pkgs; [
    shellcheck # bashls loads it automatically
  ];

  lsp.servers = {
    html.enable = true;
    cssls.enable = true;
    ts_ls.enable = true;
    oxfmt.enable = true;
    oxlint.enable = true;
    astro.enable = true;
    tailwindcss.enable = true;
    lua_ls.enable = true;
    rust_analyzer.enable = true;
    bashls.enable = true;
    marksman.enable = true;
    taplo.enable = true;
    yamlls.enable = true;
    nixd.enable = true;
    statix.enable = true;
  };
}
