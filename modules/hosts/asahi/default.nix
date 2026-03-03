_: {
  imports = [
    ./hardware-configuration.nix
  ];

  # Apple Silicon Asahi Linux specific configuration

  # Enable experimental GPU driver
  hardware.asahi.useExperimentalGPUDriver = true;
  hardware.asahi.experimentalGPUInstallMode = "replace";

  # Enable audio
  hardware.asahi.setupAsahiSound = true;

  # Boot configuration for MacBooks
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = false;

  # Networking - use iwd for WiFi
  networking.wireless.iwd = {
    enable = true;
    settings.General.EnableNetworkConfiguration = true;
  };
  networking.networkmanager = {
    enable = true;
    wifi.backend = "iwd";
  };

  # Enable bluetooth
  hardware.bluetooth.enable = true;
  services.blueman.enable = true;

  # Sound
  sound.enable = true;
  hardware.pulseaudio.enable = false;
  services.pipewire = {
    enable = true;
    pulse.enable = true;
  };

  networking.hostName = "asahi";

  system.stateVersion = "25.05";
}
