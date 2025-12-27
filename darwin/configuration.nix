{ pkgs, ... }:
{
  nixpkgs.hostPlatform = "aarch64-darwin";
  nixpkgs.config.allowUnfree = true;
  users.users.jay = {
    name = "jay";
    home = "/Users/jay";
    shell = pkgs.fish;
  };

  system = {
    primaryUser = "jay";
    keyboard = {
      enableKeyMapping = true;
      remapCapsLockToEscape = true;
    };
    defaults = {
      screensaver.askForPasswordDelay = 3;
      screencapture.location = "~/Pictures/screenshots";
      controlcenter.BatteryShowPercentage = true;
      menuExtraClock.ShowAMPM = false;
      NSGlobalDomain = {
        #_HIHideMenuBar = true;
        AppleIconAppearanceTheme = "RegularDark";
        AppleInterfaceStyle = "Dark";
        NSAutomaticSpellingCorrectionEnabled = false;
        InitialKeyRepeat = 2;
        KeyRepeat = 25;
      };
      WindowManager.EnableStandardClickToShowDesktop = false;
      finder = {
        ShowStatusBar = true;
        _FXSortFoldersFirst = true;
        _FXShowPosixPathInTitle = true;
        AppleShowAllExtensions = true;
        AppleShowAllFiles = true;
        CreateDesktop = false;
        FXDefaultSearchScope = "SCcf";
        FXPreferredViewStyle = "clmv";
        NewWindowTarget = "Home";
        ShowExternalHardDrivesOnDesktop = false;
        ShowRemovableMediaOnDesktop = false;
        ShowPathbar = true;
      };
      dock = {
        autohide = true;
        autohide-delay = 0.1;
        mru-spaces = false;
        show-recents = false;
        showhidden = true;
        static-only = true;
        wvous-br-corner = 1;
        wvous-tl-corner = 1;
        wvous-tr-corner = 1;
        wvous-bl-corner = 1;
      };
    };

  };
  networking = {
    hostName = "mac";
    computerName = "mac";
    localHostName = "mac";
    # dns = [ "1.1.1.1" "1.0.0.1" ];
  };

  programs.fish = {
    enable = true;
    interactiveShellInit = ''
      set fish_greeting ""
    '';
    shellAbbrs = {
      v = "nvim";
      n = "nvim";
      h = "hx";
      ll = "ls -lA";
    };
  };

  stylix = {
    enable = true;
    polarity = "dark";
    base16Scheme = "${pkgs.base16-schemes}/share/themes/rose-pine.yaml";
    fonts = {
      sizes = {
        applications = 12;
        desktop = 10;
        terminal = 14;
      };
    };
    opacity = {
      applications = 0.8;
      desktop = 0.8;
      popups = 0.8;
      terminal = 0.8;
    };
  };

  environment.systemPackages = with pkgs; [
    ### cli ###
    pstree
    trash-cli
    tldr
    ripgrep
    yt-dlp
    fd
    jq
    imagemagick
    fastfetch

    # desktop
    transmission_4
    libreoffice-bin

    signal-desktop-bin
    mpv
    #ente-desktop #broken on darwin
    localsend

    ### browser ###
    brave

    ### dev ###
    # tools
    bun
    tree-sitter
    lazygit
    nodejs_24
    docker
    docker-compose
    android-tools
    gh
    # editors
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
    font-awesome
    jetbrains-mono
  ];

  system.stateVersion = 6;
}
