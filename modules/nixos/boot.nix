{ pkgs, lib, ... }:
{
  boot = {
    loader = {
      # Bootloader.
      systemd-boot.enable = true;
      efi.canTouchEfiVariables = true;
      # Hide the OS choice for bootloaders.
      # It's still possible to open the bootloader list by pressing any key
      # It will just not appear on screen unless a key is pressed
      timeout = 1;
    };

    # Use latest kernel.
    kernelPackages = pkgs.linuxPackages_latest;

    # silent boot with animation

    plymouth = {
      enable = true;
      theme = lib.mkForce "connect";
      themePackages = with pkgs; [
        # By default we would install all themes
        (adi1090x-plymouth-themes.override {
          selected_themes = [ "connect" ];
        })
      ];
    };

    # Enable "Silent boot"
    consoleLogLevel = 0;
    initrd.verbose = false;
    initrd.systemd.enable = true; # luks gui support
    kernelParams = [
      "quiet"
      "splash"
      "boot.shell_on_fail"
      "udev.log_priority=3"
      "rd.udev.log_level=3"
      "rd.systemd.show_status=false"
    ];
  };
}
