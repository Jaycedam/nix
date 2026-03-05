{
  lib,
  pkgs,
  compositor,
  ...
}:
let
  monitorCmd =
    {
      niri = "${pkgs.bash}/bin/bash -c \"${pkgs.niri}/bin/niri msg action power-off-monitors && ${pkgs.coreutils}/bin/sleep 1 && ${pkgs.niri}/bin/niri msg action power-on-monitors\"";
      mango = "${pkgs.bash}/bin/bash -c \"${pkgs.mangowc}/bin/mmsg -d disable_monitor && ${pkgs.coreutils}/bin/sleep 1 && ${pkgs.mangowc}/bin/mmsg -d enable_monitor\"";
      hyprland = "${pkgs.bash}/bin/bash -c \"${pkgs.hyprland}/bin/hyprctl dispatch dpms off && ${pkgs.coreutils}/bin/sleep 1 && ${pkgs.hyprland}/bin/hyprctl dispatch dpms on\"";
    }
    .${compositor} or null;
in
{
  imports = [
    ./hardware-configuration.nix
  ];

  boot.loader.efi.canTouchEfiVariables = lib.mkDefault false;

  hardware.bluetooth.enable = true;
  zramSwap.enable = true;
  swapDevices = [
    {
      device = "/var/lib/swapfile";
      size = 8 * 1024;
    }
  ];

  # ugly hack to fix lcd backlight driver not initializing on boot.
  # without this, the backlight control will only work after
  # turning off/on the display. eg: closing the lid
  systemd.services.asahi-dcp-init = lib.mkIf (monitorCmd != null) {
    description = "Reinitialize display for backlight";
    after = [ "graphical.target" ];
    wantedBy = [ "graphical.target" ];
    environment = {
      XDG_RUNTIME_DIR = "/run/user/1000";
    };
    serviceConfig = {
      Type = "oneshot";
      ExecStart = monitorCmd;
      RemainAfterExit = false;
    };
  };

  networking.hostName = "asahi";
  system.stateVersion = "25.05";
}
