{
  lib,
  asahi ? false,
  ...
}:
{
  programs.swaylock = {
    enable = true;
    package = lib.mkIf asahi null;
    settings = {
      color = "#000000";
      font = "DejaVu Sans 12";
      ignore-empty-password = true;
      show-keyboard-layout = true;
      indicator-caps-lock = true;
      indicator-idle-visible = true;
    };
  };
}
