{
  lib,
  pkgs-unstable,
  pkgs-pinned,
  ...
}:
let
  unstablePackages = [
    "kopuz"
    "antigravity-cli"
    "wpaperd" # set cmd is on 1.3.0
    "grok-build"
    "neovim"
    "vimPlugins"
  ];
  pinnedPackages = [
    "rpcs3"
  ];
in
{
  nixpkgs.overlays = [
    # packages to pull from nixpkgs-unstable instead of the default nixpkgs
    (final: prev: lib.genAttrs unstablePackages (name: pkgs-unstable.${name}))
    # packages to pull from a pinned nixpkgs. Useful for pkgs that have no bin cache
    (final: prev: lib.genAttrs pinnedPackages (name: pkgs-pinned.${name}))

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

    # Duckstation appimage
    (
      final: prev:
      let
        v = "0.1-11515";
        src = prev.fetchurl (
          if prev.stdenv.hostPlatform.system == "aarch64-linux" then
            {
              url = "https://github.com/stenzek/duckstation/releases/download/v${v}/DuckStation-arm64.AppImage";
              hash = "sha256-MlV2V3+lC8bVbH9wx/Nypby6nZ1F9L5tJphhj3pau1Y=";
            }
          else
            {
              url = "https://github.com/stenzek/duckstation/releases/download/v${v}/DuckStation-x64.AppImage";
              hash = "sha256-2i30TQrRknlSJ2bl5z9I8olag5EQEwdWeY+7P5TIK0Y=";
            }
        );
        extracted = prev.appimageTools.extractType2 {
          pname = "duckstation";
          version = v;
          inherit src;
        };
      in
      {
        duckstation = prev.appimageTools.wrapType2 {
          pname = "duckstation";
          version = v;
          inherit src;
          extraInstallCommands = ''
            mkdir -p $out/share/applications $out/share/icons/hicolor/256x256/apps
            cp ${extracted}/*.desktop $out/share/applications/
            substituteInPlace $out/share/applications/*.desktop \
              --replace 'Exec=duckstation-qt' 'Exec=duckstation' \
              --replace 'TryExec=duckstation-qt' 'TryExec=duckstation'
            cp ${extracted}/*.png $out/share/icons/hicolor/256x256/apps/
          '';
          meta = {
            description = "PS1 emulator";
            homepage = "https://github.com/stenzek/duckstation";
            mainProgram = "duckstation";
          };
        };
      }
    )
  ];
}
