{
  pkgs,
  user,
  compositor,
  ...
}:
{
  imports = [
    ../common/stylix.nix
    ./scripts

    # Programs
    ./programs.nix
    ./beets.nix
    ./waybar.nix
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
    ./brave.nix
    ./gaming.nix
    ./swaylock.nix
    ./eza.nix
    ./dev.nix

    # Services
    ./services.nix
    ./hypridle.nix

    # Compositor
    (
      if compositor == "niri" then
        ./niri
      else if compositor == "mango" then
        ./mango
      else
        throw "Unsupported compositor: ${compositor}"
    )
  ];

  home = {
    preferXdgDirectories = true;
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
    # don't change this!
    stateVersion = "25.11";
  };

  fonts.fontconfig.enable = true;

  # autocreate user dirs
  xdg.userDirs.enable = true;
}
