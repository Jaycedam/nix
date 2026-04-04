{
  pkgs,
  lib,
  system,
  ...
}:
{
  programs.brave = {
    enable = true;
    extensions = [
      "eimadpbcbfnmbkopoojfekhnkhdbieeh" # dark reader
      "hfjbmagddngcpeloejdejnfgbamkjaeg" # vimium
      "ghmbeldphafepmbegfdlkpapadhbakde" # protonpass
      "mnjggcdmjocbbbhaepdhchncahnbgone" # sponsorblock
    ];
  };

  # Widevine CDM for aarch64 (DRM support)
  home.file.".config/BraveSoftware/Brave-Browser/WidevineCdm/latest-component-updated-widevine-cdm" =
    lib.mkIf (system == "aarch64-linux")
      {
        text = ''{"Path":"${pkgs.widevine-cdm}/share/google/chrome/WidevineCdm"}'';
      };
}
