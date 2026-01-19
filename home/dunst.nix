_: {
  services.dunst = {
    enable = false;
    settings = {
      global = {
        width = "300";
        offset = "(15,15)";
        origin = "top-right";
        gap_size = 10;
        frame_width = 1;
        corner_radius = 10;
        mouse_left_click = "do_action";
        mouse_right_click = "close_current";
      };
      urgency_low = {
        highlight = "#ffffff";
      };
      urgency_normal = {
        highlight = "#ffffff";
      };
      urgency_high = {
        highlight = "#ffffff";
      };
    };
  };
}
