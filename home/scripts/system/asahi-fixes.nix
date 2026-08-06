{pkgs, ...}:
pkgs.writeShellApplication {
  name = "asahi-fixes";
  text = ''
    [[ "$(uname -n)" != "asahi" ]] && exit 0

    niri msg action power-off-monitors && niri msg action power-on-monitors
  '';
}
