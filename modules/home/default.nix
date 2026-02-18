{
  pkgs,
  user,
  ...
}:
{
  imports = [
    ../common/stylix.nix
    ./niri/default.nix
    ./beets.nix
    ./mpd.nix
    ./rmpc.nix
    ./waybar/waybar.nix
    ./programs.nix
    ./hypridle.nix
    ./fuzzel.nix
    ./mako.nix
    ./desktop-entries.nix
    ./nixvim/default.nix
    ./tmux.nix
    ./kitty.nix
    ./yazi.nix
    ./anki.nix
    ./fish.nix
    ./git.nix
    ./ghostty.nix
    ./services.nix
    ./scripts.nix
    ./brave.nix
    ./gaming.nix
    ./hyprlock.nix
    ./dev.nix
  ];

  home = {
    preferXdgDirectories = true;
    username = user;
    homeDirectory = "/home/${user}";
    sessionVariables = {
      EDITOR = "nvim";
    };
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
    # don't change this!
    stateVersion = "25.11";
  };

  fonts.fontconfig.enable = true;

  # autocreate user dirs
  xdg.userDirs.enable = true;
}
