{ ... }:
{
  # big configurations will be loaded from ./programs
  imports = [
    ./programs/hyprland.nix
    ./programs/waybar.nix
  ];
  programs = {
    rofi = {
      enable = true;
      # todo= increase font and remove table cells
    };
    hyprlock = {
      enable = true;
      settings = {
        general = {
          hide_cursor = true;
        };

        animations = {
          enabled = true;
          fade_in = {
            duration = 300;
            bezier = "easeOutQuint";
          };
          fade_out = {
            duration = 300;
            bezier = "easeOutQuint";
          };
        };
      };
    };
  };

  services = {
    udiskie.enable = true;
    hyprpaper = {
      enable = true;
      settings = {
        preload = "~/.config/wallpapers/wallpaper.jpg";
        wallpaper = ", ~/.config/wallpapers/wallpaper.jpg";

      };
    };
    dunst = {
      enable = true;
      settings = {
        global = {
          width = "(200,300)";
          offset = "(30,50)";
          origin = "top-right";
          corner_radius = 5;
        };
      };
    };
  };
}
