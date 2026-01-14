{ ... }:
{
  programs.chromium = {
    # enables policy config, not for installing chromium
    enable = true;
    extensions = [
      "eimadpbcbfnmbkopoojfekhnkhdbieeh" # dark reader
      "dbepggeogbaibhgnhhndojpepiihcmeb" # vimium
      "ghmbeldphafepmbegfdlkpapadhbakde" # protonpass
      "mnjggcdmjocbbbhaepdhchncahnbgone" # sponsorblock
    ];
    extraOpts = {
      "BraveRewardsDisabled" = true;
      "BraveWalletDisabled" = true;
      "BraveVPNDisabled" = true;
      "BraveNewsDisabled" = true;
      "BraveTalkDisabled" = true;
      "BraveP3AEnabled" = false; # Disables P3A analytics
      "BraveStatsPingEnabled" = false;
      "BraveWebDiscoveryEnabled" = false;
      "NTPMiddleSlotAnnouncementVisible" = false;
      "PromotionsEnabled" = false;
      "MemorySaverModeSavings" = 2; # Max memory savings (discard tabs faster)
      "PasswordManagerEnabled" = false;
      "SpellcheckEnabled" = true;
      "SpellcheckLanguage" = [
        "en-US"
        "es-419"
      ];
      "SafeBrowsingExtendedReportingEnabled" = false;
      "UrlKeyedAnonymizedDataCollectionEnabled" = false;
      "FeedbackSurveysEnabled" = false;
      "AutofillAddressEnabled" = false;
      "AutofillCreditCardEnabled" = false;
      "BrowserSignin" = 0; # Disables browser sign-in
      # "BraveAIChatEnabled" = false;
      "TorDisabled" = true;
      "MediaRecommendationsEnabled" = true;
      "ShoppingListEnabled" = false;
    };
  };
}
