{
  inputs,
  theme,
  pkgs,
  ...
}:
{
  imports = [
    inputs.stylix.nixosModules.stylix
    ../themes/${theme.name}.nix
  ];

  # global stylix settings
  # the rest is set per theme
  stylix = {
    enable = true;

    opacity = {
      applications = 0.95;
      terminal = 0.95;
      popups = 0.95;
      desktop = 0.95;
    };

    cursor.size = 24;

    fonts = {
      serif = {
        package = pkgs.dejavu_fonts;
        name = "DejaVu Serif";
      };

      sansSerif = {
        package = pkgs.dejavu_fonts;
        name = "DejaVu Sans";
      };

      monospace = {
        package = pkgs.jetbrains-mono;
        name = "JetBrains Mono";
      };

      emoji = {
        package = pkgs.noto-fonts-color-emoji;
        name = "Noto Color Emoji";
      };
    };
  };
}
