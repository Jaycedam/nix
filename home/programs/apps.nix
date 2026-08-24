{pkgs, ...}: {
  programs = {
    anki.enable = true;
    freetube.enable = true;
    mpv.enable = true;
    zed-editor.enable = true;
  };

  home.packages = with pkgs; [
    ente-auth
    ente-desktop
    gimp
    proton-vpn
    jellyfin-desktop
    smassh
    kopuz
    libreoffice
    localsend
    lollypop
    moonlight-qt
    nautilus
    nicotine-plus
    nirius
    pavucontrol
    seahorse
    signal-desktop
    transmission_4-gtk

    # fonts
    font-awesome
    jetbrains-mono
    geist-font
    nerd-fonts.symbols-only
  ];
}
