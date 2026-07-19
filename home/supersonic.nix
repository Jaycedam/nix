{ pkgs, ... }: {
  home.packages = [ pkgs.supersonic ];

  xdg.configFile."supersonic/themes/amoled.toml".text = ''
    [SupersonicTheme]
    Name = "AMOLED"
    Version = "0.2"
    SupportsDark = true
    SupportsLight = false

    [DarkColors]
    PageBackground = "#000000"
    InputBackground = "#000000"
    InputBorder = "#FFFFFF1A"
    MenuBackground = "#000000"
    OverlayBackground = "#000000"
    Pressed = "#FFFFFF1A"
    Hyperlink = "#ffffff"
    ListHeader = "#ffffff0D"
    PageHeader = "#000000"
    Background = "#000000"
    ScrollBar = "#FFFFFF1A"
    Button = "#000000"
    DisabledButton = "#000000"
    Separator = "#FFFFFF1A"
    Foreground = "#FFFFFF"
    Hover = "#1A1A1A"
  '';
}
