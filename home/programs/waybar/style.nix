{
  config,
  lib,
  theme,
  ...
}: let
  inherit (config.lib.stylix.colors) base00-dec-r base00-dec-g base00-dec-b;
  to255 = v: toString (builtins.floor (builtins.mul (builtins.fromJSON v) 255));
  bg_alpha = "rgba(${to255 base00-dec-r}, ${to255 base00-dec-g}, ${to255 base00-dec-b}, ${toString theme.opacity})";
in {
  stylix.targets.waybar.addCss = false;
  programs.waybar.style = lib.mkAfter ''
    * {
      font-family: "JetBrains Mono", "Symbols Nerd Font Mono";
      font-size: ${toString config.stylix.fonts.sizes.desktop}pt;
      font-weight: bold;
      border-radius: ${toString theme.border-radius};
      min-height: 0;
      min-width: 0;
      padding: 0;
      margin: 0;
    }

    .modules-left,
    .modules-center,
    .modules-right {
      padding: 0 5px;
    }

    window#waybar {
      background-color: ${bg_alpha};
      color: @base05;
      border-radius: 0;
    }
    #idle_inhibitor.activated,
    #bluetooth.connected,
    #power-profiles-daemon.performance {
      color: @base0D;
    }

    #battery.warning,
    #power-profiles-daemon.power-saver,
    #privacy {
      color: @base09;
    }

    #battery.critical {
      color: @base08;
    }

    #workspaces.taskbar button {
      padding: 0 5px;
    }
    #workspaces.main button {
      padding: 0 5px;
      color: @base05;
    }

    #workspaces.main button.empty,
    #workspaces.main button.hidden,
    #bluetooth.off {
      color: @base03;
    }
    #workspaces.main button.active {
      background-color: @base0D;
      color: @base00;
      border-bottom: 2px solid @base0D;
    }

    #workspaces.taskbar button .niri-taskbar-btn {
      -gtk-icon-effect: dim;
    }
    #workspaces.taskbar button .niri-taskbar-btn.focused {
      -gtk-icon-effect: highlight;
    }

    #tray {
      background-color: @base02;
      padding: 0 10px;
    }

    tooltip {
      background: @base00;
    }
    tooltip label {
      color: @base05;
    }
  '';
}
