{ pkgs, ... }:
{
  fonts.packages = with pkgs; [
    noto-fonts
    noto-fonts-cjk-sans
    noto-fonts-color-emoji
    liberation_ttf # replacements for the MS fonts: Times New Roman, Arial, and Courier New.
    jetbrains-mono
    nerd-fonts.symbols-only
  ];

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
    mpv
    bitwarden-cli

    # desktop
    transmission_4
    bitwarden-desktop
    #ente-desktop #broken on darwin

    localsend
    # gaming
    # dolphin-emu # broken on darwin
    gopher64

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

    (import ../../scripts/tmux/sessions.nix { inherit pkgs; })
  ];

  programs.fish = {
    enable = true;
    interactiveShellInit = ''
      set fish_greeting ""
    '';
    shellAbbrs = {
      v = "nvim";
      n = "nvim";
      h = "hx";
      ll = "ls -lA";
    };
  };

  services.openssh.enable = true;

}
