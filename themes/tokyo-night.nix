{ pkgs, ... }: {
  config.stylix = {
    base16Scheme = {
      base00 = "1a1b26";
      base01 = "32344a";
      base02 = "32344a";
      base03 = "444b6a";
      base04 = "787c99";
      base05 = "a9b1d6";
      base06 = "c0caf5";
      base07 = "acb0d0";
      base08 = "f7768e";
      base09 = "ff7a93";
      base0A = "e0af68";
      base0B = "9ece6a";
      base0C = "449dab";
      base0D = "7aa2f7";
      base0E = "ad8ee6";
      base0F = "ff9e64";
    };

    polarity = "dark";

    image = pkgs.fetchurl {
      url = "https://raw.githubusercontent.com/basecamp/omarchy/bec26eeab95277622dd1a21aea9d423bafa511b3/themes/tokyo-night/backgrounds/1-sunset-lake.png";
      sha256 = "1g5bmmmv74y6v6wd9bgkhvmxs8x0v2hv57mqfwrjfdilqfknlqkj";
    };
  };
}
