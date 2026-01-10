{ ... }:
{
  programs.waybar.settings.mainBar = {
    "modules-left" = [
      "group/actions"
      "niri/window"
    ];
    "modules-center" = [
      "niri/workspaces"
      "tray"
    ];

    "niri/workspaces" = {
      "format" = "{icon}";
      "format-icons" = {
        "active" = "";
        "default" = "";
      };
    };

    "niri/window" = {
      "format" = "{title}";
      "max-length" = 50;
      "icon" = true;
      "icon-size" = 16;
    };
  };
}
