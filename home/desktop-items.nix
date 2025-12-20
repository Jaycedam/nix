_: {
  xdg.desktopEntries = {
    "brave-open.spotify.com__-Default" = {
      name = "Spotify";
      exec = "brave --app=https://open.spotify.com";
      icon = "spotify";
    };
    "brave-web.whatsapp.com__-Default" = {
      name = "WhatsApp";
      exec = "brave --app=https://web.whatsapp.com";
      icon = "whatsapp";
    };
    "brave-mail.proton.me__-Default" = {
      name = "Proton Mail";
      exec = "brave --app=https://mail.proton.me";
      icon = "proton-mail";
    };
    "brave-drive.proton.me__-Default" = {
      name = "Proton Drive";
      exec = "brave --app=https://drive.proton.me";
      icon = ../assets/icons/proton-drive.svg;
    };
    "brave-www.youtube.com__-Default" = {
      name = "YouTube";
      exec = "brave --app=https://www.youtube.com";
      icon = "youtube";
    };
    "lazygit" = {
      name = "Lazygit";
      exec = "kitty --app-id lazygit lazygit";
      icon = "git";
    };
    "bluetui" = {
      name = "Bluetui (bluetooth settings)";
      exec = "kitty --app-id bluetui bluetui";
      icon = "preferences-bluetooth";
    };
    "impala" = {
      name = "Impala (wifi settings)";
      exec = "kitty --app-id impala impala";
      icon = "nm-device-wireless";
    };
    "neovim" = {
      name = "Neovim";
      exec = "kitty --app-id neovim neovim";
      icon = "nvim";
      noDisplay = true;
    };
    "opencode" = {
      name = "OpenCode";
      exec = "kitty --app-id opencode opencode";
      icon = ../assets/icons/opencode.svg;
      noDisplay = true;
    };
  };
}
