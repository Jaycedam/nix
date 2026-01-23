{
  pkgs,
  user,
  asahi,
  ...
}:
{
  imports = [
    ./beets.nix
    ./mpd.nix
    ./rmpc.nix
    ./waybar/waybar.nix
    ./programs.nix
    ./gtk-qt.nix
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
    ./services.nix
    ./scripts.nix
    ./chromium.nix
    ./gaming.nix
    ./hyprlock.nix
  ];

  home.sessionVariables = {
    EDITOR = "nvim";
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
