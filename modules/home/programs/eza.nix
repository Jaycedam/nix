_: {
  programs.eza = {
    enable = true;
    enableFishIntegration = true;
    colors = "auto";
    icons = "auto";
    extraOptions = [
      "--group-directories-first"
      "--header"
    ];
  };
}
