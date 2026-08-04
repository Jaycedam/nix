{
  nixpkgs.overlays = [
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
