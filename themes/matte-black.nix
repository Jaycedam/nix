{ pkgs, ... }: {
  config.stylix = {
    base16Scheme = {
      base00 = "121212";
      base01 = "333333";
      base02 = "515151";
      base03 = "8a8a8d";
      base04 = "8a8a8d";
      base05 = "bebebe";
      base06 = "eaeaea";
      base07 = "ffffff";
      base08 = "D35F5F";
      base09 = "FFC107";
      base0A = "f59e0b";
      base0B = "bebebe";
      base0C = "8a8a8d";
      base0D = "e68e0d";
      base0E = "b91c1c";
      base0F = "b90a0a";
    };

    polarity = "dark";

    image = pkgs.fetchurl {
      url = "https://raw.githubusercontent.com/basecamp/omarchy/bec26eeab95277622dd1a21aea9d423bafa511b3/themes/matte-black/backgrounds/1-dark-waters.jpg";
      sha256 = "0wil213450p6gbpdymsdpx8bcd6hwg6p9vskgipnd97b99qm42gj";
    };
  };
}
