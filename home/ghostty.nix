{ lib, asahi ? false, ... }: {
  programs.ghostty = {
    enable = true;
    package = lib.mkIf asahi null;
    systemd.enable = lib.mkIf asahi false;
    settings = {
      mouse-hide-while-typing = "true";
      background-blur = "true";
    };
  };
}
