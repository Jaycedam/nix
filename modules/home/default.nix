{
  pkgs,
  user,
  ...
}:
{
  imports = [
    ../common/stylix.nix
    ./compositors
    ./beets.nix
    ./mpd.nix
    ./rmpc.nix
    ./waybar
    ./programs.nix
    ./swayidle.nix
    ./fuzzel.nix
    ./mako.nix
    ./desktop-entries.nix
    ./nixvim
    ./tmux.nix
    ./kitty.nix
    ./yazi.nix
    ./anki.nix
    ./fish.nix
    ./git.nix
    ./ghostty.nix
    ./services.nix
    ./scripts
    ./brave.nix
    ./gaming.nix
    ./swaylock.nix
    ./eza.nix
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
