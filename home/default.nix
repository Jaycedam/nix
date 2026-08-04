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
    ./programs
    ./services
    ./scripts
  ];
}
