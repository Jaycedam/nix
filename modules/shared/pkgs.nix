{ pkgs, ... }:
{
  fonts.packages = with pkgs; [
    noto-fonts
    noto-fonts-cjk-sans
    noto-fonts-color-emoji
    liberation_ttf # replacements for the MS fonts: Times New Roman, Arial, and Courier New.
    jetbrains-mono
    font-awesome
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

    # linters
    eslint
    shellcheck

    (import ../../scripts/tmux/sessions.nix { inherit pkgs; })
  ];

  programs.fish.enable = true;

  services.openssh.enable = true;

}
