_: {
  programs.hyprlock = {
    enable = true;
    settings = {
      input-field = {
        monitor = "";
        size = "300, 30";
        outline_thickness = 1;
        dots_size = 0.25;
        dots_spacing = 0.55;
        dots_center = true;
        dots_rounding = -1;
        fade_on_empty = false;
        placeholder_text = "";
        hide_input = false;
        fail_text = "$FAIL <b>($ATTEMPTS)</b>";
        fail_transition = 300;
        invert_numlock = false;
        position = "0, -468";
        halign = "center";
        valign = "center";
      };

      label = [
        {
          monitor = "";
          text = "cmd[update:1000] echo \"$(date +\"%A, %B %d\")\"";
          font_size = 20;
          position = "0, 405";
          halign = " center";
          valign = " center";
        }
        {
          monitor = "";
          text = "cmd[update:1000] echo \"$(date +\"%k:%M\")\"";
          font_size = 93;
          position = "0, 310";
          halign = " center";
          valign = " center";
        }
        {
          monitor = "";
          text = "Enter Password";
          font_size = 10;
          position = "0, -438";
          halign = " center";
          valign = " center";
        }
      ];

    };
  };
}
