_: {
  services = {
    openssh = {
      enable = true;
      startWhenNeeded = true;
    };

    # gnome virtual filesystem for nautilus and other gnome apps
    gvfs.enable = true;

    # Power management with profiles
    tuned = {
      enable = true;
      settings.dynamic_tuning = true;
    };

    udisks2.enable = true; # this is necessary for udiskie to work

    sunshine = {
      enable = true;
      openFirewall = true;
    };
  };
}
