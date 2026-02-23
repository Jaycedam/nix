{
  pkgs,
  nixos,
  ...
}:
{
  programs.swaylock = {
    enable = true;
    package = if nixos then pkgs.swaylock else null;
    settings = {
      ignore-empty-password = true;
      indicator-idle-visible = true;
      indicator-radius = 100;
      show-failed-attempts = true;
      show-keyboard-layout = true;
    };
  };
}
