{ pkgs, ... }:
{
  programs.fish.enable = true;

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
    ffmpeg

    # desktop
    transmission_4-gtk
    bitwarden-desktop
    spotube
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
    # languages
    go

    # linters
    eslint
    shellcheck
    statix

    (import ../../scripts/tmux/sessions.nix { inherit pkgs; })
  ];
}
