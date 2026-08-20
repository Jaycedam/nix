{lib, ...}: {
  # shared user settings across modules
  options.userSettings.borderRadius = lib.mkOption {
    type = lib.types.int;
    default = 0;
    description = "Border radius in pixels applied to corners across modules";
  };
}
