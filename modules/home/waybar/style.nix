{ lib, theme, ... }:
{
  programs.waybar.style = lib.mkAfter ''
    * {
        font-family: "JetBrains Mono", "Symbols Nerd Font Mono";
    }

    window#waybar {
        background-color: @base00;
        color: @base06;
        border-bottom: 1px solid @base02;
    }

    .module {
        padding: 0 8px;
    }

    tooltip {
        background: @base00;
        border: 1px solid @base0D ;
    }
    tooltip label {
        color: @base00;
    }

    #bluetooth.connected, #network.wifi {
        color: @base0C ;
    }

    #battery.warning {
        color: @base08 ;
    }

    #privacy {
        color: @base09 ;
    }

    #workspaces button {
        transition: color 0.1s ease;
        padding: 0 5px;
        background: transparent;
        border-radius: ${toString theme.borderRadius};
    }

    #custom-tray {
        background: @base02;
        border-radius: ${toString theme.borderRadius};
    }

    #workspaces button.empty, 
    #workspaces button.hidden,
    #bluetooth.off {
      color: @base03;
    }

    #workspaces button.active {
      color: @base09;
    }

    window#waybar.empty #window {
      border: transparent;
      background-color: transparent;
    }

    #idle_inhibitor.deactivated {
        color: @base03;
    }

    #idle_inhibitor.activated {
        color: @base09;
    }
  '';

  stylix.targets.waybar = {
    addCss = false;
  };

}
