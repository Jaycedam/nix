_: {
  imports = [
    ./terminal.nix
    ./git.nix
    ./fish.nix
    ./yazi.nix
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
