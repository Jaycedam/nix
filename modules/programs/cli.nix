{
  pkgs,
  user,
  ...
}: {
  programs = {
    fish.enable = true;

    nh = {
      enable = true;
      flake = "/home/${user}/Projects/nix-config";
      clean = {
        enable = true;
        extraArgs = "--keep 2";
      };
    };
  };

  environment.systemPackages = with pkgs; [
    awww
    bat
    bluetui
    brightnessctl
    btop
    ddcutil
    exfatprogs
    eza
    tinty
    fastfetch
    fd
    ffmpeg
    fwupd
    fzf
    imagemagick
    impala
    jq
    libnotify
    neovim
    parallel
    ripgrep
    stow
    tealdeer
    tmux
    trash-cli
    unrar
    wiremix
    wl-clipboard
    yazi
    yt-dlp
    zoxide
  ];
}
