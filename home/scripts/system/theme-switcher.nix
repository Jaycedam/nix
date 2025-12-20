{ pkgs, ... }:

pkgs.writeShellScriptBin "theme-switcher" ''
  set -uo pipefail

  config_dir="$HOME/.config"
  themes_dir="$config_dir/themes"

  declare -A map=(
      [btop.theme]="$config_dir/btop/themes/colors.theme"
      [colors.yazi/flavor.toml]="$config_dir/yazi/flavors/colors.yazi/flavor.toml"
      [colors.yazi/tmtheme.xml]="$config_dir/yazi/flavors/colors.yazi/tmtheme.xml"
      [fuzzel.ini]="$config_dir/fuzzel/colors.ini"
      [kitty.conf]="$config_dir/kitty/current-theme.conf"
      [mako]="$config_dir/mako/colors"
      [niri.kdl]="$config_dir/niri/colors.kdl"
      [nvim.lua]="$config_dir/nvim/lua/plugins/theme.lua"
      [swaylock]="$config_dir/swaylock/config"
      [waybar.css]="$config_dir/waybar/colors.css"
      [bat/config]="$config_dir/bat/config"
      [bat/themes]="$config_dir/bat/themes"
      [fish/theme.fish]="$config_dir/fish/conf.d/theme.fish"
      [fish/themes]="$config_dir/fish/themes"
      [fish/fzf.fish]="$config_dir/fish/conf.d/fzf-theme.fish"
  )

  check_themes() {
      echo "Missing theme files:"
      for theme_dir in "$themes_dir"/*/; do
          [ -d "$theme_dir" ] || continue
          local theme
          theme=$(basename "$theme_dir")
          echo "$theme:"
          for file in "''${!map[@]}"; do
              if [ ! -f "$theme_dir/$file" ] && [ ! -d "$theme_dir/$file" ]; then
                  echo "  $file"
              fi
          done
          echo
      done
      exit 0
  }

  if [ "''${1:-}" = "--check" ]; then
      check_themes
  elif [ -n "''${1:-}" ]; then
      theme="$1"
      if [ ! -d "$themes_dir/$theme" ]; then
          echo "theme not found: $theme"
          exit 1
      fi
  else
      theme=$(fd -t d . "$themes_dir" --max-depth 1 -x basename {} | fzf --popup center --border-label ' Theme Switcher ' --input-label ' Select Theme ')
  fi

  if [ -z "$theme" ]; then
      exit 0
  fi

  clean_theme() {
      for dst in "''${map[@]}"; do
          [ -e "$dst" ] && rm -r "$dst"
      done
  }

  set_theme() {
      local theme="$1"
      niri msg action do-screen-transition --delay-ms 100 >/dev/null 2>&1
      clean_theme
      for file in "''${!map[@]}"; do
          local src="$themes_dir/$theme/$file"
          local dst="''${map[$file]}"
          if [ -f "$src" ] || [ -d "$src" ]; then
              mkdir -p "$(dirname "$dst")"
              cp -r "$src" "$dst"
          else
              echo "skipping: $src (not found)"
          fi
      done
      restart_apps
  }

  restart_apps() {
      local cmds=(
          "kill -SIGUSR1 \$KITTY_PID"
          "pkill -USR2 btop"
          "makoctl reload"
          "pkill waybar; nohup waybar &"
          "pkill -SIGUSR1 nvim"
          "bat cache --build"
      )
      for cmd in "''${cmds[@]}"; do
          eval "$cmd" >/dev/null 2>&1
      done
  }

  set_theme "$theme"
''
