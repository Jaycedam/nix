{ ... }: {
  programs.beets = {
    enable = true;
    settings = {
      plugins = [
        "fetchart"
        "embedart"
        "musicbrainz"
        "convert"
        "lastgenre"
        "lyrics"
        "missing"
      ];
      fetchart = {
        maxwidth = 1200;
        enforce_ratio = true;
        quality = 75;
      };
      embedart.remove_art_file = true;
      import.incremental = true;
      lyrics.synced = true;
      convert = {
        auto = true;
        never_convert_lossy_files = true;
        format = "opus";
        formats.opus = {
          command = "ffmpeg -i $source -y -c:a libopus -b:a 128k $dest";
          extension = "opus";
        };
      };
    };
  };
}
