{
  lib,
  pkgs,
  ...
}:
{
  # generate fish completions for beets
  # https://beets.readthedocs.io/en/stable/plugins/fish.html
  home.activation.beetsFishCompletions = lib.hm.dag.entryAfter [ "writeBoundary" ] ''
    ${pkgs.beets}/bin/beet fish
  '';

  programs.beets = {
    enable = true;
    settings = {
      plugins = [
        "fetchart"
        "musicbrainz"
        "convert"
        "lastgenre"
        "lyrics"
        "missing"
        "fish"
        "permissions"
      ];
      fetchart = {
        # CAA pre-sized thumbnails 250, 500, and 1200px
        maxwidth = 1200;
        enforce_ratio = true;
        quality = 75;
      };
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
