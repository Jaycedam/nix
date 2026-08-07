{ config, ... }: {
  wayland.windowManager.niri.settings = with config.lib.stylix.colors.withHashtag; {
    layout = {
      background-color = base00;
      focus-ring = {
        off = { };
        active-color = base0D;
        inactive-color = base02;
        urgent-color = base08;
      };
      border = {
        on = { };
        width = 3;
        active-color = base0D;
        inactive-color = base02;
        urgent-color = base08;
      };
      shadow.color = "${base00}70";
      tab-indicator = {
        active-color = base0D;
        inactive-color = base02;
        urgent-color = base08;
      };
      insert-hint.color = "${base0C}80";
    };
    recent-windows.highlight = {
      active-color = base0D;
      urgent-color = base08;
    };
    overview.backdrop-color = base00;
  };
}
