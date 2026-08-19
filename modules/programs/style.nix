{pkgs, ...}: {
  fonts = {
    enableDefaultPackages = true;
    packages = with pkgs; [
      geist-font
      jetbrains-mono
      font-awesome
      nerd-fonts.symbols-only
    ];
  };

  environment.systemPackages = with pkgs; [
    adw-gtk3
    adwaita-icon-theme
    bibata-cursors
    kdePackages.breeze
    kdePackages.breeze-icons
    kdePackages.qt6ct
    libsForQt5.qt5ct
    papirus-icon-theme
  ];
}
