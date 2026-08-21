{
  lib,
  pkgs,
  user,
  ...
}: {
  imports = [
    ../shared/overlays.nix
    ./user-settings.nix
    ./programs
    ./services
    ./scripts
  ];

  nixpkgs.config.allowUnfree = true;
  fonts.fontconfig.enable = true;

  home = {
    preferXdgDirectories = true;
    username = user;
    homeDirectory = "/home/${user}";
    pointerCursor.enable = true;
    sessionPath = ["$HOME/.local/bin"];
    sessionVariables = {
      EDITOR = "nvim";
      TERMINAL = "kitty";
      PAGER = "nvim +Man!";
      BROWSER = "brave-origin";
    };
    # don't change this!
    stateVersion = "26.05";
  };

  # TODO: move this
  home.activation = {
    reloadRunningApps = lib.hm.dag.entryAfter ["writeBoundary"] ''
      run --silence ${lib.getExe' pkgs.procps "pkill"} -USR2 opencode || true
      run --silence ${lib.getExe' pkgs.procps "pkill"} -SIGUSR2 btop || true
      run --silence ${lib.getExe' pkgs.procps "pkill"} -USR1 nvim || true
    '';
  };

  xdg = {
    localBinInPath = true;
    # autocreate user dirs
    userDirs = {
      enable = true;
      createDirectories = true;
    };
  };
}
