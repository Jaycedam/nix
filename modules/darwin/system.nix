{ user, ... }:
{
  system = {
    primaryUser = user;
    keyboard = {
      enableKeyMapping = true;
      remapCapsLockToEscape = true;
    };
    defaults = {
      screensaver.askForPasswordDelay = 3;
      screencapture.location = "~/Pictures/screenshots";
      controlcenter.BatteryShowPercentage = true;
      menuExtraClock.ShowAMPM = false;
      NSGlobalDomain = {
        #_HIHideMenuBar = true;
        AppleIconAppearanceTheme = "RegularDark";
        AppleInterfaceStyle = "Dark";
        NSAutomaticSpellingCorrectionEnabled = false;
        InitialKeyRepeat = 15;
        KeyRepeat = 2;
      };
      WindowManager.EnableStandardClickToShowDesktop = false;
      finder = {
        ShowStatusBar = true;
        _FXSortFoldersFirst = true;
        _FXShowPosixPathInTitle = true;
        AppleShowAllExtensions = true;
        AppleShowAllFiles = true;
        CreateDesktop = false;
        FXDefaultSearchScope = "SCcf";
        FXPreferredViewStyle = "clmv";
        NewWindowTarget = "Home";
        ShowExternalHardDrivesOnDesktop = false;
        ShowRemovableMediaOnDesktop = false;
        ShowPathbar = true;
      };
      dock = {
        autohide = true;
        autohide-delay = 0.1;
        mru-spaces = false;
        show-recents = false;
        showhidden = true;
        static-only = true;
        wvous-br-corner = 1;
        wvous-tl-corner = 1;
        wvous-tr-corner = 1;
        wvous-bl-corner = 1;
      };
    };

  };
}
