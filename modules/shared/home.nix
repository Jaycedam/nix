_: {
  imports = [
    ../../home/nixvim/default.nix
    ../../home/tmux.nix
    ../../home/kitty.nix
    ../../home/anki.nix
    ../../home/fish.nix
    ../../home/git.nix
  ];

  home.sessionVariables = {
    EDITOR = "nvim";
  };

  programs = {
    btop = {
      enable = true;
      settings = {
        color_scheme = "matugen";
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

    yazi = {
      enable = true;
      enableFishIntegration = true;
      keymap = {
        mgr.prepend_keymap = [
          {
            on = [ "<C-m>" ];
            run = ''shell 'matugen image "$0"' '';
            desc = "Generate colors from image";
          }
        ];
      };
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

    alacritty = {
      enable = true;
      settings = {
        window = {
          decorations = "Buttonless";
          blur = true;
        };
      };

    };
  };
}
