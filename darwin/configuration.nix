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
        # InitialKeyRepeat = 2;
        # KeyRepeat = 25;
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

  services = {
    aerospace = {
      enable = true;
      settings = {
        on-focused-monitor-changed = [ "move-mouse monitor-lazy-center" ];
        on-window-detected = [
          {
            "if" = {
              app-name-regex-substring = "Brave Browser|Safari|Zen|Google Chrome|Chromium|Vivaldi|Firefox";
            };
            run = [ "move-node-to-workspace 1" ];
          }

          {
            "if" = {
              app-name-regex-substring = "Ghostty|Kitty|Alacritty";
            };
            run = [ "move-node-to-workspace 2" ];
          }

          {
            "if" = {
              app-name-regex-substring = "Mail|Calendar";
            };
            run = [ "move-node-to-workspace 3" ];
          }

          {
            "if" = {
              app-name-regex-substring = "WhatsApp|Signal";
            };
            run = [ "move-node-to-workspace 4" ];
          }

          {
            "if" = {
              app-name-regex-substring = "Spotify|Apple Music";
            };
            run = [ "move-node-to-workspace 5" ];
          }

          {
            "if" = {
              app-name-regex-substring = "Steam Helper|Heroic";
            };
            run = [
              "layout tiling"
              "move-node-to-workspace 6"
            ];
          }
        ];

        gaps = {
          outer.left = 8;
          outer.bottom = 8;
          outer.top = 8;
          outer.right = 8;
          inner.horizontal = 8;
          inner.vertical = 8;
        };

        mode.main.binding = {
          # Layout commands
          "alt-period" = "layout tiles horizontal vertical";
          "alt-comma" = "layout accordion horizontal vertical";

          # Focus
          "alt-left" = "focus left";
          "alt-down" = "focus down";
          "alt-up" = "focus up";
          "alt-right" = "focus right";

          "alt-h" = "focus left";
          "alt-j" = "focus down";
          "alt-k" = "focus up";
          "alt-l" = "focus right";

          "alt-e" = "fullscreen";
          "alt-shift-e" = "layout floating tiling";
          "alt-shift-s" = "reload-config";

          # Move nodes
          "alt-shift-left" = "move left";
          "alt-shift-down" = "move down";
          "alt-shift-up" = "move up";
          "alt-shift-right" = "move right";

          "alt-shift-h" = "move left";
          "alt-shift-j" = "move down";
          "alt-shift-k" = "move up";
          "alt-shift-l" = "move right";

          # Resize
          "alt-minus" = "resize smart -50";
          "alt-equal" = "resize smart +50";

          # Workspaces
          "alt-1" = "workspace 1"; # browsers
          "alt-2" = "workspace 2"; # dev tools
          "alt-3" = "workspace 3"; # organization
          "alt-4" = "workspace 4"; # communication
          "alt-5" = "workspace 5"; # media
          "alt-6" = "workspace 6"; # gaming
          "alt-7" = "workspace 7"; # rest
          "alt-8" = "workspace 8"; # rest
          "alt-9" = "workspace 9"; # rest

          # Move nodes to workspace
          "alt-shift-1" = "move-node-to-workspace 1 --focus-follows-window";
          "alt-shift-2" = "move-node-to-workspace 2 --focus-follows-window";
          "alt-shift-3" = "move-node-to-workspace 3 --focus-follows-window";
          "alt-shift-4" = "move-node-to-workspace 4 --focus-follows-window";
          "alt-shift-5" = "move-node-to-workspace 5 --focus-follows-window";
          "alt-shift-6" = "move-node-to-workspace 6 --focus-follows-window";
          "alt-shift-7" = "move-node-to-workspace 7 --focus-follows-window";
          "alt-shift-8" = "move-node-to-workspace 8 --focus-follows-window";
          "alt-shift-9" = "move-node-to-workspace 9 --focus-follows-window";

          # App shortcuts
          "alt-f" = "exec-and-forget open -a Kitty";
          "alt-t" = "exec-and-forget open -a \"Brave Browser\"";

          # Workspace navigation
          "alt-tab" = "workspace-back-and-forth";
          "alt-shift-tab" = "move-workspace-to-monitor --wrap-around next";
        };

      };
    };

    jankyborders = {
      enable = true;
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
