{
  pkgs,
  ...
}:
{
  # home-manager configuration
  home.stateVersion = "25.11";

  # large configs go to separate files
  imports = [
    ./config/neovim/default.nix
    ./config/helix.nix
    ./config/tmux.nix
    ./config/kitty.nix
  ];

  programs = {
    git = {
      enable = true;
      settings = {
        user = {
          name = "Jaycedam";
          email = "45575946+Jaycedam@users.noreply.github.com";
        };
        credential.helper = "!${pkgs.gh}/bin/gh auth git-credential";
      };
    };
    zoxide = {
      enable = true;
      enableFishIntegration = true;
    };
    bat = {
      enable = true;
    };
    btop.enable = true;
    fish.enable = true;
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
      package = pkgs.ghostty-bin;
      settings = {
        mouse-hide-while-typing = "true";
      };
    };
    opencode.enable = true;
  };
}
