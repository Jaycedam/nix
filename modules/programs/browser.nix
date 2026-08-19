{pkgs, ...}: {
  environment.systemPackages = with pkgs; [brave-origin];

  # Manage brave via the chromium policy module (writes
  # /etc/brave/policies/managed/*.json, incl. ExtensionInstallForcelist)
  programs.chromium = {
    enable = true;
    extensions = [
      "ghmbeldphafepmbegfdlkpapadhbakde" # protonpass
      "eimadpbcbfnmbkopoojfekhnkhdbieeh" # dark reader
      "hfjbmagddngcpeloejdejnfgbamkjaeg" # vimium
      "mnjggcdmjocbbbhaepdhchncahnbgone" # sponsorblock
    ];
  };
}
