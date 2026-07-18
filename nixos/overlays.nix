{ lib, pkgs-unstable, ... }:
let
  unstablePackages = [
    "kopuz"
    "antigravity-cli"
    "wpaperd" # set cmd is on 1.3.0
    "grok-build"
  ];
in
{
  nixpkgs.overlays = [
    # packages to pull from nixpkgs-unstable instead of the default nixpkgs
    (final: prev: lib.genAttrs unstablePackages (name: pkgs-unstable.${name}))

    # gstreamer fix for nautilus, prevents installing the plugins manually
    (final: prev: {
      nautilus = prev.nautilus.overrideAttrs (nprev: {
        buildInputs =
          nprev.buildInputs
          ++ (with final.gst_all_1; [
            gst-plugins-good
            gst-plugins-bad
          ]);
      });
    })
  ];
}
