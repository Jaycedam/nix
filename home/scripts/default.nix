{ pkgs, ... }: {
  home.packages = [
    (pkgs.writeShellApplication {
      name = "dmenu-power";
      text = builtins.readFile ./dmenu-power.sh;
      runtimeInputs = with pkgs; [
        fuzzel
        swaylock
      ];
    })

    (pkgs.writeShellApplication {
      name = "dmenu-projects";
      text = builtins.readFile ./dmenu-projects.sh;
      runtimeInputs = with pkgs; [
        kitty
        fuzzel
      ];
    })

    (pkgs.writeShellApplication {
      name = "launch-or-focus";
      text = builtins.readFile ./launch-or-focus.sh;
      runtimeInputs = with pkgs; [ jq ];
    })

    (pkgs.writeShellApplication {
      name = "brightness";
      text = builtins.readFile ./brightness.sh;
      runtimeInputs = with pkgs; [
        libnotify
        brightnessctl
        ddcutil
      ];
    })

    (pkgs.writeShellApplication {
      name = "volume";
      text = builtins.readFile ./volume.sh;
      runtimeInputs = with pkgs; [
        libnotify
        wireplumber
      ];
    })

    (pkgs.writeShellApplication {
      name = "set-wallpaper";
      text = builtins.readFile ./set-wallpaper.sh;
      runtimeInputs = with pkgs; [
        wpaperd
        file
        libnotify
      ];
    })

    (pkgs.writeShellApplication {
      name = "tmux-sessions";
      text = builtins.readFile ./sessions.sh;
      runtimeInputs = with pkgs; [
        fd
        fzf
        tmux
      ];
    })
  ];
}
