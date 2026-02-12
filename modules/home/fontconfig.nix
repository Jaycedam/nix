{ pkgs, ... }:
{
  fonts.fontconfig = {
    enable = true;
    defaultFonts = {
      monospace = [ "JetBrains Mono" ];
      sansSerif = [ "DejaVu Sans" ];
      serif = [ "DejaVu Serif" ];
      emoji = [ "Noto Color Emoji" ];
    };
  };

  home.packages = with pkgs; [
    noto-fonts
    noto-fonts-cjk-sans
    noto-fonts-color-emoji
    liberation_ttf # replacements for the MS fonts: Times New Roman, Arial, and Courier New.
    dejavu_fonts
    jetbrains-mono
    font-awesome
  ];
}
