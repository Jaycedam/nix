{ config, user, ... }: {
  home = {
    preferXdgDirectories = true;
    username = user;
    homeDirectory = "/home/${user}";
    pointerCursor.enable = true;
    sessionPath = [ "$HOME/.local/bin" ];
    sessionVariables = {
      EDITOR = "nvim";
      TERMINAL = "kitty";
      PAGER = "nvim +Man!";
      BROWSER = "brave";
    };
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
    ./shell.nix
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
    ./browser.nix
    ./desktop-items.nix
    ./services.nix
    ./gaming.nix
    ./beets.nix
  ];
}
