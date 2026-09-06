{
  plugins.blink-cmp = {
    enable = true;
    settings = {
      signature.enabled = true;
      keymap.preset = "default";
      completion = {
        ghost_text.enabled = false;
        documentation = {
          auto_show = true; # show function signature/docs
          auto_show_delay_ms = 300;
        };
        menu.draw.columns = [
          {
            __unkeyed-1 = "kind_icon";
            __unkeyed-2 = "label";
            __unkeyed-3 = "label_description";
            gap = 1;
          }
          [ "kind" ]
        ];
      };
    };
  };
}
