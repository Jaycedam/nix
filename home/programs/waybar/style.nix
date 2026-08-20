{
  config,
  lib,
  ...
}: {
  # TODO: override stylix instead of defining everything
  stylix.targets.waybar.addCss = false;

  programs.waybar.style = lib.mkAfter ''
    * {
      font-family: "${config.stylix.fonts.monospace.name}", "Symbols Nerd Font Mono";
      font-weight: bold;
      border-radius: ${toString config.userSettings.borderRadius};
    }

    window#waybar {
      background-color: ${config.stylix.targets.waybar.background};
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

    #tray {
      background-color: @base02;
      padding: 0 10px;
    }

    .modules-left,
    .modules-center,
    .modules-right {
      padding: 0 10px;
    }

    #workspaces.taskbar button {
      padding: 0 5px;
    }

    #workspaces.main button {
      padding: 0 5px;
      color: @base05;
      min-width: 0;
    }

    #workspaces.main button.empty,
    #workspaces.main button.hidden,
    #bluetooth.off {
      color: @base03;
    }

    #workspaces.main button.active {
      background-color: @base0D;
      color: @base00;
    }

    #workspaces.taskbar button .niri-taskbar-btn {
      -gtk-icon-effect: dim;
    }

    #workspaces.taskbar button .niri-taskbar-btn.focused {
      -gtk-icon-effect: highlight;
      background-color: @base02;
    }
  '';
}
