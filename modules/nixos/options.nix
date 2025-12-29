{ pkgs, lib, ... }:
{
  # Bootloader.
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  # Use latest kernel.
  boot.kernelPackages = pkgs.linuxPackages_latest;

  # silent boot with animation
  boot = {
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
    # Hide the OS choice for bootloaders.
    # It's still possible to open the bootloader list by pressing any key
    # It will just not appear on screen unless a key is pressed
    loader.timeout = 1;
  };

  security.pam.services.login.kwallet = {
    enable = true;
    forceRun = true; # PAM module for KWallet will forcefully run even if no graphical session is detected
  };

  # Define a user account. Don't forget to set a password with ‘passwd’.
  users = {
    users.jay = {
      isNormalUser = true;
      description = "Jay";
      extraGroups = [
        "networkmanager"
        "wheel"
        "i2c" # allow ddcutil control
      ];
      shell = pkgs.fish;
      # packages = with pkgs; [ ];
    };
  };

  # Required for ddcutil to control ext monitor brightness
  hardware.i2c.enable = true;

  # Enable networking
  networking.wireless.iwd.enable = true;

  networking.networkmanager = {
    enable = true;
    wifi.backend = "iwd";
  };
}
