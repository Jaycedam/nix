{
  boot = {
    plymouth.enable = true; # boot animation
    initrd.systemd.enable = true; # luks gui support
    consoleLogLevel = 0; # silent boot
    initrd.verbose = false;
    kernelModules = [ "ntsync" ];

    loader = {
      systemd-boot.enable = true;
      efi.canTouchEfiVariables = true;
    };

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
