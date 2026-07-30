{ pkgs, ... }:

pkgs.writeShellApplication {
  name = "manpages";
  runtimeInputs = with pkgs; [
    fzf
  ];
  text = ''
    selection=$(man -k . | fzf --preview='MANPAGER=cat man {1} 2>/dev/null | col -bx')

    if [ -z "$selection" ]; then
        exit 0
    fi

    man "$(echo "$selection" | awk '{print $1}')"
  '';
}
