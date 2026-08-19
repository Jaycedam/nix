{
  pkgs,
  inputs,
  ...
}: {
  programs.virt-manager.enable = true;

  environment.systemPackages = with pkgs; [
    anki
    dnsmasq # libvirt networking
    beets
    ente-auth
    ente-desktop
    freetube
    fuzzel
    gimp
    hypridle
    inputs.waybar.packages.${pkgs.stdenv.hostPlatform.system}.default
    jellyfin-desktop
    kitty
    foot
    ghostty
    kopuz
    libreoffice
    localsend
    lollypop
    mako
    moonlight-qt
    mpv
    nautilus
    nicotine-plus
    nirius
    pavucontrol
    proton-vpn
    seahorse
    signal-desktop
    supersonic-wayland
    swaybg
    swaylock
    transmission_4-gtk
    udiskie
    zed-editor
  ];
}
