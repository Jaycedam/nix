{ config, user, ... }: {
  nixpkgs.config.allowUnfree = true;
  fonts.fontconfig.enable = true;

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
      BROWSER = "brave-origin";
    };
    # don't change this!
    stateVersion = "26.05";
  };

  xdg = {
    localBinInPath = true;
    # autocreate user dirs
    userDirs = {
      enable = true;
      createDirectories = true;
      extraConfig = {
        WALLPAPERS = "${config.home.homeDirectory}/Pictures/Wallpapers";
      };
    };
  };

  imports = [
    ../shared/overlays.nix
    ./stylix
    ./terminal.nix
    ./sh.nix
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
    ./activation.nix
    ./supersonic
  ];
}
