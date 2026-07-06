{ pkgs, ... }:
let
  webapp =
    {
      name,
      desktopName,
      icon,
    }:
    pkgs.makeDesktopItem {
      name = "brave-${name}__-Default";
      exec = "brave --app=https://${name}";
      inherit desktopName icon;
    };

  tui =
    {
      name,
      desktopName,
      icon,
    }:
    pkgs.makeDesktopItem {
      exec = "kitty --app-id ${name} ${name}";
      inherit name desktopName icon;
    };
in
{
  environment.systemPackages = [
    (webapp {
      name = "open.spotify.com";
      desktopName = "Spotify";
      icon = "spotify";
    })
    (webapp {
      name = "web.whatsapp.com";
      desktopName = "WhatsApp";
      icon = "whatsapp";
    })
    (webapp {
      name = "mail.proton.me";
      desktopName = "Proton Mail";
      icon = "proton-mail";
    })
    (webapp {
      name = "drive.proton.me";
      desktopName = "Proton Drive";
      icon = ../assets/icons/proton-drive.svg;
    })
    (webapp {
      name = "www.youtube.com";
      desktopName = "YouTube";
      icon = "youtube";
    })
    (tui {
      name = "lazygit";
      desktopName = "Lazygit";
      icon = "git";
    })
    (tui {
      name = "bluetui";
      desktopName = "Bluetui (bluetooth settings)";
      icon = "preferences-bluetooth";
    })
    (tui {
      name = "impala";
      desktopName = "Impala (wifi settings)";
      icon = "nm-device-wireless";
    })
    (tui {
      name = "neovim";
      desktopName = "Neovim";
      icon = "nvim";
    })
    (tui {
      name = "opencode";
      desktopName = "OpenCode";
      icon = ../assets/icons/opencode.svg;
    })
  ];
}
