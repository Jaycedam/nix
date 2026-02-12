_: {
  plugins.lint = {
    enable = true;
    lintersByFt = {
      python = [ "ruff" ];
      javascript = [ "eslint" ];
      typescript = [ "eslint" ];
      sh = [ "shellcheck" ];
      nix = [ "statix" ];
    };
  };
}
