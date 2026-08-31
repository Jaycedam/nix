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

    eza = {
      enable = true;
      icons = "auto";
      extraOptions = ["--group-directories-first"];
    };

    fzf = let
      dirs = builtins.concatStringsSep "," [
        ".cache"
        ".icons"
        ".local"
        ".nix-profile"
        ".npm"
        ".codex"
        ".gemini"
        ".grok"
        ".copilot"
        ".gnupg"
        ".cargo"
      ];
    in {
      enable = true;
      defaultOptions = ["--walker-skip ${dirs}"];
      fileWidget.options = ["--preview 'bat -n {}'"];
    };
  };

  home.packages = with pkgs; [
    bluetui
    brightnessctl
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
