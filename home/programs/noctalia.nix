{
  inputs,
  config,
  ...
}: {
  imports = [inputs.noctalia.homeModules.default];

  home.activation.noctalia-clear-temp-config = ''
    echo "" > "${config.xdg.stateHome}/noctalia/settings.toml"
  '';

  programs.noctalia = {
    enable = true;
    systemd.enable = true;
    settings = {
      location.auto_locate = true;
      notification.background_opacity = config.userSettings.theme.opacity;
      osd.background_opacity = config.userSettings.theme.opacity;
      brightness.enable_ddcutil = true;
      desktop_widgets.enabled = false;

      bar.default = {
        background_opacity = config.userSettings.theme.opacity;
        radius = config.userSettings.borderRadius;
        capsule_radius = config.userSettings.borderRadius;
        concave_edge_corners = false;
        padding = 10;
        margin_ends = 0;
        thickness = 30;

        start = [
          "session"
          "workspaces"
          "taskbar"
          "media"
        ];
        center = [
          "clock"
          "spacer_middle"
          "weather"
        ];
        end = [
          "group:actions"
          "network"
          "bluetooth"
          "volume"
          "brightness"
          "battery"
          "notifications"
        ];

        capsule_group = [
          {
            id = "actions";
            members = [
              "tray"
              "caffeine"
              "clipboard"
              "power_profile"
            ];
          }
        ];
      };

      idle.behavior = {
        lock = {
          action = "lock";
          enabled = true;
          timeout = 600;
        };
        "lock-and-suspend" = {
          action = "lock_and_suspend";
          enabled = true;
          timeout = 900;
        };
        "screen-off" = {
          action = "screen_off";
          enabled = true;
          timeout = 660;
        };
      };

      shell = {
        corner_radius_scale = config.userSettings.borderRadius;
        launch_apps_as_systemd_services = true;
        polkit_agent = true;
        settings_show_advanced = false;
        launcher.categories = false;
        panel.transparency_mode = "soft";
      };

      theme.templates = {
        enable_builtin_templates = false;
        enable_community_templates = false;
      };

      widget = {
        clock.format = "{:%A, %b %d  %H:%M}";
        network.show_label = false;
        spacer_middle.type = "spacer";
        tray.drawer = true;
        weather.show_condition = false;

        taskbar = {
          capsule = true;
          inactive_opacity = 0.5;
          only_active_workspace = true;
        };

        workspaces = {
          empty_color = "surface_variant";
          occupied_color = "on_surface";
          style = "minimal";
        };
      };
    };
  };
}
