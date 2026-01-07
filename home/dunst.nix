{ ... }:
{
  services.dunst = {
    enable = true;
    settings = {
      global = {
        width = "300";
        offset = "(10,10)";
        origin = "top-right";
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
