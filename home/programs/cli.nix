{pkgs, ...}: {
  programs = {
    home-manager.enable = true;
    zoxide.enable = true;
    bat.enable = true;
    btop.enable = true;
    fastfetch.enable = true;
    fd.enable = true;
    jq.enable = true;
    parallel.enable = true;
    ripgrep.enable = true;
    yt-dlp.enable = true;
    lazygit.enable = true;
    devenv.enable = true;
    gh.enable = true;
    fzf.enable = true;
    npm.enable = true;

    git = {
      enable = true;
      lfs.enable = true;
      settings = {
        pull.rebase = true;
        user = {
          name = "Jay";
          email = "45575946+jaycem-dev@users.noreply.github.com";
        };
      };
    };

    eza = {
      enable = true;
      icons = "auto";
      extraOptions = ["--group-directories-first"];
    };
  };

  home.packages = with pkgs; [
    bluetui
    brightnessctl
    android-tools
    ddcutil
    exfatprogs
    ffmpeg
    fwupd
    imagemagick
    impala
    libnotify
    tealdeer
    trash-cli
    unrar
    wiremix
    wl-clipboard
  ];
}
