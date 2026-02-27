{
  pkgs,
  config,
  compositor,
  user,
  ...
}:
{
  services.greetd = {
    enable = true;
    useTextGreeter = true;
    settings = {
      initial_session = {
        inherit user;
        command =
          if compositor == "niri" then
            "niri-session"
          else if compositor == "mango" then
            "exec mango"
          else
            throw "Unsupported compositor: ${compositor}";
      };
      default_session = {
        user = "greeter";
        command = "${pkgs.tuigreet}/bin/tuigreet --time --asterisks --remember --remember-session --sessions ${config.services.displayManager.sessionData.desktops}/share/wayland-sessions";
      };
    };
  };

  # greetd frontend
  environment.systemPackages = with pkgs; [
    tuigreet
  ];
}
