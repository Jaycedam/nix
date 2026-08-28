{
  imports = [../../home/default.nix];

  userSettings = {
    theme = {
      name = "gruvbox-dark-medium";
      # opacity = 0.95;
      # borderRadius = 10;
    };
  };

  # workaraound for asahi issues like brightness desync on boot
  wayland.windowManager.niri.settings._children = [
    {spawn-sh-at-startup = "niri msg action power-off-monitors && niri msg action power-on-monitors";}
  ];
}
