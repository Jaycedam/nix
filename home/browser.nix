{
  lib,
  host,
  pkgs,
  ...
}:
{
  programs.brave = {
    package = pkgs.brave-origin;
    enable = true;
    extensions = [
      "ghmbeldphafepmbegfdlkpapadhbakde" # protonpass
      "eimadpbcbfnmbkopoojfekhnkhdbieeh" # dark reader
      "hfjbmagddngcpeloejdejnfgbamkjaeg" # vimium
      "mnjggcdmjocbbbhaepdhchncahnbgone" # sponsorblock
    ]
    ++ lib.optionals (host == "asahi") [
      "aleakchihdccplidncghkekgioiakgal" # h264ify, asahi video decoder is wip
    ];
  };
}
