{
  pkgs,
  config,
  ...
}:
{
  services.greetd = {
    enable = true;
    settings = {
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
