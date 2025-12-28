{
  pkgs,
  ...
}:
{
  # home-manager configuration
  home = {
    username = "jay";
    homeDirectory = "/home/jay";
    pointerCursor = {
      enable = true;
      package = pkgs.bibata-cursors;
      name = "Bibata-Modern-Ice";
      size = 24;

      gtk.enable = true;
      x11 = {
        defaultCursor = "Bibata-Modern-Ice";
        enable = true;
      };
    };

    # don't change this
    stateVersion = "25.11";
  };

  # large configs go to separate files
  imports = [
    ./config/hyprland.nix
    ./config/waybar.nix
    ./config/hyprlock.nix
    ./config/hypridle.nix
    ./config/neovim/default.nix
    ./config/helix.nix
    ./config/tmux.nix
    ./config/kitty.nix
  ];

  services = {
    udiskie.enable = true;
    hyprpaper = {
      enable = true;
      settings = {
        preload = "${../wallpapers/1.jpg}";
        wallpaper = ", ${../wallpapers/1.jpg}";
      };
    };
    dunst = {
      enable = true;
      settings = {
        global = {
          width = "(200,300)";
          offset = "(10,10)";
          origin = "top-right";
          frame_width = 1;
          corner_radius = 5;
        };
      };
    };
  };

  # enable theming
  qt.enable = true;
  gtk.enable = true;

  programs = {
    rofi = {
      enable = true;
      # todo= increase font and remove table cells
    };

    git = {
      enable = true;
      settings = {
        user = {
          name = "Jaycedam";
          email = "45575946+Jaycedam@users.noreply.github.com";
        };
      };
    };
    gh = {
      enable = true;
      gitCredentialHelper.enable = true; # Defaults to github.com and gist.github.com
    };
    bat = {
      enable = true;
    };
    btop.enable = true;
    fish = {
      enable = true;
      interactiveShellInit = ''
        set fish_greeting ""
      '';
      shellAbbrs = {
        v = "nvim";
        n = "nvim";
        h = "hx";
        ll = "ls -lA";
      };
    };
    fzf = {
      enable = true;
      enableFishIntegration = true;
    };
    yazi = {
      enable = true;
      enableFishIntegration = true;
    };
    lazygit = {
      enable = true;
      enableFishIntegration = true;
    };
    ghostty = {
      enable = true;
      settings = {
        mouse-hide-while-typing = "true";
      };
    };
    opencode.enable = true;
  };

}
