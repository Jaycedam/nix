{
  inputs,
  pkgs,
  ...
}:
{
  home.packages = with pkgs; [
    grok-build
  ];

  programs = {
    antigravity-cli.enable = true;
    codex.enable = true;

    opencode = {
      enable = true;
      tui.attention = {
        enabled = true;
        sound = false;
      };
      settings = {
        permission = {
          external_directory = {
            "/nix/store/**" = "allow";
            "/tmp/**" = "allow";
            "~/.config/**" = "allow";
          };
          edit = {
            "/nix/store/**" = "deny";
            "~/.config/**" = "ask";
          };
        };
      };
      skills.caveman = "${inputs.caveman}/skills/caveman";
    };
  };
}
