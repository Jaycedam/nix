{ ... }:
{
  # Configure keymap in X11
  services.xserver.xkb = {
    layout = "us";
    variant = "colemak_dh_iso";
  };

  console = {
    useXkbConfig = true;
    earlySetup = true;
  };

}
