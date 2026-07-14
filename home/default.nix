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
    ./git.nix
    ./fish.nix
    ./yazi.nix
    ./niri
    ./neovim
  ];

  home.shell.enableFishIntegration = true;

  programs = {
    fzf.enable = true;
    zoxide.enable = true;
    bat.enable = true;
    btop.enable = true;
    eza.enable = true;
    fastfetch.enable = true;
    npm = {
      enable = true;
      settings = {
        "min-release-age" = 30;
      };
    };
  };
}
