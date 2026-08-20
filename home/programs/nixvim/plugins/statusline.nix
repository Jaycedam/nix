{
  plugins.lualine = {
    enable = true;
    settings = {
      options = {
        section_separators = "";
        component_separators = "";
      };
      sections = {
        lualine_x = [
          {
            __unkeyed-1.__raw = ''
              function()
                  local reg = vim.fn.reg_recording()
                  if reg == "" then
                      return ""
                  end
                  return "󰝥 rec: " .. reg
              end
            '';
          }
          "filetype"
          {
            __unkeyed-1.__raw = ''
              function()
                  return "󰉋 " .. vim.fn.fnamemodify(vim.fn.getcwd(), ":t")
              end
            '';
          }
        ];
      };
    };
  };
}
