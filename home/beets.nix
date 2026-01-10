{ ... }:
{
  programs.beets = {
    enable = true;
    settings = {
      directory = "~/Music";
      library = "~/.local/share/beets/library.blb";
      plugins = [
        "fetchart"
        "embedart"
        "musicbrainz"
        "convert"
        "lastgenre"
      ];
      import.incremental = true;

      convert = {
        auto = true;
        format = "opus";
        formats.opus = {
          command = "ffmpeg -i $source -y -c:a libopus -b:a 160k $dest";
          extension = "opus";
        };
      };
    };
  };

}
