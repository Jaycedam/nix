{
  programs.swaylock = {
    enable = true;
    settings = {
      ignore-empty-password = true;
      indicator-idle-visible = true;
      indicator-radius = 100;
      show-failed-attempts = true;
      hide-keyboard-layout = true;
      daemonize = true;
    };
  };
}
