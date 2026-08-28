{
  lib,
  pkgs,
  user,
  ...
}: {
  imports = [
    ../shared/overlays.nix
    ./programs
    ./services
    ./scripts
  ];

  nixpkgs.config.allowUnfree = true;
  fonts.fontconfig.enable = true;

  # TODO: move this
  gtk.gtk3.bookmarks = [
    "file:///home/${user}/Projects"
    "file:///home/${user}/Pictures"
    "file:///home/${user}/Music"
    "file:///home/${user}/Documents"
    "file:///home/${user}/Downloads"
  ];

  home = {
    preferXdgDirectories = true;
    username = user;
    homeDirectory = "/home/${user}";
    pointerCursor.enable = true;
    sessionPath = ["$HOME/.local/bin"];
    # don't change this!
    stateVersion = "26.05";
  };

  home.activation = {
    reloadRunningApps = lib.hm.dag.entryAfter ["writeBoundary"] ''
      run --silence ${lib.getExe' pkgs.procps "pkill"} -USR2 opencode || true
      run --silence ${lib.getExe' pkgs.procps "pkill"} -SIGUSR2 btop || true
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
