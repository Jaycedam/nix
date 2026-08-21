{
  programs.beets = {
    enable = true;
    settings = {
      import.incremental = true;
      lyrics.synced = true;

      plugins = [
        "fetchart"
        "musicbrainz"
        "convert"
        "lastgenre"
        "lyrics"
        "missing"
        "permissions"
      ];

      fetchart = {
        # CAA pre-sized thumbnails 250, 500, and 1200px
        maxwidth = 1200;
        enforce_ratio = true;
        quality = 75;
      };

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
