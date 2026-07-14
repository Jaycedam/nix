{
  pkgs,
  lib,
  system,
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

  # Widevine CDM for aarch64 (DRM support)
  home.file.".config/BraveSoftware/Brave-Browser/WidevineCdm/latest-component-updated-widevine-cdm" =
    lib.mkIf (system == "aarch64-linux")
      {
        text = ''{"Path":"${pkgs.widevine-cdm}/share/google/chrome/WidevineCdm"}'';
      };
}
