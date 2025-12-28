{ pkgs, ... }:
{
  environment.systemPackages = with pkgs; [
    ### cli ###
    grim
    slurp
    fwupd # upgrade firmware
    playerctl
    brightnessctl
    ddcutil # ext monitor brightness
    impala # wifi tui selector
    wl-clipboard
    # gaming
    lsfg-vk # lossless scaling on linux
    gamemode
    gamescope
    pcsx2
    shadps4 # no darwin release yet
    ### hyprland and utilities ###
    hyprpolkitagent
    pavucontrol
    wiremix
    # keyring
    kdePackages.kwallet
    kdePackages.kwallet-pam
    kdePackages.kwalletmanager
    # desktop
    proton-pass
    kdePackages.dolphin
    gimp
    transmission_4-gtk
    libreoffice-fresh

    ### cli ###
    tree
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
    signal-desktop
    mpv
    cryptomator
    ente-desktop
    grayjay
    localsend

    ### browser ###
    brave

    ### gaming ###
    dolphin-emu
    gopher64
    heroic

    ### dev ###
    # tools
    bun
    tree-sitter
    lazygit
    nodejs_24
    docker
    docker-compose
    android-tools
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

  # Some programs need SUID wrappers, can be configured further or are
  # started in user sessions.
  programs = {
    zoxide = {
      enable = true;
      enableFishIntegration = true;
    };
    hyprland = {
      enable = true;
      withUWSM = true;
      xwayland.enable = true;
    };

    # start hyprland on tty1
    fish = {
      enable = true;
      loginShellInit = ''
        # autostart hyprland on tty1 
        if status is-login
            if test -z "$DISPLAY" -a (tty) = "/dev/tty1"
              if uwsm check may-start >/dev/null
                exec uwsm start default >/dev/null
              end
            end
        end
      '';
    };

    steam = {
      enable = true;
      extraCompatPackages = with pkgs; [
        proton-ge-bin
      ];
    };
  };

  services = {
    # Power management with profiles
    tuned = {
      enable = true;
      settings.dynamic_tuning = true;
    };

    keyd = {
      enable = true;
      # remaps are based on colemak-dh,
      # but the config is on qwerty so some combos won't make much sense
      keyboards.default.settings = {
        main = {
          a = "overloadt(alt, a, 200)";
          s = "overloadt(meta, s, 200)";
          d = "overloadt(shift, d, 200)";
          f = "overloadt(control, f, 200)";
          j = "overloadt(control, j, 200)";
          k = "overloadt(shift, k, 200)";
          l = "overloadt(meta, l, 200)";
          ";" = "overloadt(alt, ;, 200)";

          # Brightness
          f1 = "brightnessdown";
          f2 = "brightnessup";

          # Media
          f7 = "previoussong";
          f8 = "playpause";
          f9 = "nextsong";

          # Volume
          f10 = "mute";
          f11 = "volumedown";
          f12 = "volumeup";

          space = "overloadt(nav_layer, space, 200)";
        };

        fn = {
          f1 = "f1";
          f2 = "f2";
          f7 = "f7";
          f8 = "f8";
          f9 = "f9";
          f10 = "f10";
          f11 = "f11";
          f12 = "f12";
        };

        nav_layer = {
          h = "left";
          j = "down";
          k = " up";
          l = "right";
          # forward word
          w = "C-right";
          # backward word
          t = "C-left";
          i = "backspace";
          ";" = "enter";
        };
      };
    };
    getty = {
      autologinOnce = true;
      autologinUser = "jay"; # login automatically on console
    };

    udisks2.enable = true; # this is necessary for udiskie to work

    sunshine = {
      enable = true;
      openFirewall = true;
    };

    openssh = {
      enable = true;
      startWhenNeeded = true;
    };
  };

  fonts.packages = with pkgs; [
    noto-fonts
    noto-fonts-cjk-sans
    noto-fonts-color-emoji
    liberation_ttf # replacements for the MS fonts: Times New Roman, Arial, and Courier New.
    font-awesome
    jetbrains-mono
  ];

  # enable extra xdg-portal-hyprland and gtk for file picker
  xdg.portal = {
    enable = true;
    extraPortals = with pkgs; [
      xdg-desktop-portal-hyprland
      xdg-desktop-portal-gtk
    ];
  };

}
