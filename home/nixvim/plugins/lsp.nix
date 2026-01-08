{ pkgs, ... }:
{
  plugins.lsp = {
    enable = true;
    servers = {
      pyright = {
        enable = true;
        package = pkgs.pyright;
      };
      gopls = {
        enable = true;
        package = pkgs.gopls;
      };
      ts_ls = {
        enable = true;
        package = pkgs.typescript-language-server;
      };
      rust_analyzer = {
        enable = true;
        installCargo = true;
        installRustc = true;
        package = pkgs.rust-analyzer;
      };
      bashls = {
        enable = true;
        package = pkgs.bash-language-server;
      };
      astro = {
        enable = true;
        package = pkgs.astro-language-server;
      };
      html = {
        enable = true;
        package = pkgs.vscode-langservers-extracted;
      };
      tailwindcss = {
        enable = true;
        package = pkgs.tailwindcss-language-server;
      };
      cssls = {
        enable = true;
        package = pkgs.vscode-langservers-extracted;
      };
      marksman = {
        enable = true;
        package = pkgs.marksman;
      };
      lua_ls = {
        enable = true;
        package = pkgs.lua-language-server;
      };
      taplo = {
        enable = true;
        package = pkgs.taplo;
      };
      yamlls = {
        enable = true;
        package = pkgs.yaml-language-server;
      };
      nil_ls = {
        enable = true;
        package = pkgs.nil;
      };
    };
  };
}
