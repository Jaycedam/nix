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

  stylix = {
    enable = true;
    opacity = {
      applications = 0.9;
      terminal = 0.9;
      popups = 0.9;
      desktop = 0.9;
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
