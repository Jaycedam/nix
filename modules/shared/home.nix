{ ... }:
{
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
    btop.enable = true;
    opencode.enable = true;

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
