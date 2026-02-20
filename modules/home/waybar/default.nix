_: {
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

        modules-left = [
          "niri/workspaces"
          "niri/window"
        ];
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
