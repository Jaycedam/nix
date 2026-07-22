{
  pkgs,
  lib,
  host,
  ...
}:
let
  # Symlink WidevineCDM to brave output
  bravePkg =
    if pkgs.stdenv.hostPlatform.system == "aarch64-linux" then
      pkgs.brave.overrideAttrs (old: {
        installPhase = (old.installPhase or "") + ''
          ln -s ${pkgs.widevine-cdm}/share/google/chrome/WidevineCdm $out/opt/brave.com/brave/WidevineCdm
        '';
      })
    else
      pkgs.brave;
in
{
  environment.systemPackages = [
    bravePkg
  ];

  # Manage brave via the chromium policy module (writes
  # /etc/brave/policies/managed/*.json, incl. ExtensionInstallForcelist)
  programs.chromium = {
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
