{ pkgs, ... }:
{
  qt = {
    enable = true;
    platformTheme.name = "qtct";

    qt5ctSettings = {
      Appearance = {
        color_scheme_path = "$HOME/.config/qt5ct/colors/matugen.conf";
        custom_palette = true;
        icon_theme = "candy-icons";
        style = "breeze-dark";
      };
    };

    qt6ctSettings = {
      Appearance = {
        color_scheme_path = "$HOME/.config/qt6ct/colors/matugen.conf";
        custom_palette = true;
        icon_theme = "candy-icons";
        style = "breeze-dark";
      };
    };
  };

  gtk = {
    enable = true;
    theme = {
      name = "adw-gtk3-dark";
      package = pkgs.adw-gtk3;
    };
    iconTheme = {
      package = pkgs.candy-icons;
      name = "candy-icons";
    };
    gtk3.extraCss = "@import 'colors.css';";
    gtk4.extraCss = "@import 'colors.css';";
  };

  home.packages = with pkgs; [
    adwaita-icon-theme
    kdePackages.breeze-icons
  ];
}
