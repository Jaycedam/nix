{ pkgs, ... }:

{
  nix.settings = {
    experimental-features = [
      "nix-command"
      "flakes"
    ];
  };

  # Automatic garbage collection (generations)
  nix.gc.automatic = true;

  # Automatically run the nix store optimiser at a specific time.
  nix.optimise.automatic = true;

  nixpkgs.config.allowUnfree = true;

  # base16 automatic theming
  stylix = {
    enable = true;
    polarity = "dark";
    # https://tinted-theming.github.io/tinted-gallery/
    base16Scheme = "${pkgs.base16-schemes}/share/themes/rose-pine.yaml";
    fonts = {
      sizes = {
        applications = 12;
        desktop = 10;
        terminal = 14;
      };

      monospace = {
        package = pkgs.jetbrains-mono;
        name = "JetBrains Mono";
      };
    };
    opacity = {
      applications = 0.9;
      desktop = 0.9;
      popups = 0.9;
      terminal = 0.9;
    };
  };
}
