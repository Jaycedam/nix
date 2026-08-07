{
  wayland.windowManager.niri.settings._children = [
    {
      layer-rule._children = [
        {match._props.namespace = "^launcher$";}
        {geometry-corner-radius = 1;}
        {shadow.on = {};}
        {
          background-effect = {
            blur = true;
            xray = false;
          };
        }
      ];
    }
    {
      layer-rule._children = [
        {match._props.namespace = "^waybar$";}
        {background-effect.blur = true;}
      ];
    }
    {
      layer-rule._children = [
        {match._props.namespace = "^kitty-quick-access$";}
        {shadow.on = {};}
        {
          background-effect = {
            blur = true;
            xray = false;
          };
        }
      ];
    }

    # rounded corners
    {
      window-rule._children = [
        {geometry-corner-radius = 1;}
        {clip-to-geometry = true;}
      ];
    }

    # inactive windows
    {
      window-rule._children = [
        {match._props.is-active = false;}
        {exclude._props.is-floating = true;}
        {opacity = 0.9;}
        {background-effect.blur = true;}
      ];
    }

    # Picture-in-Picture
    {
      window-rule._children = [
        {
          match._props = {
            app-id = "firefox$";
            title = "^Picture-in-Picture$";
          };
        }
        {
          match._props = {
            app-id = "zen-beta$";
            title = "^Picture-in-Picture$";
          };
        }
        {match._props.title = "^Picture in picture$";}
        {open-floating = true;}
        {
          default-floating-position._props = {
            x = 5;
            y = 5;
            relative-to = "top-right";
          };
        }
        {default-column-width.fixed = 400;}
        {default-window-height.fixed = 225;}
        {open-focused = false;}
      ];
    }

    # Block out from screen capture
    {
      window-rule._children = [
        {match._props.app-id = "^org\\.keepassxc\\.KeePassXC$";}
        {match._props.app-id = "^org\\.gnome\\.World\\.Secrets$";}
        {match._props.app-id = "^org\\.gnome\\.seahorse\\.Application$";}
        {match._props.app-id = "^Proton Pass$";}
        {block-out-from = "screen-capture";}
      ];
    }

    # browser workspace
    {
      window-rule._children = [
        {match._props.app-id = "brave-browser";}
        {match._props.app-id = "brave-origin";}
        {match._props.app-id = "zen-beta";}
        {open-on-workspace = "browser";}
        {open-focused = true;}
      ];
    }

    # dev workspace
    {
      window-rule._children = [
        {match._props.app-id = "neovim";}
        {match._props.app-id = "opencode";}
        {match._props.app-id = "kitty";}
        {match._props.app-id = "com.mitchellh.ghostty";}
        {open-on-workspace = "dev";}
        {open-focused = true;}
      ];
    }

    # media workspace
    {
      window-rule._children = [
        {match._props.app-id = "kopuz";}
        {match._props.app-id = "brave-open.spotify.com__-Default";}
        {match._props.app-id = "brave-music.youtube.com__-Default";}
        {open-on-workspace = "media";}
        {open-focused = true;}
      ];
    }

    # chat workspace
    {
      window-rule._children = [
        {match._props.app-id = "brave-web.whatsapp.com__-Default";}
        {match._props.app-id = "signal";}
        {match._props.app-id = "brave-mail.proton.me__-Default";}
        {open-on-workspace = "chat";}
        {open-focused = true;}
      ];
    }

    # gaming workspace
    {
      window-rule._children = [
        {match._props.app-id = "steam";}
        {match._props.app-id = "heroic";}
        {open-on-workspace = "gaming";}
        {open-focused = true;}
      ];
    }
  ];
}
