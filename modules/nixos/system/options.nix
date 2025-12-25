{ pkgs, ... }:
{
  # Bootloader.
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  # Use latest kernel.
  boot.kernelPackages = pkgs.linuxPackages_latest;

  # base16 automatic theming
  stylix = {
    enable = true;
    polarity = "dark";
    # https://tinted-theming.github.io/tinted-gallery/
    base16Scheme = "${pkgs.base16-schemes}/share/themes/rose-pine.yaml";
    fonts = {
      sizes = {
        applications = 12;
        desktop = 10;
        terminal = 14;
      };
    };
    opacity = {
      applications = 0.9;
      desktop = 0.9;
      popups = 0.9;
      terminal = 0.9;
    };
  };

  # Define a user account. Don't forget to set a password with ‘passwd’.
  users = {
    users.jay = {
      isNormalUser = true;
      description = "Jay";
      extraGroups = [
        "networkmanager"
        "wheel"
        "i2c" # required by ddcutil to control monitor brightness
      ];
      shell = pkgs.fish;
      # packages = with pkgs; [ ];
    };
  };

  hardware.i2c.enable = true;

  # Enable networking
  networking.wireless.iwd.enable = true;

  networking.networkmanager = {
    enable = true;
    wifi.backend = "iwd";
  };

}
