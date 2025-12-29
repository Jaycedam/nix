{ ... }:
{
  imports = [
    ../../home/neovim/default.nix
    ../../home/helix.nix
    ../../home/tmux.nix
    ../../home/kitty.nix
  ];

  programs = {
    btop.enable = true;
    fish.enable = true;
    opencode.enable = true;
    gemini-cli.enable = true;

    git = {
      enable = true;
      settings = {
        user = {
          name = "Jaycedam";
          email = "45575946+Jaycedam@users.noreply.github.com";
        };
      };
    };

    gh = {
      enable = true;
      gitCredentialHelper.enable = true; # Defaults to github.com and gist.github.com
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
    };

    lazygit = {
      enable = true;
      enableFishIntegration = true;
    };

    ghostty = {
      enable = true;
      settings = {
        mouse-hide-while-typing = "true";
      };
    };

  };
}
