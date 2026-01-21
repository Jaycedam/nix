{
  pkgs,
  user,
  ...
}:
{
  imports = [
    ./beets.nix
    ./mpd.nix
    ./rmpc.nix
    ./waybar/waybar.nix
    ./gtk-qt.nix
    ./hyprlock.nix
    ./hypridle.nix
    ./fuzzel.nix
    ./mako.nix
    ./desktop-entries.nix
    ./matugen/default.nix
    ./nixvim/default.nix
    ./tmux.nix
    ./kitty.nix
    ./yazi.nix
    ./anki.nix
    ./fish.nix
    ./git.nix
    ./fontconfig.nix
    ./ghostty.nix
  ];

  home.sessionVariables = {
    EDITOR = "nvim";
  };

  programs = {
    btop = {
      enable = true;
      settings = {
        color_theme = "matugen";
        theme_background = false;
      };
    };
    opencode = {
      enable = true;
      settings.theme = "system";
    };

    zoxide = {
      enable = true;
      enableFishIntegration = true;
    };

    bat = {
      enable = true;
    };

    fzf = {
      enable = true;
      enableFishIntegration = true;
    };

    lazygit = {
      enable = true;
      enableFishIntegration = true;
    };
  };

  services = {
    udiskie.enable = true;
    polkit-gnome.enable = true;
    swww.enable = true;
  };

  # autocreate user dirs
  xdg.userDirs.enable = true;

  # home-manager configuration
  home = {
    username = user;
    homeDirectory = "/home/${user}";
    pointerCursor = {
      enable = true;
      package = pkgs.bibata-cursors;
      name = "Bibata-Modern-Classic";
      size = 24;

      gtk.enable = true;
      x11 = {
        defaultCursor = "Bibata-Modern-Classic";
        enable = true;
      };
    };

    # don't change this
    stateVersion = "25.11";
  };
}
