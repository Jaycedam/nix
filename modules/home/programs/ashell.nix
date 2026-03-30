_: {
  programs.ashell = {
    enable = true;
    systemd.enable = true;
    settings = {
      position = "Top";
      layer = "Top";

      appearance = {
        style = "Solid";
      };

      modules = {
        left = [
          [
            "Workspaces"
            "WindowTitle"
          ]
        ];
        center = [
          "Clock"
        ];
        right = [
          "MediaPlayer"
          [
            "Tray"
            "Privacy"
            "Settings"
          ]
        ];
      };

      window_title = {
        truncate_title_after_length = 50;
      };
      media_player = {
        max_title_length = 50;
      };
    };
  };
}
