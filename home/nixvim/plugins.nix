{ pkgs, ... }:
{
  blink-cmp.enable = true;
  supermaven.enable = true;
  which-key.enable = true;
  render-markdown.enable = true;
  colorizer.enable = true;
  flash.enable = true;
  mini-icons.enable = true;

  snacks = {
    enable = true;
    settings = {
      bigfile.enable = true;
      quickfile.enable = true;
      explorer.enable = true;
      git.enable = true;
      gitbrowse.enable = true;
      image.enable = true;
      indent.enable = true;
      input.enable = true;
      lazygit.enable = true;
      notifier.enable = true;
      picker.enable = true;
      scroll.enable = true;
    };
  };

  lsp = {
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

  conform-nvim = {
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

  lint = {
    enable = true;
    lint.linters_by_ft = {
      python = [
        "ruff"
      ];
      javascript = [
        "eslint"
      ];
      typescript = [
        "eslint"
      ];
      sh = [
        "shellcheck"
      ];
    };
  };

  treesitter = {
    enable = true;
    highlight.enable = true;
    indent.enable = true;
  };

}
