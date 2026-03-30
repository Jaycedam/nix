_: {
  programs.ashell = {
    enable = true;
    systemd.enable = true;
    settings = {
      modules = {
        center = [
          "Window Title"
        ];
        left = [
          "Workspaces"
        ];
        right = [
          [
            "Clock"
            "Privacy"
            "Settings"
          ]
        ];
      };
      workspaces = {
        visibilityMode = "MonitorSpecific";
      };
    };
  };
}
