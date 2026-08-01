{
  lib,
  inputs,
  pkgs-unstable,
  ...
}:
let
  asahiUnstable = [
    "linux-asahi"
    "uboot-asahi"
    "m1n1"
    "asahi-audio"
    "alsa-ucm-conf-asahi"
    "speakersafetyd"
    "mesa"
  ];
in
{
  nixpkgs.overlays = [
    # apple-silicon input uses unstable nixpkgs so we need an overlay
    (
      final: prev:
      lib.genAttrs asahiUnstable (
        name: (pkgs-unstable.extend inputs.apple-silicon.overlays.default).${name}
      )
    )
    # fix scaling for ryubing
    (final: prev: {
      ryubing = prev.ryubing.overrideAttrs (old: {
        makeWrapperArgs = (old.makeWrapperArgs or [ ]) ++ [
          "--set AVALONIA_GLOBAL_SCALE_FACTOR 2"
        ];
      });
    })
  ];
}
