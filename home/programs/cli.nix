{pkgs, ...}: {
  programs = {
    home-manager.enable = true;
    fzf = {
      enable = true;
      fileWidget.options = [
        "--walker-skip"
        ".cache,.codeium,.codex,.gemini,.grok,.icons,.local,.nix-profile,.npm,.git,node_modules"
        "--preview"
        "'bat -n --color=always {}'"
      ];
      changeDirWidget.options = [
        "--walker-skip"
        ".cache,.codeium,.codex,.gemini,.grok,.icons,.local,.nix-profile,.npm,.git,node_modules"
      ];
    };
    zoxide.enable = true;
    bat.enable = true;
    btop.enable = true;
    eza.enable = true;
    fastfetch.enable = true;
    fd.enable = true;
    jq.enable = true;
    parallel.enable = true;
    ripgrep.enable = true;
    yt-dlp.enable = true;
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
