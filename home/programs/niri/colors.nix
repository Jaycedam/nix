{config, ...}: {
  wayland.windowManager.niri.settings = with config.lib.stylix.colors.withHashtag; {
    overview.backdrop-color = base00;

    layout = {
      background-color = base00;
      shadow.color = "${base00}70";
      insert-hint.color = "${base0C}80";

      focus-ring = {
        off = {};
        width = 2;
        active-color = base0D;
        inactive-color = base02;
        urgent-color = base08;
      };

      border = {
        on = {};
        width = 2;
        active-color = base0D;
        inactive-color = base02;
        urgent-color = base08;
      };

      tab-indicator = {
        active-color = base0D;
        inactive-color = base02;
        urgent-color = base08;
      };
    };

    recent-windows.highlight = {
      active-color = base0D;
      urgent-color = base08;
    };
  };
}
