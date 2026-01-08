{ ... }:
{
  plugins.lint = {
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
}
