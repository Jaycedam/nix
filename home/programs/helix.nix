{
  programs.helix = {
    enable = true;
    settings = {
      editor = {
        scrolloff = 10;
        cursorline = true;
        popup-border = "all";
        # TODO: adjust for colemak-dh
        jump-label-alphabet = "abcdefghijklmnopqrstuvwxyz";
        soft-wrap.enable = true;
        end-of-line-diagnostics = "hint";
        inline-diagnostics.cursor-line = "warning";
        statusline = {
          left = [
            "mode"
            "spacer"
            "version-control"
            "spinner"
          ];
        };
        cursor-shape = {
          insert = "bar";
          select = "underline";
        };
      };
      keys.normal = {
        "-" = [
          ":sh rm -f /tmp/unique-file"
          ":insert-output yazi '%{buffer_name}' --chooser-file=/tmp/unique-file"
          ":sh printf '\x1b[?1049h\x1b[?2004h' > /dev/tty"
          ":open %sh{cat /tmp/unique-file}"
          ":redraw"
        ];
      };
    };

    # https://github.com/helix-editor/helix/blob/master/languages.toml
    languages.language = [
      {
        name = "nix";
        indent = {
          tab-width = 2;
          unit = "  ";
        };
        auto-format = true;
        formatter.command = "alejandra";
      }
    ];
  };
}
