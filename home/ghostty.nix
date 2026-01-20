{ pkgs, darwin, ... }:
{
  programs.ghostty = {
    enable = true;
    # override pkg based on darwin bool (set on profiles)
    package = if darwin then pkgs.ghostty-bin else pkgs.ghostty;
    settings = {
      mouse-hide-while-typing = "true";
      background-blur = "true";
    };
  };
}
