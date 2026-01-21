{
  pkgs,
  ...
}:
{
  # programs that need extra config or system integration need to be enabled
  programs = {
    localsend.enable = true; # it's installed here to enable the firewall automatically
  };

  # regular pkg installation, without extra config needed
  environment.systemPackages = with pkgs; [
    # cli
    fwupd # upgrade firmware
    playerctl
    brightnessctl
    impala # wifi tui selector
    wl-clipboard
    libnotify
    ddcutil # ext monitor brightness
    wiremix
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

    # desktop apps
    pavucontrol
    proton-pass
    nautilus # needed by niri
    gimp
    libreoffice-fresh
    signal-desktop
    cryptomator
    ente-desktop
    # grayjay
    seahorse # gnome keyring manager
    transmission_4-gtk
    bitwarden-desktop
    spotube

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
  ];

}
