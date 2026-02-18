{
  pkgs,
  ...
}:
{
  home.packages = with pkgs; [
    # Compilers
    go
    gcc
    rustc

    # Package managers & build tools
    cargo
    bun
    nodejs_24

    # Linters
    clippy
    eslint
    shellcheck
    statix

    # Dev tools
    lazygit
    android-tools
  ];
}
