{ config, lib, theme, ... }: {
  stylix.targets.waybar.addCss = false;

  programs.waybar.style = lib.mkAfter ''
    @define-color base_alpha alpha(@base00, 0.9);
    @define-color text @base05;
    @define-color primary @base0D;
    @define-color secondary @base0C;
    @define-color warning @base0A;
    @define-color error @base08;
    @define-color muted @base04;
    @define-color surfaceLow @base01;

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
      background-color: @base_alpha;
      color: @text;
      border-radius: 0;
    }
    #idle_inhibitor.activated,
    #bluetooth.connected,
    #power-profiles-daemon.performance {
      color: @primary;
    }

    #battery.warning,
    #power-profiles-daemon.power-saver,
    #privacy {
      color: @warning;
    }

    #battery.critical {
      color: @error;
    }

    #workspaces.taskbar button {
      padding: 0 5px;
    }
    #workspaces.main button {
      padding: 2px;
      margin: 0 5px;
    }

    #workspaces.main button.empty,
    #workspaces.main button.hidden,
    #bluetooth.off {
      color: @muted;
    }
    #workspaces.main button.active {
      color: @secondary;
      border-bottom: 2px solid @secondary;
      border-radius: 0;
    }

    #workspaces.taskbar button .niri-taskbar-btn {
      -gtk-icon-effect: dim;
    }
    #workspaces.taskbar button .niri-taskbar-btn.focused {
      -gtk-icon-effect: highlight;
    }

    #tray {
      background-color: @surfaceLow;
      padding: 0 5px;
    }

    tooltip {
      background: @base00;
    }
    tooltip label {
      color: @text;
    }
  '';
}
