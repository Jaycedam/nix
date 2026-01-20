{
  pkgs,
  ...
}:
{
  # programs that need extra config or system integration need to be enabled
  programs = {
    localsend.enable = true; # it's installed here to enable the firewall automatically
    steam = {
      enable = true;
      protontricks.enable = true;
      extraCompatPackages = with pkgs; [
        proton-ge-bin
      ];
    };
  };

  # regular pkg installation, without extra config needed
  environment.systemPackages = with pkgs; [
    # cli
    grim
    slurp
    fwupd # upgrade firmware
    playerctl
    brightnessctl
    impala # wifi tui selector
    wl-clipboard
    libnotify
    ddcutil # ext monitor brightness
    matugen
    wiremix

    # gaming
    lsfg-vk # lossless scaling on linux
    gamemode
    gamescope
    pcsx2
    dolphin-emu
    shadps4 # no darwin release yet
    heroic

    # desktop apps
    pavucontrol
    proton-pass # no darwin release yet
    nautilus # needed by niri
    adwaita-icon-theme
    gimp # no darwin release yet
    libreoffice-fresh
    signal-desktop
    cryptomator
    ente-desktop
    tuigreet
    # grayjay
    seahorse # gnome keyring manager
  ];

}
