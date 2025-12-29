{ pkgs, ... }:
{
  nixpkgs.hostPlatform = "aarch64-darwin";

  users.users.jay = {
    name = "jay";
    home = "/Users/jay";
  };

  networking = {
    hostName = "mac";
    computerName = "mac";
    localHostName = "mac";
    # dns = [ "1.1.1.1" "1.0.0.1" ];
  };

  environment.systemPackages = with pkgs; [
    kanata
    karabiner-dk
    libreoffice-bin
    signal-desktop-bin
  ];

  system.stateVersion = 6;
}
