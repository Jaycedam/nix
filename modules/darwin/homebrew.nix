_: {
  homebrew = {
    enable = true;
    global = {
      autoUpdate = false;
    };
    onActivation = {
      cleanup = "zap";
    };
    # formulae
    # brews = [];
    # gui
    casks = [
      "colemak-dh"
      "steam"
      "grayjay"
      "ente"
      "gimp"
      "cryptomator"
    ];
  };
}
