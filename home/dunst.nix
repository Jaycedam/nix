_: {
  services.dunst = {
    enable = true;
    settings = {
      global = {
        width = "300";
        offset = "(16,16)";
        origin = "top-right";
        gap_size = 10;
        frame_width = 1;
        corner_radius = 5;
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
