{ pkgs, ... }: {
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
    nicotine-plus
    file-roller # archive manager used by thunar-archive-plugin
    pavucontrol
    seahorse
    signal-desktop
    transmission_4-gtk

    # file manager
    (thunar.override {
      thunarPlugins = with pkgs; [
        thunar-archive-plugin
        thunar-volman
      ];
    })

    # fonts
    font-awesome
    jetbrains-mono
    geist-font
    nerd-fonts.symbols-only
  ];
}
