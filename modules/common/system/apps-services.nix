{ pkgs, ... }:
{
  # global system packages
  environment.systemPackages = with pkgs; [
    ### cli ###
    tree
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
    signal-desktop
    mpv
    cryptomator
    ente-desktop
    grayjay
    localsend

    ### browser ###
    brave

    ### gaming ###
    dolphin-emu
    gopher64
    heroic

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

  fonts.packages = with pkgs; [
    noto-fonts
    noto-fonts-cjk-sans
    noto-fonts-color-emoji
    liberation_ttf # replacements for the MS fonts: Times New Roman, Arial, and Courier New.
    font-awesome
    jetbrains-mono
  ];

  programs = {
    fish.enable = true;
    zoxide = {
      enable = true;
      enableFishIntegration = true;
    };
  };

}
