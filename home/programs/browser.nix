{pkgs, ...}: {
  programs.brave = {
    package = pkgs.brave-origin;
    enable = true;
    extensions = [
      "ghmbeldphafepmbegfdlkpapadhbakde" # protonpass
      "eimadpbcbfnmbkopoojfekhnkhdbieeh" # dark reader
      "hfjbmagddngcpeloejdejnfgbamkjaeg" # vimium
      "mnjggcdmjocbbbhaepdhchncahnbgone" # sponsorblock
    ];
  };
}
