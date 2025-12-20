{ pkgs, ... }: {
  config.stylix = {
    base16Scheme = {
      base00 = "000000";
      base01 = "404040";
      base02 = "5c5c5c";
      base03 = "5c5c5c";
      base04 = "8d8d8d";
      base05 = "ffffff";
      base06 = "ececec";
      base07 = "cecece";
      base08 = "a4a4a4";
      base09 = "9b9b9b";
      base0A = "b6b6b6";
      base0B = "b0b0b0";
      base0C = "9b9b9b";
      base0D = "8d8d8d";
      base0E = "cecece";
      base0F = "ececec";
    };

    polarity = "dark";

    image = pkgs.fetchurl {
      url = "https://raw.githubusercontent.com/basecamp/omarchy/bec26eeab95277622dd1a21aea9d423bafa511b3/themes/vantablack/backgrounds/1-twisted-stairs.jpg";
      sha256 = "1nlns83nzhd4f6n91bnnafk2j77xlzrnbbw5jzdw6b47bq9ircvp";
    };
  };
}
