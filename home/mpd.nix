{ ... }:
{
  services = {
    mpd = {
      enable = true;
      extraConfig = ''
        audio_output {
            type "pipewire"
            name "PipeWire Sound Server"
        }
      '';
    };
    # mpris support for mpd
    mpdris2 = {
      enable = true;
      multimediaKeys = true;
      notifications = true;
    };
  };
}
