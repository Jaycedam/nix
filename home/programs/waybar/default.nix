{
  inputs,
  pkgs,
  ...
}:
{
  imports = [
    ./style.nix
    ./modules.nix
  ];

  programs.waybar = {
    enable = true;
    package = inputs.waybar.packages.${pkgs.stdenv.hostPlatform.system}.default;
    systemd.enable = true;
    settings.mainBar = {
      layer = "top";
      position = "top";
      spacing = 15;
      height = 25;

      modules-left = [
        "niri/workspaces#main"
        "niri/workspaces#taskbar"
      ];
      modules-center = [
        "clock"
      ];
      modules-right = [
        "privacy"
        "tray"
        "idle_inhibitor"
        "power-profiles-daemon"
        "network"
        "bluetooth"
        "pulseaudio"
        "battery"
      ];
    };
  };
}
