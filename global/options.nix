{ pkgs, ... }:
{
  # Define a user account. Don't forget to set a password with ‘passwd’.
  users.users.jay = {
    isNormalUser = true;
    description = "Jay";
    extraGroups = [
      "networkmanager"
      "wheel"
    ];
    shell = pkgs.fish;
    # packages = with pkgs; [ ];
  };

  # Enable networking
  networking.networkmanager = {
    enable = true;
    wifi.backend = "iwd";
  };

  nix.settings.experimental-features = [
    "nix-command"
    "flakes"
  ];

}
