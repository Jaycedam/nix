{ ... }:
{
  # launch-webapp just takes the domain as arg,
  # check the code in scripts/system/launch-webapp.nix
  xdg.desktopEntries = {
    proton-mail = {
      name = "Proton Mail";
      genericName = "Mail";
      exec = "launch-webapp mail.proton.me";
      categories = [
        "Network"
        "Email"
      ];
      mimeType = [ "x-scheme-handler/mailto" ];
    };

    proton-drive = {
      name = "Proton Drive";
      genericName = "Cloud Storage";
      exec = "launch-webapp drive.proton.me";
      categories = [
        "Network"
        "Utility"
      ];
    };

    proton-calendar = {
      name = "Proton Calendar";
      genericName = "Calendar";
      exec = "launch-webapp calendar.proton.me";
      categories = [
        "Office"
        "Calendar"
      ];
      mimeType = [ "x-scheme-handler/webcal" ];
    };

    whatsapp = {
      name = "WhatsApp";
      genericName = "Messaging Client";
      exec = "launch-webapp web.whatsapp.com";
      categories = [
        "Network"
        "InstantMessaging"
      ];
      mimeType = [ "x-scheme-handler/whatsapp" ];
    };

    spotify = {
      name = "Spotify";
      genericName = "Music Streaming";
      exec = "launch-webapp open.spotify.com";
      categories = [
        "AudioVideo"
        "Audio"
      ];
      mimeType = [ "x-scheme-handler/spotify" ];
    };

    youtube = {
      name = "YouTube";
      genericName = "Video Streaming";
      exec = "launch-webapp youtube.com";
      categories = [
        "AudioVideo"
        "Audio"
      ];
    };
  };
}
