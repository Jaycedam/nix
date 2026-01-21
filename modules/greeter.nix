{
  pkgs,
  user,
  config,
  ...
}:
{
  services.greetd = {
    enable = true;
    settings = {
      initial_session = {
        command = "${pkgs.niri}/bin/niri-session";
        inherit user;
      };
      default_session = {
        command = "${pkgs.tuigreet}/bin/tuigreet --time --asterisks --remember --remember-session --sessions ${config.services.displayManager.sessionData.desktops}/share/wayland-sessions";
        user = "greeter";
      };
    };
  };

  # greetd frontend
  environment.systemPackages = with pkgs; [
    tuigreet
  ];
}
