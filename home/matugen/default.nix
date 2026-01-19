{ config, lib, ... }:
{
  home.file = {
    ".config/matugen/config.toml".source = ./config.toml;
    ".config/matugen/templates".source = ./templates;
  };

  home.activation.createMatugenColors = lib.hm.dag.entryAfter [ "writeBoundary" ] ''
    conf_dir="${config.xdg.configHome}"

    colorFiles=(
      "$conf_dir/hypr/colors.conf"
      "$conf_dir/waybar/colors.css"
      "$conf_dir/kitty/colors.conf"
      "$conf_dir/fuzzel/colors.ini"
      "$conf_dir/gtk-3.0/colors.css"
      "$conf_dir/gtk-4.0/colors.css"
      "$conf_dir/mako/mako-colors"
      "$conf_dir/yazi/theme.toml"
      "$conf_dir/btop/themes/matugen.theme"
      "$conf_dir/nvim/generated.lua"
      "$conf_dir/tmux/generated.conf"
      "$conf_dir/ghostty/themes/matugen"
      "$conf_dir/niri/colors.kdl"
    )

    for file in "''${colorFiles[@]}"; do
      mkdir -p "$(dirname "$file")"
      touch "$file"
    done
  '';
}
