{pkgs, ...}:
pkgs.writeShellApplication {
  name = "set-wallpaper";

  runtimeInputs = with pkgs; [
    wpaperd
    file
    libnotify
  ];

  text = ''
    path="$(readlink -f "''${1:?Usage: $0 <image-path>}")"

    if ! file --mime-type "$path" | grep -q image/; then
        notify-send "set-wallpaper" "$(basename "$path") is not a valid image"
        exit 1
    fi

    wpaperctl set "$path"
  '';
}
