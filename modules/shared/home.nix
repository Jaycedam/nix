_: {
  imports = [
    ../../home/nixvim/default.nix
    ../../home/tmux.nix
    ../../home/kitty.nix
    ../../home/yazi.nix
    ../../home/anki.nix
    ../../home/fish.nix
    ../../home/git.nix
    ../../home/fontconfig.nix
  ];

  home.sessionVariables = {
    EDITOR = "nvim";
  };

  programs = {
    btop = {
      enable = true;
      settings = {
        color_theme = "matugen";
        theme_background = false;
      };
    };
    opencode = {
      enable = true;
      settings.theme = "system";
    };

    zoxide = {
      enable = true;
      enableFishIntegration = true;
    };

    bat = {
      enable = true;
    };

    fzf = {
      enable = true;
      enableFishIntegration = true;
    };

    lazygit = {
      enable = true;
      enableFishIntegration = true;
    };

    ghostty = {
      enable = true;
      settings = {
        mouse-hide-while-typing = "true";
        background-blur = "true";
      };
    };
  };
}
