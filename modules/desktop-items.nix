{ pkgs, ... }: {
  environment.systemPackages = [
    (pkgs.makeDesktopItem {
      name = "brave-open.spotify.com__-Default";
      desktopName = "Spotify";
      exec = "brave --app=https://open.spotify.com";
      icon = "spotify";
    })
    (pkgs.makeDesktopItem {
      name = "brave-web.whatsapp.com__-Default";
      desktopName = "WhatsApp";
      exec = "brave --app=https://web.whatsapp.com";
      icon = "whatsapp";
    })
    (pkgs.makeDesktopItem {
      name = "brave-mail.proton.me__-Default";
      desktopName = "Proton Mail";
      exec = "brave --app=https://mail.proton.me";
      icon = "proton-mail";
    })
    (pkgs.makeDesktopItem {
      name = "brave-drive.proton.me__-Default";
      desktopName = "Proton Drive";
      exec = "brave --app=https://drive.proton.me";
      icon = ../assets/icons/proton-drive.svg;
    })
    (pkgs.makeDesktopItem {
      name = "brave-www.youtube.com__-Default";
      desktopName = "YouTube";
      exec = "brave --app=https://www.youtube.com";
      icon = "youtube";
    })
    (pkgs.makeDesktopItem {
      name = "lazygit";
      desktopName = "Lazygit";
      exec = "kitty --app-id lazygit lazygit";
      icon = "git";
    })
    (pkgs.makeDesktopItem {
      name = "bluetui";
      desktopName = "Bluetui (bluetooth settings)";
      exec = "kitty --app-id bluetui bluetui";
      icon = "preferences-bluetooth";
    })
    (pkgs.makeDesktopItem {
      name = "impala";
      desktopName = "Impala (wifi settings)";
      exec = "kitty --app-id impala impala";
      icon = "nm-device-wireless";
    })
    (pkgs.makeDesktopItem {
      name = "neovim";
      desktopName = "Neovim";
      exec = "kitty --app-id neovim neovim";
      icon = "nvim";
      noDisplay = true;
    })
    (pkgs.makeDesktopItem {
      name = "opencode";
      desktopName = "OpenCode";
      exec = "kitty --app-id opencode opencode";
      icon = ../assets/icons/opencode.svg;
      noDisplay = true;
    })
  ];
}
