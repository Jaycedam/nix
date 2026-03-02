_: {
  plugins.lint = {
    enable = true;
    lintersByFt = {
      python = [ "ruff" ];
      rust = [ "clippy" ];
      javascript = [ "eslint" ];
      typescript = [ "eslint" ];
      sh = [ "shellcheck" ];
      nix = [ "statix" ];
    };
  };
}
