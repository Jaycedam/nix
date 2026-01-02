{ ... }:
{
  programs.waybar.settings.mainBar = {
    "modules-left" = [
      "group/actions"
      "hyprland/window"
    ];
    "modules-center" = [ "hyprland/workspaces" ];

    "hyprland/workspaces" = {
      "format" = "{icon}";
      "format-icons" = {
        "active" = "";
        "persistent" = "";
        "empty" = "";
      };
      "persistent-workspaces" = {
        "*" = 5;
      };
    };

    "hyprland/window" = {
      "format" = "{title}";
      "max-length" = 50;
      "icon" = true;
      "icon-size" = 16;
    };
  };
}
