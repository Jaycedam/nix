{ pkgs, ... }:
{
  environment.systemPackages = with pkgs; [
    ### cli ###
    pstree
    trash-cli
    tldr
    ripgrep
    yt-dlp
    fd
    jq
    imagemagick
    fastfetch

    # desktop
    transmission_4
    libreoffice-bin

    signal-desktop-bin
    mpv
    ente-desktop
    localsend

    ### browser ###
    brave

    ### dev ###
    # tools
    bun
    tree-sitter
    lazygit
    nodejs_24
    docker
    docker-compose
    android-tools
    gh
    # editors
    zed-editor
    # languages
    go

    # lsp
    nil # nix
    pyright
    vscode-langservers-extracted
    typescript-language-server
    rust-analyzer
    astro-language-server
    gopls
    bash-language-server
    marksman
    tailwindcss-language-server
    yaml-language-server
    lua-language-server
    taplo
    # formatters
    nixfmt
    prettier
    ruff
    djlint
    shfmt
    stylua
    black
    # linters
    eslint
    shellcheck

  ];

  services = {
    openssh.enable = true;
  };

  fonts.packages = with pkgs; [
    font-awesome
    jetbrains-mono
  ];

}
