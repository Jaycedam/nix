{ config, user, ... }: {
  home = {
    preferXdgDirectories = true;
    username = user;
    homeDirectory = "/home/${user}";
    pointerCursor.enable = true;
    # don't change this!
    stateVersion = "26.05";
  };

  fonts.fontconfig.enable = true;

  # autocreate user dirs
  xdg.userDirs = {
    enable = true;
    createDirectories = true;
    extraConfig = {
      WALLPAPERS = "${config.home.homeDirectory}/Pictures/Wallpapers";
    };
  };

  imports = [
    ./terminal.nix
    ./fish.nix
    ./yazi.nix
    ./niri
    ./neovim
    ./scripts
    ./fuzzel.nix
    ./mako.nix
    ./hypridle.nix
    ./swaylock.nix
    ./tmux.nix
    ./waybar
    ./programs.nix
    ./dev.nix
    ./desktop-items.nix
    ./services.nix
  ];

  home.shell.enableFishIntegration = true;
}
