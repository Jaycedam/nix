{ mango, ... }:
{
  imports = [
    mango.hmModules.mango
    ./binds.nix
    ./appearance.nix
    ./input.nix
    ./layout.nix
    ./rules.nix
  ];
  wayland.windowManager.mango = {
    enable = true;
    settings = ''
      # More option see https://github.com/DreamMaoMao/mango/wiki/
      exec-once=~/.config/mango/autostart.sh

      # Misc
      no_border_when_single=0
      axis_bind_apply_timeout=100
      focus_on_activate=1
      idleinhibit_ignore_visible=0
      sloppyfocus=1
      warpcursor=1
      focus_cross_monitor=0
      focus_cross_tag=0
      enable_floating_snap=0
      snap_distance=30
      drag_tile_to_tile=1
    '';
    autostart_sh = ''
      # Note: here no need to add shebang
    '';
  };

}
