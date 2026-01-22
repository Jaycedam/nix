{ lib, asahi ? false, ... }: {
  programs.ghostty = {
    enable = true;
    package = lib.mkIf asahi null;
    settings = {
      mouse-hide-while-typing = "true";
      background-blur = "true";
    };
  };
}
