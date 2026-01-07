{ pkgs, user, ... }:
{
  nixpkgs.hostPlatform = "aarch64-darwin";

  imports = [
    ./system.nix
    ./homebrew.nix
  ];

  users.users.${user} = {
    name = user;
    home = "/Users/${user}";
    shell = pkgs.fish;
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
    localsend
  ];

  system.stateVersion = 6;
}
