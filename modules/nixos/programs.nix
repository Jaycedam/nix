{
  pkgs,
  ...
}:
{
  # programs that need extra config or system integration need to be enabled
  programs = {
    localsend.enable = true; # it's installed here to enable the firewall automatically
  };

  # regular pkg installation, without extra config needed
  environment.systemPackages = with pkgs; [
    # cli
    fwupd # upgrade firmware
    playerctl
    brightnessctl
    impala # wifi tui selector
    wl-clipboard
    libnotify
    ddcutil # ext monitor brightness
    wiremix

    # desktop apps
    pavucontrol
    proton-pass # no darwin release yet
    nautilus # needed by niri
    gimp # no darwin release yet
    libreoffice-fresh
    signal-desktop
    cryptomator
    ente-desktop
    # grayjay
    seahorse # gnome keyring manager
  ];

}
