{ pkgs, ... }:

{
  # Allow unfree packages
  nixpkgs.config.allowUnfree = true;

  # global system packages
  environment.systemPackages = with pkgs; [
    ### cli ###
    tree
    impala # wifi tui selector
    btop
    wl-clipboard
    fzf
    trash-cli
    tldr
    tmux
    ripgrep
    zoxide
    yt-dlp
    yazi
    bat
    fd
    jq
    imagemagick
    lsfg-vk
    grim
    slurp
    fwupd
    kanata
    fastfetch
    sunshine

    # desktop
    signal-desktop
    gimp
    mpv
    libreoffice-fresh
    transmission_4-gtk
    cryptomator
    ente-desktop
    grayjay
    localsend
    xfce.thunar
    nautilus

    # terminal emulators
    kitty
    ghostty

    ### browser ###
    brave

    ### gaming ###
    gamemode
    gamescope
    dolphin-emu
    shadps4
    gopher64
    heroic
    protonplus
    pcsx2

    # gtk themes
    rose-pine-gtk-theme
    kanagawa-gtk-theme
    material-black-colors

    ### hyprland and utilities ###
    seahorse
    hyprpaper
    hyprpolkitagent
    dunst
    udiskie
    pavucontrol
    rofi
    nwg-look

    ### dev ###
    # tools
    git
    bun
    tree-sitter
    lazygit
    nodejs_24
    docker
    docker-compose
    android-tools
    gh
    # ai
    opencode
    gemini-cli
    # editors
    neovim
    helix
    zed-editor
    # languages
    go

    # lsp
    nil # nix
    pyright
    vscode-langservers-extracted
    typescript-language-server
    rust-analyzer
    astro-language-server
    gopls
    bash-language-server
    marksman
    tailwindcss-language-server
    yaml-language-server
    lua-language-server
    taplo
    # formatters
    nixfmt
    prettier
    ruff
    djlint
    shfmt
    stylua
    black
    # linters
    eslint
    shellcheck
  ];

  fonts.packages = with pkgs; [
    noto-fonts
    noto-fonts-cjk-sans
    noto-fonts-color-emoji
    liberation_ttf # replacements for the MS fonts: Times New Roman, Arial, and Courier New.
    font-awesome
    jetbrains-mono
  ];

  # Some programs need SUID wrappers, can be configured further or are
  # started in user sessions.
  programs = {
    hyprland = {
      enable = true;
      withUWSM = true;
      xwayland.enable = true;
    };
    hyprlock.enable = true;

    waybar.enable = true;
    fish.enable = true;
    steam = {
      enable = true;
    };
  };

  services = {
    openssh.enable = true;
    hypridle.enable = true;
    gnome.gnome-keyring.enable = true;
  };

  # enable extra xdg-portal-hyprland and gtk for file picker
  xdg.portal = {
    enable = true;
    extraPortals = with pkgs; [
      xdg-desktop-portal-hyprland
      xdg-desktop-portal-gtk
    ];
  };
}
