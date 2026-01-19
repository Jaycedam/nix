_: {
  services.mako = {
    enable = true;
    settings = {
      font = "DejaVu Sans 12";
      width = 400;
      padding = 10;
      border-radius = 10;
      border-size = 1;
      icon-border-radius = 10;
      layer = "overlay";
      include = "~/.config/mako/mako-colors";

      # OSD bottom-center
      "category=osd" = {
        anchor = "bottom-center";
        width = 200;
        height = 70;
        default-timeout = 1500;
        outer-margin = 10;
      };
    };
  };
}
