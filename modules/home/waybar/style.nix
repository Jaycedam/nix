{ lib, theme, ... }:
{
  programs.waybar.style = lib.mkAfter ''
    * {
        font-family: "JetBrains Mono", "Symbols Nerd Font Mono";
    }

    window#waybar {
        border-bottom: 1px solid @base02;
    }

    .module {
        padding: 0 8px;
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

    /* overrides for stylix */
    .modules-left #workspaces button {
        border-bottom: 0;
    }
    .modules-left #workspaces button.focused,
    .modules-left #workspaces button.active {
        border-bottom: 0;
    }
    .modules-left #workspaces button.urgent {
        border-bottom: 0;
    }
    .modules-center #workspaces button {
        border-bottom: 0;
    }
    .modules-center #workspaces button.focused,
    .modules-center #workspaces button.active {
        border-bottom: 0;
    }
    .modules-center #workspaces button.urgent {
        border-bottom: 0;
    }
    .modules-right #workspaces button {
        border-bottom: 0;
    }
    .modules-right #workspaces button.focused,
    .modules-right #workspaces button.active {
        border-bottom: 0;
    }
    .modules-right #workspaces button.urgent {
        border-bottom: 0;
    }
  '';
}
