{ pkgs, ... }: {
  config.stylix = {
    base16Scheme = {
      base00 = "111c18";
      base01 = "23372B";
      base02 = "23372B";
      base03 = "53685B";
      base04 = "F6F5DD";
      base05 = "C1C497";
      base06 = "D7C995";
      base07 = "9eebb3";
      base08 = "FF5345";
      base09 = "db9f9c";
      base0A = "459451";
      base0B = "549e6a";
      base0C = "2DD5B7";
      base0D = "509475";
      base0E = "D2689C";
      base0F = "E5C736";
    };

    polarity = "dark";

    image = pkgs.fetchurl {
      url = "https://raw.githubusercontent.com/basecamp/omarchy/bec26eeab95277622dd1a21aea9d423bafa511b3/themes/osaka-jade/backgrounds/1-glowing-city.jpg";
      sha256 = "1s9v3wh7k3yn7wkyri2xw7aj7v0sik7414drff5piphb54sv5z13";
    };
  };
}
