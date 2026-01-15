_: {
  plugins.lualine = {
    enable = true;
    settings = {
      sections = {
        lualine_x = [
          {
            __unkeyed-1 = {
              __raw = "require('noice').api.status.macro.get";
            };
            cond = {
              __raw = "require('noice').api.status.macro.has";
            };
          }
        ];
      };
    };
  };
}
