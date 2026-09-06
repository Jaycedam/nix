{pkgs, ...}: {
  programs = {
    niri = {
      enable = true;
      useNautilus = false;
    };
  };

  environment = {
    systemPackages = with pkgs; [
      xwayland-satellite
    ];
  };
}
