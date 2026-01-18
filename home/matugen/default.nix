{ config, lib, ... }:
{
  home.file = {
    ".config/matugen/config.toml".source = ./config.toml;
    ".config/matugen/templates".source = ./templates;
  };

  home.activation.createMatugenColors = lib.hm.dag.entryAfter [ "writeBoundary" ] ''
    config_dir="${config.xdg.configHome}"
    mkdir -p "$config_dir/hypr" \
             "$config_dir/waybar" \
             "$config_dir/kitty" \
             "$config_dir/fuzzel" \
             "$config_dir/gtk-3.0" \
             "$config_dir/gtk-4.0" \
             "$config_dir/dunst" \
             "$config_dir/yazi" \
          "$config_dir/btop/themes" \
          "$config_dir/neovim" \
          "$config_dir/tmux" \
          "$config_dir/ghostty/themes" \
          "$config_dir/niri"
    touch "$config_dir/hypr/colors.conf" \
          "$config_dir/waybar/colors.css" \
          "$config_dir/kitty/colors.conf" \
          "$config_dir/gtk-3.0/colors.css" \
          "$config_dir/gtk-4.0/colors.css" \
          "$config_dir/dunst/dunstrc" \
          "$config_dir/yazi/theme.toml" \
          "$config_dir/btop/themes/matugen.theme" \
          "$config_dir/neovim/generated.lua" \
          "$config_dir/tmux/generated.conf" \
          "$config_dir/ghostty/themes/matugen" \
          "$config_dir/niri/colors.kdl"
    touch "$config_dir/hypr/colors.conf" \
          "$config_dir/waybar/colors.css" \
          "$config_dir/kitty/colors.conf" \
          "$config_dir/fuzzel/colors.ini" \
          "$config_dir/gtk-3.0/colors.css" \
          "$config_dir/gtk-4.0/colors.css" \
          "$config_dir/yazi/theme.toml" \
          "$config_dir/btop/themes/matugen.theme" \
          "$config_dir/nvim/generated.lua" \
          "$config_dir/tmux/generated.conf" \
          "$config_dir/ghostty/themes/matugen" \
          "$config_dir/niri/colors.kdl"
  '';
}
