{
  pkgs,
  user,
  ...
}:
{
  imports = [
    ../home/beets.nix
    ../home/mpd.nix
    ../home/rmpc.nix
    ../home/waybar/waybar.nix
    ../home/gtk-qt.nix
    ../home/hyprlock.nix
    ../home/hypridle.nix
    ../home/fuzzel.nix
    ../home/mako.nix
    ../home/desktop-entries.nix
    ../home/matugen/default.nix
    ../home/nixvim/default.nix
    ../home/tmux.nix
    ../home/kitty.nix
    ../home/yazi.nix
    ../home/anki.nix
    ../home/fish.nix
    ../home/git.nix
    ../home/fontconfig.nix
    ../home/ghostty.nix
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
