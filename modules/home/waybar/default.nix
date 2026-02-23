{ compositor, ... }:
{
  imports = [
    ./modules.nix
    ./style.nix
  ];

  programs.waybar = {
    enable = true;
    systemd.enable = true;
    settings = {
      mainBar = {
        layer = "top";
        position = "top";
        spacing = 10;
        # margin = "0 10 5 10";

        modules-left =
          if compositor == "niri" then
            [
              "niri/workspaces"
              "niri/window"
            ]
          else if compositor == "mango" then
            [
              "ext/workspaces"
              "dwl/window"
            ]
          else
            throw "Unsupported compositor: ${compositor}";
        modules-center = [
          "clock"
        ];
        modules-right = [
          "mpris"
          "group/custom-tray"
          "privacy"
          "group/system"
        ];
      };
    };
  };
}
