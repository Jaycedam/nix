{
  lib,
  pkgs,
  user,
  ...
}:
{
  imports = [
    ../shared/overlays.nix
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

  home.activation = {
    reloadRunningApps = lib.hm.dag.entryAfter [ "writeBoundary" ] ''
      run --silence ${pkgs.procps}/bin/pkill -USR2 opencode || true
      run --silence ${pkgs.procps}/bin/pkill -SIGUSR2 btop || true
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
