{ pkgs, ... }:
{
  nixpkgs.hostPlatform = "aarch64-darwin";

  imports = [
    ./system.nix
  ];

  users.users.jay = {
    name = "jay";
    home = "/Users/jay";
    shell = pkgs.fish; # currently not working
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
