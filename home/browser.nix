{
  lib,
  host,
  ...
}:
{
  programs.brave = {
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
