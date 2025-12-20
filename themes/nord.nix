{ pkgs, ... }: {
  config.stylix = {
    base16Scheme = {
      base00 = "2e3440";
      base01 = "3b4252";
      base02 = "3b4252";
      base03 = "4c566a";
      base04 = "e5e9f0";
      base05 = "d8dee9";
      base06 = "d8dee9";
      base07 = "eceff4";
      base08 = "bf616a";
      base09 = "bf616a";
      base0A = "ebcb8b";
      base0B = "a3be8c";
      base0C = "88c0d0";
      base0D = "81a1c1";
      base0E = "b48ead";
      base0F = "ebcb8b";
    };

    polarity = "dark";

    image = pkgs.fetchurl {
      url = "https://raw.githubusercontent.com/basecamp/omarchy/bec26eeab95277622dd1a21aea9d423bafa511b3/themes/nord/backgrounds/1-city-view.png";
      sha256 = "0l7icacsap782yf730kjgndg8f6qwbwr64wwbblkag51am5a5p6w";
    };
  };
}
