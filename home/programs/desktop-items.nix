{
  xdg.desktopEntries = {
    "brave-open.spotify.com__-Default" = {
      name = "Spotify";
      exec = "brave-origin --app=https://open.spotify.com";
      icon = "spotify";
    };
    "brave-web.whatsapp.com__-Default" = {
      name = "WhatsApp";
      exec = "brave-origin --app=https://web.whatsapp.com";
      icon = "whatsapp";
    };
    "brave-mail.proton.me__-Default" = {
      name = "Proton Mail";
      exec = "brave-origin --app=https://mail.proton.me";
      icon = "proton-mail";
    };
    "brave-drive.proton.me__-Default" = {
      name = "Proton Drive";
      exec = "brave-origin --app=https://drive.proton.me";
      icon = builtins.fetchurl {
        url = "https://cdn.jsdelivr.net/gh/selfhst/icons/svg/proton-drive.svg";
        sha256 = "sha256-9ADprNlzvqDcsMp4BLm/MRFGyCLtvuEPsHBZARS/agE=";
      };
    };
    "brave-www.youtube.com__-Default" = {
      name = "YouTube";
      exec = "brave-origin --app=https://www.youtube.com";
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
    "opencode" = {
      name = "OpenCode";
      exec = "kitty --app-id opencode opencode";
      icon = builtins.fetchurl {
        url = "https://opencode.ai/favicon.svg";
        sha256 = "sha256-4pu+MzgK0cGtqRNLUvIp0w6XdtYEgVEsnYHyu2833vk=";
      };
      noDisplay = true;
    };
  };
}
