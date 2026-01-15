_: {
  programs.fish = {
    enable = true;
    functions = {
      fish_prompt = ''
        set -l host (prompt_login)
        set -l pwd (set_color cyan)(prompt_pwd)
        set -l git (set_color yellow)(fish_git_prompt " %s")
        set -l icon (set_color blue)"❯ "

        if contains -- --final-rendering $argv
          string join "" -- $icon
        else
          string join "" -- $host " " $pwd $git " " $icon
        end
      '';
    };
    interactiveShellInit = ''
      set fish_greeting ""
      set -g fish_transient_prompt 1
    '';

    shellAbbrs = {
      v = "nvim";
      n = "nvim";
      h = "hx";
      ll = "ls -lA";
      oc = "opencode";
    };
  };
}
